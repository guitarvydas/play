var ohm = require ('ohm-js');

const g = ohm.grammar (`
verysimple {
  Top = letter "=" letter "+" letter
}
`);
const semantics = g.createSemantics ().addOperation ("transpile2js", {
    Top (_target, _eq, _v1, _plus, _v2) {
	target = _target.transpile2js ();
	v1 = _v1.transpile2js ();
	v2 = _v2.transpile2js ();
	return `
${target} = ${v1} + ${v2};
console.log (${target});
`},
    _terminal () { return this.sourceString; }
});

var cst = g.match ("a = b + c");
var transpiled = semantics (cst).transpile2js ();
console.log (transpiled);

