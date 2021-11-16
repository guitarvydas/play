#!/bin/bash
node hello.js $1
python hello.py $2
swipl -g 'consult(hello).' -g 'hello.' -g 'halt.'

