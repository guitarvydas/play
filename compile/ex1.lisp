(defun %identity (args temp code string)
  (let ((c (first args)))
    c))

(defun %main (args temp code string)
  (let ((args nil)
	(temp nil))
    (let ((temp (cons nil temp)))
      (let ((string (cons #\x string)))
	(let ((args (%append-arg (first string) args)))
	  (let ((result (%invoke "identity" args temp code string)))
	    (setf (first temp) result)
	    (let ((args nil))
	      (let ((temp (cons nil temp)))
		(let ((string (cons "result = %c\n" string)))
		  (let ((args (%append-arg (first string) args)))
		    (let ((args (%append-arg (second temp) args)))
		      (let ((result (%invoke "printf" args temp code string)))
			(setf (first temp) result)
			(values)))))))))))))


;; support
(defun %append-arg (v args)
  (reverse (cons v (reverse args))))

(defun replace-all (string part replacement &key (test #'char=))
  "Returns a new string in which all the occurences of the part 
is replaced with replacement."
  (with-output-to-string (out)
    (loop with part-length = (length part)
          for old-pos = 0 then (+ pos part-length)
          for pos = (search part string
                            :start2 old-pos
                            :test test)
          do (write-string string out
                           :start old-pos
                           :end (or pos (length string)))
          when pos do (write-string replacement out)
          while pos)))

(defun %invoke (name args temp code string)
  (let ((f (cdr (assoc name code :test 'string-equal))))
    (format *standard-output* "f=~a~%" f)
    (funcall f args temp code string)))
    
;; testing

(defun %test ()
  (let ((!printf (lambda (args temp code string)
                   ;; need to replace \n by ~%
                   ;; need to replace %c by ~a
                   (let ((s (first args)))
                     (let ((s2 (replace-all s "%c" "~a")))
                       (let ((format-string (replace-all s2 "\n" "~%")))
                         (apply 'format *standard-output* format-string (rest args))))))))
    (let ((code (cons (cons "printf" !printf) '(("identity" . %identity) ("main" . %main)))))
      (%main nil nil code nil))))
  
