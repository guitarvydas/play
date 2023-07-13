#lang racket

(require rackunit)


(define (lookup e symbol)
  "( e symbol -- item|error) Find symbol in environment."

  (display (format "Looking up ~a in ~a.~n" symbol e))
  (cond [(and (list? e) (not (empty? e)))
         (let ((probe (assoc symbol (first e))))
           (if probe
               (cdr probe)
               (lookup (rest e) symbol)))]
        [(null? e) (error "Unbound variable.")]
        [#t (error "Bogus environment.")]
        ))

(define (extend-environment e formals values)
  "( e formals values -- e') Add new values to environment e."

  (cons (map (λ (a b) (cons a b)) formals values)  e))

(let ([env
       (extend-environment
         (extend-environment '() '(x y z) '(1 2 3))
         '(a) '(99))])
  (check-equal? env '(((a . 99)) ((x . 1) (y . 2)(z . 3))))
  (check-equal? (lookup env 'y) 2)
  )


(define (environment-define! e symbol value)
  "( e symbol value -- e') Set symbol to value in top level environment e."
  
  (cond [(and (list? e) (not (empty? e)))
         (cons (dict-set (first e) symbol value) (rest e))]
        [(null? e) (error "No environment.")]
        [#t (error "Bogus environment.")]))

(let ([env '(((a . 33) (q . 44)) (x . 88))])
  (check-equal? (environment-define! env 'snort 'bort)
                '(((a . 33) (q . 44) (snort . bort)) (x . 88)))
  )


(define (1- x) (- x 1))  ; Compatibility.

(define (initial-environment)
  "( -- e) Set up function primitives."

  (extend-environment '()
                      '(add lessp mult print sub sub1 zerop)
                      (list + < = display - 1- zero?)))


(struct closure (arguments body environment))

(define (applicable? x) (or (closure? x) (procedure? x)))  ; predicate instead of type...

(define ARITY (hash
               * 2  < 2  + 2  - 2
               1- 1  display 1  zero? 1))

(define (arity a)
  "( a -- n|error) Determine arity of applicable a."

  (cond [(closure? a) (length (closure-arguments a))]
        [(procedure? a)
         (or (hash-ref ARITY a)
             (error "Unrecognized function."))])
  )


(define (rebol-eval-one exprs e)
  "( exprs e -- ) Evaluate first expression."

  (if (null? exprs)
      (values #f #f)
      (let ([head (first exprs)])
        (cond
          [(or (number? head) (string? head))  (values head (rest exprs))]
          [(symbol? head)
           (case head
             ('define
               (let ([name (first exprs)])
                 (let-values ([(value tail) (rebol-eval-one (cddr exprs) e)])
                   (environment-define! e name value)
                   (values name tail))))
             ('if
              (let-values ([(pred tail) (rebol-eval-one (cdr exprs) e)])
                (values (rebol-eval-sequence (if (null? pred)
                                                 (second tail)
                                                 (first tail))
                                             e)
                        (cddr tail))))
             ('lambda
                 (values (closure (second exprs) (third exprs) e)
                         (cdddr exprs)))
             (else
              (let ((value (lookup e head)))
                (if (applicable? value)
                    (rebol-eval-application value (rest exprs) e)
                    (values value (rest exprs)))))
              )]))
      ))


;; Note: Stack effect comments are dodgy starting from here...

(define (rebol-eval-n n exprs e)
  "( n exprs e -- value exprs')"

  (if (zero? n)
      (values '() exprs)
      (let-values ([(value exprs1) (rebol-eval-one exprs e)])
        (let-values ([(values1 exprs2) (rebol-eval-n (1- n) exprs1 e)])
          (values (cons value values1) exprs2)))))

(define (rebol-eval-application function exprs e)
  "( exprs e --) "

  (let-values ([(arglist exprs1) (rebol-eval-n (arity function) exprs e)])
    (values (rebol-apply function arglist) exprs1)))

(define (rebol-apply a arglist)
  "( a arglist --)"

  (cond
    [(closure? a) (rebol-eval-sequence (closure-body a)
                                       (extend-environment (closure-environment a)
                                                           (closure-arguments a)
                                                           arglist))]
    [(procedure? a) (apply a arglist)]))


(define (rebol-eval-sequence exprs e)
  "( exprs e -- )"

  (let-values ([(value exprs1) (rebol-eval-one exprs e)])
    (if (null? exprs1)
        value
        (rebol-eval-sequence exprs1 e))))


(define (testit)
  (rebol-eval-sequence
   '(
     print "-- hello!"     

     define fib
      lambda (x)
      (if lessp x 2
          (x)
          (add fib sub1 x
               fib sub x 2))
      print fib 7
      )
   (initial-environment)))
                        

