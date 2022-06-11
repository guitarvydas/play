//'use strict'
const ohm = require ('ohm-js');

exports.ohmMatch = function (src, grammarname, grammarsrc) {
    // use Ohm-JS to match src with grammarsrc (both strings)
    // "grammarname" is a string name of the grammar to be used
    // return the matchObject created by Ohm
    const grammar = ohm.grammars(grammarsrc)[grammarname];
    var matchObject = grammar.match (src);
    return matchObject;
}

    
