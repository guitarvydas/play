#!/bin/bash
read text </dev/fd/6
echo ${text} >/dev/fd/5
