(defun fib (n)
  (let ((fseq (make-instance 'fib-seq)))
    (fseq n)
    (let ((lis (fetch-outputs fseq)))
      (let ((result (+ (first lis) (second lis))))
        (send fib 