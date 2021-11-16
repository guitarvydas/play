#!/bin/bash
# docker build -t simple .
# testdir=`realpath ../tests`
# docker run -v "${testdir}/:/app" simple test1.txt

# docker build -t simple .
# fileInMyEnvironment=`realdir $1`
# docker run -v "${testdir}/:/app" simple test1.txt

docker build -t simple .
file1=../tests/test1.txt
fullname=`realpath ${file1}`
dir=`dirname ${fullname}`
fname=`basename ${file1}`
docker run -v "${dir}/:/app" simple /app/${fname}
