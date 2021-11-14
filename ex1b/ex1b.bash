#!/bin/bash

node hello 59081 3 4 59090 &
piddisplay=$!
node stringwriter 2 59081 59090 5 &
pidhello=$!

wait ${pidhello}
wait ${piddisplay}
