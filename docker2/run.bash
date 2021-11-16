#!/bin/bash
docker build -t simple .
docker run simple ../tests/test1.txt
