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
