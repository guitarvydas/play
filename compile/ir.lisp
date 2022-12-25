; $ir0.initialize
;; $ir.appendArg
;; $ir.assignArg
;; $ir.assignReturnInto
; $ir.functionBegin
; $ir.functionEnd
;; $ir.call
; $ir.createTemp
; $ir.resetTemps
;; $ir.endFunction
; $ir.resetArgs
;; $ir.return
;; $ir.returnVoid


(defparameter *args* nil)
(defparameter *code* nil)
(defparameter *bytes* (make-array 128))
(defparameter *temp* nil)
(defparameter *return* nil)

(defun $ir.resetArgs ()
  (setf *args* nil))

(defun $ir.createTemp ()
  (setf *temp* (cons nil *temp*)))

(defun $ir.resetTemps ()
  (setf *temp* nil))

(defun $ir.functionEnd (name n)
  ($ir.resetTemps)
  (setf *args* (nthcdr n *args*)))

(defun $ir.functionBegin (name n)
  )

(defun $ir.createTemp (name ty)
  (let ((newtemp `(name . ((name ,name) (type ,ty) (value ,nil)))))
    (push newtemp *temp*)))

(defun $ir0.initialize (dd val)
  (if (eq 'bytes (base dd))
      (let ((ix (displacement dd)))
	(setf (aref *bytes* ix) val))
    (assert nil))) ;; this version doesn't handle initializing anything but *bytes*

(defun operand (dd)
  (let ((base (base dd)))
