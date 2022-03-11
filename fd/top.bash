#!/bin/bash
set -x
echo top
duct=ductHello_${RANDOM}
rm -f ${duct}
mkfifo ${duct}
echo helloduct7g >${duct} &
./sub.bash 7<${duct}
