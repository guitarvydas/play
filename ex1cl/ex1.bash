#!/bin/bash
pipe=pipe${RANDOM}
mkfifo ${pipe}

./hello.bash 5>${pipe} &
pidhello=$!
./display.bash 6<${pipe} &
piddisplay=$!

wait ${pidhello}
wait ${piddisplay}
rm ${pipe}


(let ((channel (make-black-channel))
      (hello-leaf (make-leaf 'hello))
      (display-leaf (make-leaf 'display)))
 (connect hello-leaf channel display-leaf)
 (dispatch (list hello-leaf display-leaf))

 "hello" -> display $1

 (defun hello ()
  "hello")

 (defun display ()
  (let (($1 (receive)))
   (format *standard-output* "~a~%" $1)))

 

   
     
       
