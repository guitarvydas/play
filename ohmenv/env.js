const Ohm = require ('ohm-js');

const recursiveGrammar = String.raw`
recursive {
Main = Chars
Chars = 
  | char Chars  -- recursive
  | char        -- bottom
char = letter
}
`);
const pegGrammar = String.raw`
peg {
Main = Chars
Chars = char+
char = letter
}
`);

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

const opRecursiveRules = {
    Main : function (_cs) { depth = 0; _cs.recursive_op (0); },
    Chars_recursive: function (_c, _cs) { depth += 1; console.log (`char=${_c.recursive_op ()} depth=${depth}`); _cs.recursive_op ();},
    Chars_bottom: function (_c) { depth += 1; console.log (`char=${_c.recursive_op ()} depth=${depth}`); },
    char: function (_c) { return _c.recursive_op (); },
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) { return children.map(c => c.recursive_op ()); }
};
    
const opPegRules = {
    Main : function (_cs, depth) { _cs.peg_op (depth + 1); },
    Chars: function (_cs, depth) { console.log (`char=${_c.op (depth + 1)} depth=${depth}`); _cs.peg_op (depth + 1);},
    char: function (_c, depth) { return _c.peg_op (depth + 1); },
    _terminal: function () { return this.sourceString; },
    _iter: function (depth, ...children) { return children.map(c => c.peg_op (depth + 1)); }
};

function do_op (cst, walker_envelope, recursive_rules, peg_rules) {
    if (cst.succeeded ()) {
	walker_envelope.addOperation ('recursive_op (depth)', recursive_rules);
	walker_envelope.addOperation ('peg_op (depth)', peg_rules);
        let treeWalker = walker_envelope (cst);
        let recursiveResult = treeWalker.recursive_op (0);
        let pegResult = treeWalker.peg_op (0);
	return [recursiveResult, pegResult];
    } else {
	return ["Parse FAILED", "Parse FAILED"];
    }
}


const inphrase = String.raw`
abc
`;

var [result, walker_envelope] = patternMatch (inphrase);
var cst = result;
console.log (do_op (cst, walker_envelope, opRecursiveRules, opPegRules));
