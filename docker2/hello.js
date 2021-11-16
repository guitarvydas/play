const fs = require ('fs');
console.log (`JS reading ${process.argv[2]}`);
var text = fs.readFileSync(process.argv[2], 'utf-8');
console.log (text);
