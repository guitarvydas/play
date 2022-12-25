(defparameter *identity* '(
			   ($ir.functionBegin "identity" 1)
			   ($ir.return (char (dd 1 param "c")))
			   ($ir.functionEnd "identity" 1)
			   )
  )

;;int main (int argc, char **argv) {
(defparameter *main* '(
		       ($ir.functionBegin "main" 2)
		       ;;  char x = identity ('x');
		       ($ir.resetArgs)
		       ($ir.createTemp "%0" (char (dd 1 temp "%0" "")))
		       ($ir0.initialize (char (dd 0 bytes 0 _)) "x")
		       ($ir.assignArg 0 (char (dd 0 bytes 0 _)))
		       ($ir.call (dd 1 code "identity" "identity"))
		       ($ir.assignReturnInto 0 (char (dd 1 temp "%0" "")))
		       ;;  printf ("result = %c\n", x);
		       ($ir.resetArgs)
		       ($ir.createTemp "%1" (char (dd 1 temp "%1" "%1")))
		       ($ir0.initialize (char (dd 0 bytes 2 _)) "result = %c\n")
		       ($ir.assignArg 0 (char (dd 0 bytes 2 _)))
		       ($ir.appendArg (char (dd 1 temp "%0" "")))
		       ($ir.call (dd 1 code "printf" "printf"))
		       ($ir.assignReturnInto 0 (void (dd 0 temp "%1" _)))
		       ($ir.returnVoid)
		       ;; }
		       ($ir.functionEnd "main" 2)
		       )
  )



(defparameter *main* '(
		       ($ir.functionBegin "main" 2)
		       ;;  char x = identity ('x');
		       ($ir.resetArgs)
		       ($ir.createTemp "%0" (dty 'char 1 'temp "%0" ""))
		       ($ir0.initialize (dty 'char 0 'bytes 0 _) "x")
		       ($ir.assignArg 0 (dty 'char 0 'bytes 0 _))
		       ($ir.call (dty 'function 1 'code "identity" "identity"))
		       ($ir.assignReturnInto 0 (dty 'char 1 'temp "%0" ""))
		       ;;  printf ("result = %c\n", x);
		       ($ir.resetArgs)
		       ($ir.createTemp "%1" (dty 'char 1 'temp "%1" "%1"))
		       ($ir0.initialize (dty 'char 0 'bytes 2 _) "result = %c\n")
		       ($ir.assignArg 0 (dty 'char 0 'bytes 2 _))
		       ($ir.appendArg (dty 'char 1 temp "%0" ""))
		       ($ir.call (dty 'function 1 'code "printf" "printf"))
		       ($ir.assignReturnInto 0 (dty 'void 0 temp "%1" _))
		       ($ir.returnVoid)
		       ;; }
		       ($ir.functionEnd "main" 2)
		       )
  )



