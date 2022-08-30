xxx = { 'a':1, 'b':2 };
yyy = { 'c':3 };
y = { 'c':4 };
console.log (xxx);
console.log (yyy);
var zzz = { ...xxx, ...yyy, ...y};
console.log (zzz);
