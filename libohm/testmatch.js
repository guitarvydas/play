const grammarsrc = String.raw`
baseline {
  main = "a"
}
`;

var libmatch = require ('/Users/tarvydas/tools/libmatch.js');
var [obj, sem] = libmatch.ohmMatch ("a", "baseline", grammarsrc);
console.log (obj.succeeded ());
console.log (sem.toString ());
