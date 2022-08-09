;; 
;n =	0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	...
;xn =	0	1	1	2	3	5	8	13	21	34	55	89	144	233	377	...


(defun fibseq (n)
  (assert (> n 0))
  (cond ((eq n 1) '(0 0))
        ((eq n 2) '(1 0))
        (t (let ((temp (fibseq (- n 1))))
             (cons (+ (first temp) (second temp)) temp)))))

(defun fib (n)
  (let ((seq (fibseq n)))
    (+ (first seq) (second seq))))