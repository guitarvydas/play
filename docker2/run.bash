#!/bin/bash
clear
node hello.js test1.txt
python hello.py test2.txt
swipl -g 'consult(hello).' -g 'hello.' -g 'halt.'

