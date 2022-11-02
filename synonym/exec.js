var ohm = require ('ohm-js');

/// helpers
function _ruleInit () {
}

function traceSpaces () {
    var s = '';
    var n = traceDepth;
    while (n > 0) {
        s += ' ';
        n -= 1;
    }
    s += `[${traceDepth.toString ()}]`;
    return s;
}

function _ruleEnter (ruleName) {
    if (tracing) {
        traceDepth += 1;
        var s = traceSpaces ();
        s += 'enter: ';
        s += ruleName.toString ();
        console.log (s);
    }
}

function _ruleExit (ruleName) {
    if (tracing) {
        var s = traceSpaces ();
        traceDepth -= 1;
        s += 'exit: ';
        s += ruleName.toString ();
        console.log (s);
    }
}

function getFmtGrammar () {
    return fmtGrammar;
}

  // helper functions
  var ruleName = "???";
  function setRuleName (s) { ruleName = s; return "";}
  function getRuleName () { return ruleName; }

/// end helpers

function compilefmt (fmtsrc, ohmlang) {
    // expand the string fmtsrc into JavaScript suitable for
    // inclusion as a semantic object for Ohm.js
    //
    var s = '';

    var generatedObject = {};
    

    // Step 1a. Create (internal) fmt transpiler. 
    var internalgrammar = ohmlang.grammar (fmtGrammar);
    var fmtcst = internalgrammar.match (fmtsrc);

    if (fmtcst.failed ()) {
        // return [false, "FORMAT: syntax error\n(Use Ohm-Editor to debug format specification (grammar: fmt.ohm))\n\n" + internalgrammar.trace (fmtsrc)];
	console.error (internalgrammar);
        return [false, "FORMAT: syntax error\n(Use Ohm-Editor to debug format specification) rightmostPosition=" + fmtcst.getRightmostFailurePosition() + '\n' + fmtsrc];
    }
    // Step 1b. Transpile User's FMT spec to a JS object (for use with Ohm-JS)
    try {
        var sem = internalgrammar.createSemantics ();
        sem.addOperation ('_fmt', semObject);
        var generatedFmtWalker = sem (fmtcst);
        var generated = generatedFmtWalker._fmt ();
        return [true, generated];
    } catch (err) {
        var msg = "error generating code from FMT specification<br><br>" + err.message;
        return [false, msg];
    }
}


var tracing = false;
var traceDepth = 0;

const fmtGrammar =
      String.raw`
FMT {
top = spaces name spaces "{" spaces rule+ spaces "}" spaces more*
more = name spaces "{" spaces rule* spaces "}" spaces
rule = applySyntactic<RuleLHS> spaces "=" spaces rewriteString
RuleLHS = name "[" Param+ "]"
rewriteString = "‛" char* "’" spaces
char =
  | "«" nonBracketChar* "»" -- eval
  | ~"’" ~"]]" any     -- raw
nonBracketChar = ~"»" ~"«"  ~"’" ~"]]" any
name = letter nameRest*
nameRest = "_" | alnum
Param =
  | name "+" -- plus
  | name "*" -- star
  | name "?" -- opt
  | name     -- flat
comment = "//" (~"\n" any)* "\n"
space += comment
}
`;

function extractFormals (s) {
    var s0 = s
        .replace (/\n/g,',')
        .replace (/var [A-Za-z0-9_]+ = /g,'')
        .replace (/\._[^;]+;/g,'')
        .replace (/,/,'')
    ;
    return s0;
}

var varNameStack = [];

// xxx

//// top = spaces name spaces "{" spaces rule+ spaces "}" spaces more*
// top [ws1 name ws2 lb ws4 @rule ws5 rb ws3 @more] = [[{
// ${rule}
    // _terminal: function () { return this.sourceString; },
    // _iter: function (...children) { return children.map(c => c._fmt ()); },
    // spaces: function (x) { return this.sourceString; },
    // space: function (x) { return this.sourceString; }
// }
// ]]

const semObject = {

    top : function (_ws1,_name,_ws2,_lb,_ws4,_rule,_ws5,_rb,_ws3,_more) { 
        _ruleEnter ("top");

        var ws1 = _ws1._fmt ();
        var name = _name._fmt ();
        var ws2 = _ws2._fmt ();
        var lb = _lb._fmt ();
        var ws4 = _ws4._fmt ();
        var rule = _rule._fmt ().join ('');
        var ws5 = _ws5._fmt ();
        var rb = _rb._fmt ();
        var ws3 = _ws3._fmt ();
        var more = _more._fmt ().join ('');
        var _result = `{
${rule}${more}
    _terminal: function () { return this.sourceString; },
    _iter: function (...children) { return children.map(c => c._fmt ()); },
    spaces: function (x) { return this.sourceString; },
    space: function (x) { return this.sourceString; }
}
`; 
        _ruleExit ("top");
        return _result; 
    },

    more : function (_name,_ws2,_lb,_ws4,_rule,_ws5,_rb,_ws3) { 
        _ruleEnter ("top");

        var name = _name._fmt ();
        var ws2 = _ws2._fmt ();
        var lb = _lb._fmt ();
        var ws4 = _ws4._fmt ();
        var rule = _rule._fmt ().join ('');
        var ws5 = _ws5._fmt ();
        var rb = _rb._fmt ();
        var ws3 = _ws3._fmt ();
        var _result = `
${rule}
`; 
        _ruleExit ("top");
        return _result; 
    },


    ////
    
    // rule [lhs ws1 keq ws2 rws] = [[${lhs}${rws}
    // _ruleExit ("${getRuleName ()}");
    // },
    // ]]


    rule : function (_lhs,_ws1,_keq,_ws2,_rws) { 
        _ruleEnter ("rule");

        var lhs = _lhs._fmt ();
        var ws1 = _ws1._fmt ();
        var keq = _keq._fmt ();
        var ws2 = _ws2._fmt ();
        var rws = _rws._fmt ();
        var _result = `${lhs}${rws}
_ruleExit ("${getRuleName ()}");
},
`; 
        _ruleExit ("rule");
        return _result; 
    },
    ////
    
    // RuleLHS [name lb @Params rb] = [[${name}: function (${extractFormals(Params)}) {\n_ruleEnter ("${name}");${setRuleName (name)}${Params}
    // ]]
    RuleLHS : function (_name,_lb,_Params,_rb) { 
        _ruleEnter ("RuleLHS");

        var name = _name._fmt ();
        var lb = _lb._fmt ();
        var Params = _Params._fmt ().join ('');
        var rb = _rb._fmt ();
        var _result = `${name}: function (${extractFormals(Params)}) {\n_ruleEnter ("${name}");${setRuleName (name)}${Params}
`; 
        _ruleExit ("RuleLHS");
        return _result; 
    },
    
    ////


    // rewriteString [sb @cs se ws] = [[return \`${cs}\`;]]
    rewriteString : function (_sb,_cs,_se,_ws) { 
        _ruleEnter ("rewriteString");

        var sb = _sb._fmt ();
        var cs = _cs._fmt ().join ('');
        var se = _se._fmt ();
        var ws = _ws._fmt ();
        var _result = `return \`${cs}\`;`; 
        _ruleExit ("rewriteString");
        return _result; 
    },


    ////
    // char_eval [lb name rb] = [[\$\{${name}\}]]
    // char_raw [c] = [[${c}]]
    char_eval : function (_lb,_cs,_rb) { 
        _ruleEnter ("char_eval");

        var lb = _lb._fmt ();
        var name = _cs._fmt ().join ('');
        var rb = _rb._fmt ();
        var _result = `\$\{${name}\}`; 
        _ruleExit ("char_eval");
        return _result; 
    },
    
    char_raw : function (_c) { 
        _ruleEnter ("char_raw");

        var c = _c._fmt ();
        var _result = `${c}`; 
        _ruleExit ("char_raw");
        return _result; 
    },
    ////
    
    // name [c @cs] = [[${c}${cs}]]
    // nameRest [c] = [[${c}]]

    name : function (_c,_cs) { 
        _ruleEnter ("name");

        var c = _c._fmt ();
        var cs = _cs._fmt ().join ('');
        var _result = `${c}${cs}`; 
        _ruleExit ("name");
        return _result; 
    },
    
    nameRest : function (_c) { 
        _ruleEnter ("nameRest");

        var c = _c._fmt ();
        var _result = `${c}`; 
        _ruleExit ("nameRest");
        return _result; 
    },

    ////


    // Param_plus [name k] = [[\nvar ${name} = _${name}._fmt ().join ('');]]
    // Param_star [name k] = [[\nvar ${name} = _${name}._fmt ().join ('');]]
    // Param_opt [name k] = [[\nvar ${name} = _${name}._fmt ().join ('');]]
    // Param_flat [name] = [[\nvar ${name} = _${name}._fmt ();]]


    Param_plus : function (_name,_k) { 
        _ruleEnter ("Param_plus");

        var name = _name._fmt ();
        var k = _k._fmt ();
        var _result = `\nvar ${name} = _${name}._fmt ().join ('');`; 
        _ruleExit ("Param_plus");
        return _result; 
    },
    
    Param_star : function (_name,_k) { 
        _ruleEnter ("Param_star");

        var name = _name._fmt ();
        var k = _k._fmt ();
        var _result = `\nvar ${name} = _${name}._fmt ().join ('');`; 
        _ruleExit ("Param_star");
        return _result; 
    },
    
    Param_opt : function (_name,_k) { 
        _ruleEnter ("Param_opt");

        var name = _name._fmt ();
        var k = _k._fmt ();
        var _result = `\nvar ${name} = _${name}._fmt ().join ('');`; 
        _ruleExit ("Param_opt");
        return _result; 
    },
    
    Param_flat : function (_name) { 
        _ruleEnter ("Param_flat");

        var name = _name._fmt ();
        var _result = `\nvar ${name} = _${name}._fmt ();`; 
        _ruleExit ("Param_flat");
        return _result; 
    },
    
    ////

    _terminal: function () { return this.sourceString; },
    _iter: function (...children) { return children.map(c => c._fmt ()); },
    spaces: function (x) { return this.sourceString; },
    space: function (x) { return this.sourceString; }
};
// yyy

// return 3 item from transpile
function transpile (src, grammarName, grammars, fmt, ohmlang, compfmt) {
    [matchsuccess, trgrammar, cst, errormessage] = patternmatch (src, grammarName, grammars, ohmlang);
    if (!matchsuccess) {
	return [false, "", "pattern matching error<br><br>" + errormessage];
    } else {
	[success, semanticsFunctionsAsString] = compfmt (fmt, ohmlang);
	if (!success) {
	    var errorMessage = semanticsFunctionsAsString
	    return [false, null, errorMessage];
	}
	var evalableSemanticsFunctions = '(' + semanticsFunctionsAsString + ')';
	var sem = trgrammar.createSemantics ();
	try {
	    semobj = eval (evalableSemanticsFunctions);
	} catch (err) {
	    console.error (evalableSemanticsFunctions);
	    console.error (fmt);
	    return [false, null, 'error evaling .fmt specification<br><br>' + err.message];
	}
	try {
	    sem.addOperation ("_fmt", semobj);
	} catch (err) {
	    return [false, null, "error in .fmt specification<br><br>" + err.message];
	}
        var generatedFmtWalker = sem (cst);
        try {
	    //tracing = true;
	    var generated = generatedFmtWalker._fmt ();
	} catch (err) {
	    return [false, "", err.message];
	}
	return [true, generated, ""];
    }
}


function patternmatch (src, grammarName, grammars, ohmlang) {
    try {
	var grammarSpecs = ohmlang.grammars (grammars);
    } catch (err) {
	return [false, undefined, undefined, err.message];
    }
    try {
	var pmgrammar = grammarSpecs [grammarName];
    } catch (err) {
	return [false, undefined, undefined, `grammar ${grammarName} not found in given grammars`];
    }
    if (pmgrammar === undefined) {
	return [false, undefined, undefined, `grammar '${grammarName}' not found in given grammars`];
    }

    try {
	var cst = pmgrammar.match (src);
    } catch (err) {
	return [false, undefined, undefined, err.message];
    }
    if (cst.failed ()) {
	return [false, pmgrammar, cst, cst.message];
    } else { 
	return [true, pmgrammar, cst, ""];
    }
	
}


/// helpers
var tracing = false;

function _ruleInit () {
}

function traceSpaces () {
    var s = '';
    var n = traceDepth;
    while (n > 0) {
        s += ' ';
        n -= 1;
    }
    s += `[${traceDepth.toString ()}]`;
    return s;
}

function _ruleEnter (ruleName) {
    if (tracing) {
        traceDepth += 1;
        var s = traceSpaces ();
        s += 'enter: ';
        s += ruleName.toString ();
        console.log (s);
    }
}

function _ruleExit (ruleName) {
    if (tracing) {
        var s = traceSpaces ();
        traceDepth -= 1;
        s += 'exit: ';
        s += ruleName.toString ();
        console.log (s);
    }
}

function getFmtGrammar () {
    return fmtGrammar;
}

  // helper functions
  var ruleName = "???";
  function setRuleName (s) { ruleName = s; return "";}
  function getRuleName () { return ruleName; }

/// end helpers

function Synonym1 (s, result) {
    var grammar = String.raw`
Synonym {
  main = char+
  char = 
    | applySyntactic<Pattern> -- pattern
    | applySyntactic<ParenBlockBegin> -- parenblock
    | applySyntactic<BraceBlockBegin> -- braceblock
    | applySyntactic<SquareBlockBegin> -- squareblock
    | applySyntactic<AngleBlockBegin> -- angleblock
    | ~"{" ~"}" ~"(" ~")" ~"[" ~"]" ~"<" ~">" any -- flat

  Pattern = "function" "ReportUsage" ParenBlock BraceBlock

  ParenBlockBegin = "(" ParenBlock* ")"
  ParenBlock = 
    | "(" ParenBlock* ")" -- rec
    | ~"(" ~")" any -- flat
  BraceBlockBegin = "{" BraceBlock* "}"
  BraceBlock = 
    | "{" BraceBlock* "}" -- rec
    | ~"{" ~"}" any -- flat
  AngleBlockBegin = "{" AngleBlock* "}"
  AngleBlock = 
    | "<" AngleBlock* ">" -- rec
    | ~"<" ~">" any -- flat
  SquareBlockBegin = "{" SquareBlock* "}"
  SquareBlock = 
    | "[" SquareBlock* "]" -- rec
    | ~"[" ~"]" any -- flat
}
`;
    var fabricator = String.raw`
Synonym {
  main [char+] = ‛«char»’
  char_pattern [Pattern] = ‛«Pattern»’
  char_parenblock [b] = ‛«b»’
  char_braceblock [b] = ‛«b»’
  char_flat [c] = ‛«c»’
  Pattern [kfunction kReportUsage ParenBlock BraceBlock] =  ‛@deleted’
  ParenBlockBegin [klp ParenBlock* krp] = ‛«klp»«ParenBlock»«krp»’
  ParenBlock_rec [klp ParenBlock* krp] = ‛«klp»«ParenBlock»«krp»’
  ParenBlock_flat [c] = ‛«c»’
  BraceBlockBegin [klp BraceBlock* krp] = ‛«klp»«BraceBlock»«krp»’
  BraceBlock_rec [klp BraceBlock* krp] = ‛«klp»«BraceBlock»«krp»’
  BraceBlock_flat [c] = ‛«c»’
  SquareBlockBegin [klp SquareBlock* krp] = ‛«klp»«SquareBlock»«krp»’
  SquareBlock_rec [klp SquareBlock* krp] = ‛«klp»«SquareBlock»«krp»’
  SquareBlock_flat [c] = ‛«c»’
  AngleBlockBegin [klp AngleBlock* krp] = ‛«klp»«AngleBlock»«krp»’
  AngleBlock_rec [klp AngleBlock* krp] = ‛«klp»«AngleBlock»«krp»’
  AngleBlock_flat [c] = ‛«c»’
}
`;
 

    var rarray = transpile (src, "Synonym", grammar, fabricator, ohm, compilefmt);
    var success = rarray [0];
    var transpiled = rarray [1];
    var errormessage = rarray [2];
    var r;
    if (success) {
	r = transpiled;
    } else {
	r = errormessage;
    }
    if (result.stdout) {
	result.stdout.push (r);
    } else {
	result.stdout = [{ 'stdout': r}];
    }
    return result;
}
var src = String.raw`
function ReportUsage(ms) {
  var i, atom, code, heap;
  code = -cx >> 1;
  heap = -cHeap >> 1;
  for (atom = i = 0; i < Null / 2; ++i) {
    if (M[Null + i]) ++atom;
  }
  if (eGets) eGets.innerText = FormatInt(cGets);
  if (eSets) eSets.innerText = FormatInt(cSets);
  if (eMs) eMs.innerText = FormatInt(ms);
  if (eAtoms) eAtoms.innerText = FormatInt(atom);
  if (eCode) eCode.innerText = FormatInt(code);
  if (eHeap) eHeap.innerText = FormatInt(heap - code);
  if (eReads) eReads.innerText = FormatInt(cReads);
  if (ePrints) ePrints.innerText = FormatInt(cPrints);
}
`;

var r = Synonym1 (src, {});
console.log (r);