#!/bin/bash
set -x
echo sub
input=/dev/fd/0
cat - <${input}
