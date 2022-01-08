#!/bin/bash
temp=/tmp/temp${RANDOM}
cat >${temp} <<'~~~EOF~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var ID = p [0];
  var Name = p [1];
  
  console.log (`das_fact(name, ${ID}, \"${Name}\").`);
});
~~~EOF~~~
node ${temp}
rm ${temp}

