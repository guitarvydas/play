#!/bin/bash
text=read </dev/fd/6
echo ${text} >/dev/fd/5
