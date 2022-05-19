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

function acar (a) { return a [0]; }
function acdr (a) { return a.slice (1); }

function Cell (first, second) { this.car = first; this.cdr = second; }
function car (cell) { return cell.car; }
function cdr (cell) { return cell.cdr; }
function cons (v, cell) { 
    var newcell;
    if (cell) {
        newcell = new Cell (v, cell);
    } else {
        newcell = new Cell (v, null);
    }
    return newcell;
}
function lookup (name, cell) {
    if (cell) {
        var first = car (cell);
        if (first [name]) {
            return first [name];
        } else {
            return lookup (name, cdr (cell));
        }
    } else {
        return undefined;
    }
}

const opActions = {
    Main : function (_cs) { _cs.op (215); },
    Chars: function (_cs) { var depth = this.args.depth; console.log (`Chars depth=${depth}`); _cs.op (depth + 1);},
    char: function (_c) { var depth = this.args.depth; console.log (`char=${_c.op (depth)} depth=${depth}`); },
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) {
        var valueStack = new Cell ({ depth: this.args.depth }, null);
        return recursive_iter (children, valueStack);
    }
};

function recursive_iter (child_array, valueStack) {
    if (0 == child_array.length) {
        return;
    } else {
        var depth = lookup ('depth', valueStack);
        var frontChild = acar (child_array);
        frontChild.op (depth);
        recursive_iter (acdr (child_array), cons ({depth: depth + 1}, valueStack));
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
