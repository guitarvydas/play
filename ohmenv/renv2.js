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

const opActions = {
    Main : function (_cs) { _cs.op (27); },
    Chars_recursive: function (_c, _cs) { var depth = this.args.depth; console.log (`char=${_c.op (depth)} depth=${depth}`); _cs.op (depth + 1);},
    Chars_bottom: function (_c) { var depth = this.args.depth; console.log (`char=${_c.op (depth)} depth=${depth}`); },
    char: function (_c) { var depth = this.args.depth; return _c.op (depth); },
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) { var depth = this.args.depth; return children.map(c => c.op (depth)); }
};

function do_op (cst, walker_skeleton, actions) {
    if (cst.succeeded ()) {
	walker_skeleton.addOperation ('op(depth)', actions);
        let treeWalker = walker_skeleton (cst);
        let result = treeWalker.op (8);
	return result;
    } else {
	return "Parse FAILED";
    }
}


const inphrase = String.raw`
abc
`;

var [result, walker_skeleton] = patternMatch (Ohm.grammar (grammar), inphrase);
var cst = result;
console.log (do_op (cst, walker_skeleton, opActions));
