#!/bin/bash
pipe=pipe${RANDOM}
mkfifo ${pipe}

start=start${RANDOM}
mkfifo ${start}
ignore=ignore${RANDOM}
mkfifo ${ignore}

./hello.bash 5>${pipe} 6<${start} &
pidhello=$!
./display.bash 5>${ignore} 6<${pipe} &
piddisplay=$!

echo "go" >${start} &
pidstart=$!
read <${ignore}
pidignore=$!

wait ${pidhello}
wait ${piddisplay}
wait ${pidstart}
wait ${pidignore}
rm -f ${pipe}
rm -f ${start}
rm -f ${ignore}
