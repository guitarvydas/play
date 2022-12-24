all: lisp

lisp:
	sbcl --noinform --load ex1.lisp --eval '(%main nil nil nil nil)' --quit 2>/dev/null


ex1: ex1.c
	gcc -o ex1 ex1.c
