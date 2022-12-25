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


(defun $ir.resetArgs ()
  (reset (dty _ 'args _ _)))

(defun $ir.createTemp ()
  (setf *temp* (cons nil *temp*)))

(defun $ir.resetTemps ()
  (reset (dty _ 'temp _ _)))

(defun $ir.functionEnd (name n)
  ($ir.resetTemps)
  (setf *args* (nthcdr n *args*)))

(defun $ir.functionBegin (name n)
  ($id.resetTemps))

(defun $ir.createTemp (name ty)
  (let ((newtemp `(name . ((name ,name) (type ,ty) (value ,nil)))))
    (push newtemp *temp*)))

(defun $ir0.initialize (dd val)
  (assign dd val))

(defun operand (dd)
  (let ((base (base dd)))
