(defun main ()
  (with-open-file (f "/dev/fd/5" :direction :input)
    (let ((text (read f nil nil)))
      (format *standard-output* "[cl display]: ~a~%" text))))
  (with-open-file (f "/dev/fd/6" :direction :output)
    (let ((text (read f nil nil)))
      (format *standard-output* "done~%" text))))

