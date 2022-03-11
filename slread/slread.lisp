(defun slread (string index)
  (let ((c (aref string index)))
    
(defun slread (string index)
  (let ((c string[index]))
    (cond ((c == '(')
	      (incf index)
	      (let (({objindex string index} <= (listead string index)))
		{string index} <= (need ')' string index)
	        {objindex string index}))
	  ((c == ")")
	   (parseerror string index))
	  (t 
	    {objindex string index} <= (readatom string index)
	    {objindex string index}))))

    
(defcomp slscanner ()
  (let (string index)
    (entry initialize (str) ()
	 (setf string str)
	 (setf index 0))
    (entry read () (object)
	 (setf c (nextchar))
	 (cond ((char= c #\() (readlist))
	       ((char= c #\)) (parsefail "extra rpar"))
	       (t (readatom))))
      (contained nextchar () ((ortype character 'EOF))
	  (cond ((>= index (length string))
		 (setf index 'EOF)
		 'EOF)
		(t (setf c string[index])
		   (incf index)
		   c)))
      (contained readatom () (object)
	  (setf object-pointer atomindex)
	  (setf c (nextchar))
	  (while (not (terminated))
	      (cond-char
		 (#\(       (decf index) (finish))
		 (#\)       (parsefail "extra rpar"))
		 (t         (pokeatomchar c) (setf c (nextchar)))))
	  (contained finish () (object)
	    (nil-previous-atom)
	    object-pointer))
      (contained readlist () (object)
	  (setf c (nextchar))
	  (let inner (cond ((terminated) (parsefail "unterminated list"))
			   ((char= $\( c) (readlist))
			   (t (readatom)))
		(need-rpar)
		(cons inner (readlist)))


(defsynchronous scanner (initialize read) (object error) (cons consatom $NIL)
  var text
  var index
  (entry initialize (string)
	 text = string
         index = 0)
  (def nextchar ()
    (cond ((terminated?) (setf index -1) $NIL)
          (else          (let ((c text[index])) (incf index) c))))
  (def terminated? () (>= index (length text)))
  (contain
    (entry read ()
       (cond ((terminated?) (send error "EOF"))
	     (t (let ((c (nextchar)))
		  (cond ((=? "(" c) (readlist))
			(else       (readatom)))))))
    (def readlist () (child error) (cons)
      (def rl ((c text[index]))
         (cond ((=? "(" c) (let ((i (readlist))) (need ")") (send (cons i $NIL) child)))
               ((=? ")" c) (send "extra rpar" error))
               (else       (send (readatom) child))))
      (rl (child -> object) (error -> error)))
    (def readatom () (child error) (consatom)
      (let ((pointer
	(cond ((terminated?)        (consatom pointer $NIL))
              ((next-is-character?) (consatom pointer (readatom)))
	      (else                 (consatom pointer $NIL)))))
	pointer))
				    