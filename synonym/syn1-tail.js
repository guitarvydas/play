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
