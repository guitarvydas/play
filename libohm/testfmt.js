var libfmt = require ('/Users/tarvydas/tools/libfmt.js');
var [obj, sem] = libfmt.fmt ('main [x] = [[${x}]]');
//var [obj, sem] = libfmt.fmt ('main [+x] = [[${x}]]');
console.log (obj);
console.log (sem);

