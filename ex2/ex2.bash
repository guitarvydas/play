#!/bin/bash
pipeX=pipe${RANDOM}
pipeY=pipe${RANDOM}
mkfifo ${pipeX}
mkfifo ${pipeY}

start=start${RANDOM}
mkfifo ${start}
ignore=ignore${RANDOM}
mkfifo ${ignore}

./hello.bash 5>${pipeX} 6<${start} &
pidhello=$!
./echo.bash 5>${pipeY} 6<${pipeX} &
pidhello=$!
./display.bash 5>${ignore} 6<${pipeY} &
piddisplay=$!

echo "go" >${start} &
pidstart=$!
read <${ignore}
pidignore=$!

wait ${pidhello}
wait ${piddisplay}
wait ${pidstart}
wait ${pidignore}
rm -f ${pipeX}
rm -f ${pipeY}
rm -f ${start}
rm -f ${ignore}
