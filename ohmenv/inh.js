function Values (n) {
    this.depth = n;
}

var vbottom = new Values (999);
console.log (vbottom.depth);

var vmiddle = vbottom;
vmiddle.depth = 1;
console.log (vmiddle.depth);

var vtop = vmiddle;
vtop.depth = 100;
console.log (vtop.depth);

