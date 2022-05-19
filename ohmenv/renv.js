const Ohm = require ('ohm-js');

const grammar = String.raw`
recursive {
Main = Chars
Chars = 
  | char Chars  -- recursive
  | char        -- bottom
char = letter
}
`;

function patternMatch (grammar, phrase) {
    let matchResult = grammar.match (phrase);
    if (matchResult.succeeded ()) {
        let s = grammar.createSemantics ();
        return [matchResult, s];
    } else {
        let dontcare = null;
        return [ matchResult, dontcare ];
    }
}

var depth = 0;

const opRules = {
    Main : function (_cs) { depth = 0; _cs.op (); },
    Chars_recursive: function (_c, _cs) { depth += 1; console.log (`char=${_c.op ()} depth=${depth}`); _cs.op ();},
    Chars_bottom: function (_c) { depth += 1; console.log (`char=${_c.op ()} depth=${depth}`); },
    char: function (_c) { return _c.op (); },
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) { return children.map(c => c.op ()); }
};

function do_op (cst, walker_envelope, rules) {
    if (cst.succeeded ()) {
	walker_envelope.addOperation ('op', rules);
        let treeWalker = walker_envelope (cst);
        let result = treeWalker.op ();
	return result;
    } else {
	return "Parse FAILED";
    }
}


const inphrase = String.raw`
abc
`;

var [result, walker_envelope] = patternMatch (Ohm.grammar (grammar), inphrase);
var cst = result;
console.log (do_op (cst, walker_envelope, opRules));
