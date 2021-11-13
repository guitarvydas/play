#!/bin/bash
set -e
#trap 'catcherr' ERR
#trap 'catchint' SIGINT

catcherr () {
    echo '*** ERR in run.bash ***' " $?"
    kill -9 $pid3 $pid2 $pid1
    exit 1
}
catchint () {
    echo '*** SIGINT in run.bash ***'
    kill -9 $pid3 $pid2 $pid1
    exit 1
}

killprocesses() {
    kill -9 ${pidhello}
    kill -9 ${piddisplay}
    kill -9 ${pidstart}
    kill -9 ${pidignore}
}

waitprocesses() {
    wait ${pidhello}
    wait ${piddisplay}
    wait ${pidstart}
    wait ${pidignore}
}

rmpipes() {
    rm -f ${pipe}
    rm -f ${start}
    rm -f ${ignore}
}

pipe=pipe${RANDOM}
mkfifo ${pipe}


start=start${RANDOM}
mkfifo ${start}
ignore=ignore${RANDOM}
mkfifo ${ignore}

echo ERRORS OFF
sbcl --script 'hello.lisp' 5>${pipe} 6<${start} &
pidhello=$!
sbcl --script 'display.lisp' 5>${pipe} 6<${start} &
#./display.bash  5>${ignore} 6<${pipe} &
piddisplay=$!

echo "go" >${start} &
pidstart=$!
read <${ignore}
pidignore=$!

waitprocesses
rmpipes
