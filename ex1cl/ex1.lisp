(defun top ()
  (let (($channel (make-channel)))
    (let (($connection (list hello $channel $display)))
    (dispatcher $connection)
	



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

