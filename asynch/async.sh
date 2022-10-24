cat - | echo


name=fifo_${RANDOM}
mkfifo ${name}
echo hello
