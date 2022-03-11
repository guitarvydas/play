#!/bin/bash
set -x
echo sub
input=/dev/fd/7
cat - <$input
