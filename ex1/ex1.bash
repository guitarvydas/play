#!/bin/bash

node stringwriter &
pidhello=$!
node hello &
piddisplay=$!

wait ${pidhello}
wait ${piddisplay}
