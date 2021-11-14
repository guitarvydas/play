#!/bin/bash
pipe=pipe${RANDOM}
mkfifo ${pipe}

start=start${RANDOM}
mkfifo ${start}
ignore=ignore${RANDOM}
mkfifo ${ignore}

python hello.py 5>${pipe} 1>&5 6<${start} &
pidhello=$!
python display.py 5>${ignore} 6<${pipe} &
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
