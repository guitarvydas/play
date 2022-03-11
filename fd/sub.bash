#!/bin/bash
set -x
echo sub
input=/dev/fd/7
#cat - <${input}
read xxxinput <${input}
echo ${xxxinput}
