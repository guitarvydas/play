var grammar = String.raw`
Test {
Main = A B A
A = "a"
B = 
  | "b" -- one
  |       -- empty
}
`;

var src = 'aba';

var walksem = {
    Main: function (p1, p2, p3) {
	console.log (p1);
	console.log (p2);
	console.log (p3);
    },

    A: function (p1) {
	return "A ";
    },

    B_one: function (p1) {
	return "one ";
    },
    B_empty: function () {
	return "empty ";
    }
}

var ohm = require ('ohm-js');

function etest () {
    var g = ohm.grammar (grammar);
    var cst = g.match (src);
    var s = g.createSemantics ();
    s.addOperation ('walk', walksem);
    var genwalker = s (cst);
    return genwalker;
}

console.error ('abandoned');
var walker = etest ();
var v = walker.walk ();
console.log (v);
