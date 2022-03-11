#!/bin/bash
set -x
echo top
duct=/tmp/ductHello
rm -f ${duct}
mkfifo ${duct}
echo helloduct >${duct} &
./sub.bash <${duct}
