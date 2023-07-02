```
int plus97 (int x) {
  return x + 99 - 2;
}

int pt1 (int x) {
  return plus97 (plus97 (x));
}
```

$ gcc -O3 -S pt1.c

inlines plus97 (plus97 (...)) and produces code that doesn't call `plus97` at all

```
...
	.globl	_pt1                            ## -- Begin function pt1
	.p2align	4, 0x90
_pt1:                                   ## @pt1
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def $edi killed $edi def $rdi
	leal	194(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
...
```

@Kartik Agaram 

FYI, I think of this when I think about manipulation by compilers:

```
int plus97 (int x) {
  return x + 99 - 2;
}

int pt1 (int x) {
  return plus97 (plus97 (x));
}
```

$ gcc -O3 -S pt1.c

turns this into:

```
int pt1 (int x) {
  return x + 194;
}
```

Then, there's git, diff, NiCaD Clone Detector (Cordy, Roy).

[aside: the above essay doesn't actually contain a statement about "deduplication", but, it does sound like something I would say.  I wonder what I was thinking when I wrote that? I wonder what it made you think?]

