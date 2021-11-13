#!/bin/bash
batonX=pipe${RANDOM}
batonY=pipe${RANDOM}
batonV=pipe${RANDOM}
mkfifo $batonX
mkfifo $batonY
mkfifo $batonV

# batonV >> stringWriter >> batonY >> cat >> batonX >> fileReader
node stringWriter 59092 59091 3<$batonV 4>$batonY &
pid3=$!
node cat 59090 59091 3<$batonY 4>$batonX &
pid2=$!
node fileReader 59090 59089 3<$batonX 4>/dev/null &
pid1=$!

echo 'baton2' >$batonV

wait $pid3
wait $pid2
wait $pid1
rm batonX
rm batonY
rm batonV
