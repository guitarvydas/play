//let s1 = "function s1 () { console.log ('in s1'); }";

//let s2 = "function f3 () { console.log ('in f3') }, { f1: function () { console.log ('in f1'); }, s2 : function () { console.log ('in s2'); this.f1 ();}}";

let s2 = "that = {f3: function () { console.log ('in f3') }}, { s2 : function () { console.log ('in s2'); that.f3 ();}}";

let ns = eval ('(' + s2 + ')');
console.log (ns);
ns.s2 ();
