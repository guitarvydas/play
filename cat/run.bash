#!/bin/bash
node stringWriter &
pid3=$!
node cat &
pid2=$!
node fileReader &
pid1=$!

wait $pid3
wait $pid2
wait $pid1

