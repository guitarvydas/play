#!/bin/bash
set -x
echo top
duct=/tmp/ductHello
rm -f $duct
mkfifo $duct
echo helloduct7b >$duct &
./sub.bash 7<$duct
