Rebol 1:
```
define fib
  lambda (x)                         
   (if lessp x 2
       (x)
       (add fib sub1 x
	    fib sub x 2))
```

Common Lisp
```
(defun fib (x)
  (if (< x 2)
     x
    (+ (fib (1- x)) (fib (- x 2)))))
```

Rebol 1:
```
     define fact
       lambda (x)
       (if zerop x
           (1)
           (mult x fact sub1 x))
```
Common Lisp:
```
(defun fact (x)
  (if (zerop x)
     1
    (* x (fact (1- x)))))
```

Rebol 1:
```
     define fact-iter
       lambda (x answer)
       (if zerop x
           (answer)
           (fact-iter sub1 x mult answer x))
```
Common Lisp
```
(defun fact-iter (x answer)
  (if (zerop x)
      answer
     (fact-iter (1- x (* answer x)))))
```
