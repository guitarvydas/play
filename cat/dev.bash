#!/bin/bash
node stringWriter &
pid3=$!
node cat &
pid2=$!

wait $pid3
wait $pid2

