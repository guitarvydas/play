#!/bin/bash
set -x
echo top
duct=/tmp/ductHello_${RANDOM}
rm -f ${duct}
mkfifo ${duct}
echo hello duct7 pipe >${duct} &
./sub.bash 7<${duct}
rm -f ${duct}
