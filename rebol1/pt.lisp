;; An interpreter environment will be a lists of frames, and each frame is an association list of variable bindings.

(defun lookup (environment symbol)
  (cond ((consp environment)
         (let ((probe (assoc symbol (car environment))))
           (if probe
               (cdr probe)
               (lookup (cdr environment) symbol))))
        ((null environment) (error "Unbound variable."))
        (t (error "Bogus environment."))))

(defun extend-environment (environment formals values)
  (cons (map 'list #'cons formals values) environment))

;;define mutates the topmost frame of the environment.

(defun environment-define! (environment symbol value)
  (cond ((consp environment)
         (let ((probe (assoc symbol (car environment))))
           (if probe
               (setf (cdr probe) value)
             (let ((new-env (acons symbol value (car environment))))
               (setf (car environment) new-env)))))
        ((null environment) (error "No environment."))
        (t (error "Bogus environment."))))

;; We'll use Lisp procedures to represent REBOL primitives. The initial environment will have a few built-in primitives:

(defun initial-environment ()
  (extend-environment
   nil
   '(add
     lessp
     mult
     print
     sub
     sub1
     zerop)
   (list #'+
         #'<
         #'*
         #'print
         #'-
         #'1-
         #'zerop)))

;; A closure is a three-tuple

(defclass closure ()
  ((arguments :initarg :arguments :reader closure-arguments)
   (body :initarg :body :reader closure-body)
   (environment :initarg :environment :reader closure-environment)))

;; An applicable object is either a function or a closure.

(deftype applicable () '(or closure function))

;; We need to know how many arguments a function takes. We keep a table of the argument count for the primitives

(defparameter +primitive-arity-table+ (make-hash-table :test #'eq))

(eval-when (:load-toplevel :execute)
  (setf (gethash #'* +primitive-arity-table+) 2)
  (setf (gethash #'< +primitive-arity-table+) 2)
  (setf (gethash #'+ +primitive-arity-table+) 2)
  (setf (gethash #'- +primitive-arity-table+) 2)
  (setf (gethash #'1- +primitive-arity-table+) 1)
  (setf (gethash #'print +primitive-arity-table+) 1)
  (setf (gethash #'zerop +primitive-arity-table+) 1)
  )

(defun arity (applicable)
  (etypecase applicable
    (closure (length (closure-arguments applicable)))
    (function (or (gethash applicable +primitive-arity-table+)
                  (error "Unrecognized function.")))))

;; REBOL-EVAL-ONE takes a list of REBOL expressions and returns two values: the value of the leftmost expression in the list, and the list of remaining expressions.

(defun rebol-eval-one (expr-list environment)
  (if (null expr-list)
      (values nil nil)
      (let ((head (car expr-list)))
        (etypecase head

          ((or number string) (values head (cdr expr-list)))

          (symbol
           (case head

             (define
              (let ((name (cadr expr-list)))
                (multiple-value-bind (value tail) (rebol-eval-one (cddr expr-list) environment)
                  (environment-define! environment name value)
                  (values name tail))))

             (if
              (multiple-value-bind (pred tail) (rebol-eval-one (cdr expr-list) environment)
                (values (rebol-eval-sequence (if (null pred)
                                                 (cadr tail)
                                                 (car tail))
                                             environment)
                        (cddr tail))))

             (lambda
                 (values (make-instance 'closure
                          :arguments (cadr expr-list)
                          :body (caddr expr-list)
                          :environment environment)
                  (cdddr expr-list)))

             (otherwise
              (let ((value (lookup environment head)))
                (if (typep value 'applicable)
                    (rebol-eval-application value (cdr expr-list) environment)
                    (values value (cdr expr-list)))))))))))

;; If the leftmost symbol evaluates to something applicable, we find out how many arguments are needed, gobble them up, and apply the applicable:

(defun rebol-eval-n (n expr-list environment)
  (if (zerop n)
      (values nil expr-list)
      (multiple-value-bind (value expr-list*) (rebol-eval-one expr-list environment)
        (multiple-value-bind (values* expr-list**) (rebol-eval-n (1- n) expr-list* environment)
          (values (cons value values*) expr-list**)))))

(defun rebol-eval-application (function expr-list environment)
  (multiple-value-bind (arglist expr-list*) (rebol-eval-n (arity function) expr-list environment)
    (values (rebol-apply function arglist) expr-list*)))

(defun rebol-apply (applicable arglist)
  (etypecase applicable
    (closure  (rebol-eval-sequence (closure-body applicable)
                                   (extend-environment (closure-environment applicable)
                                                       (closure-arguments applicable)
                                                       arglist)))
    (function (apply applicable arglist))))

;; Evaluating a sequence is simply calling rebol-eval-one over and over until you run out of expressions:

(defun rebol-eval-sequence (expr-list environment)
  (multiple-value-bind (value expr-list*) (rebol-eval-one expr-list environment)
    (if (null expr-list*)
        value
        (rebol-eval-sequence expr-list* environment))))

;; Let's try it:

(defun testit ()
  (let ((env (initial-environment)))
    (rebol-eval-sequence
     '(
       define fib
              lambda (x)                         
              (if lessp x 2
                (x)
                (add fib sub1 x
                     fib sub x 2))
              
              define fact
              lambda (x)
              (if zerop x
                (1)
                (mult x fact sub1 x))
              
              define fact-iter
              lambda (x answer)
              (if zerop x
                (answer)
                (fact-iter sub1 x mult answer x))
              
              print fib 7
              print fact 6
              print fact-iter 7 1
              )
     env)
    env))

;; CL-USER> (testit)

;; 13 
;; 720 
;; 5040