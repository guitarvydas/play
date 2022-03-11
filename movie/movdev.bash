#!/bin/bash
echo >files.txt
for i in *.mov
do
    newname=`./fnamewos "$i"`
    ffmpeg -i "$i" $newname.mov
    echo "file $newname.mp4" >>files.txt
done
ffmpeg -f concat -safe 0 -i files.txt -c copy temp.mov

#    fnamewos '1 Screen Recording 2022-01-09 at 4.29.17 PM.mov'
