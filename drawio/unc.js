#!/usr/bin/env node
//'use strict'

var atob = require ('atob'); // npm install atob
var pako = require ('pako'); // npm install pako
var fs   = require ('fs');

var argv = require('yargs/yargs')(process.argv.slice(2)).argv;
console.log (argv._[0]);
var encoded = fs.readFileSync (argv._[0], 'utf-8');
console.log (encoded);
var decoded = inline_decodeMxDiagram (encoded);
console.log (decoded);

function inline_decodeMxDiagram (encoded) {
    var data = atob (encoded);
    console.log (1);
    console.log (data);    
    var inf = pako.inflateRaw (
	Uint8Array.from (data, c=>c.charCodeAt (0)), {to: 'string'})
    console.log (2);
    console.log (inf);    
    var str = decodeURIComponent (inf);
    return str;
}

