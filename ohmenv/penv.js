const Ohm = require ('ohm-js');

const grammar = String.raw`
recursive {
Main = Chars
Chars = char+
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
    Main : function (_cs) { _cs.op (215); },
    Chars: function (_cs) { var depth = this.args.depth; console.log (`Chars depth=${depth}`); _cs.op (depth + 1);},
    char: function (_c) { var depth = this.args.depth; console.log (`char=${_c.op (depth)} depth=${depth}`); },
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) {
	var depth = this.args.depth;
	return recursive_iter (children, depth);
    }
};

function recursive_iter (child_array, depth) {
    if (0 == child_array.length) {
	return;
    } else {
	var frontChild = car (child_array);
	frontChild.op (depth);
	recursive_iter (cdr (child_array), depth + 1);
    }
}

function car (a) { return a [0]; }
function cdr (a) { return a.slice (1); }


function do_op (cst, walker_skeleton, actions) {
    if (cst.succeeded ()) {
	walker_skeleton.addOperation ('op(depth)', actions);
        let treeWalker = walker_skeleton (cst);
        let result = treeWalker.op (null);
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
