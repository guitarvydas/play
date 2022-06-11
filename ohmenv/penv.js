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
    _iter: function (...children) { return recursive_iter (children, { depth: this.args.depth }); }
};


function acar (a) { return a [0]; }
function acdr (a) { return a.slice (1); }

function cloneModify (name, v, obj) {
    var newobj = obj;
    obj [name] = v;
    return newobj;
}

function recursive_iter (child_array, valueStack) {
    if (0 == child_array.length) {
        return;
    } else {
        var depth = valueStack.depth;
        var frontChild = acar (child_array);
        frontChild.op (depth);
        recursive_iter (acdr (child_array), cloneModify ('depth', depth + 1, valueStack));
    }
}

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
