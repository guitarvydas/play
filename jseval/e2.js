const fctStr1 = "function a() {return 'in a';} function b() {return 'in b'}";
const fct1 = eval ?. (fctStr1);
console.log (fct1);

const nsStr = "{x : 1, y : 2, f: function () { return `${a ()} and in f` }}";
const ns = eval ?. ('(' + nsStr + ')');

console.log (a());
console.log (b());
console.log (ns);
console.log (ns.f());
