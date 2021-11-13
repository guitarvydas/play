#!/bin/bash
batonX=baton${RANDOM}
batonY=baton${RANDOM}
batonV=baton${RANDOM}
mkfifo $batonX
mkfifo $batonY
mkfifo $batonV

set -e
#trap 'catcherr' ERR
#trap 'catchint' SIGINT

catcherr () {
    echo '*** ERR in run.bash ***'
    kill -9 $pid3 $pid2 $pid1
    exit 1
}
catchint () {
    echo '*** SIGINT in run.bash ***'
    kill -9 $pid3 $pid2 $pid1
    exit 1
}

set -x
# batonV >> stringWriter >> batonY >> cat >> batonX >> fileReader
node hello 59092 5901 3<$batonV 4>batonY &
# node stringWriter 59092 59091 3<$batonV 4>$batonY &
pid3=$!
# node cat 59091 59090 3<$batonY 4>$batonX &
# pid2=$!
# node fileReader 59090 59089 3<$batonX 4>/dev/null &
# pid1=$!

# echo 'baton' >$batonV

wait $pid3
# wait $pid2
rm $batonX
rm $batonY
rm $batonV

echo $pid1 $pid2 $pid3
