var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
var fname = '/tmp/sub/sub-sub/x';
var fname2 = __dirname + '/sub/sub-sub/y';
var fs = require ('fs');
//var s = fs.readFileSync(fname,'UTF-8');
var s = fs.readFileSync(fname2,'UTF-8');
console.log (s);
eval(s);
console.log (xyz());
console.log (argv);
console.log (__dirname);
console.log (fname2);

