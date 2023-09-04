const fctStr1 = `
var tracing = 42;
function a() {return 'in a';}
function b() {return this;}
`;

const fct1 = eval ?. (fctStr1);
console.log (fct1);

const nsStr = "{x : 1, y : 2, z : a, f: function () { return `${a ()} and in f and tracing=${tracing}` }}";
const ns = eval ?. ('(' + nsStr + ')');

console.log (a());
console.log (b());
console.log (global);
console.log (f_locals);
console.log (ns);
console.log (ns.f());
