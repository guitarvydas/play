const grammarsrc = String.raw`
baseline {
  main = "a"
}
`;

var libmatch = require ('./libmatch.js');
var obj = libmatch.ohmMatch ("a", "baseline", grammarsrc);
console.log (obj.succeeded ());

