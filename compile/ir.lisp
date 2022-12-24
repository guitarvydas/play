;; $ir0.initialize
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
(defparameter *bytes* nil)
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
  (setf *code* (cons name 
  )
  
