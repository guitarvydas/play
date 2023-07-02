	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_plus97                         ## -- Begin function plus97
	.p2align	4, 0x90
_plus97:                                ## @plus97
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def $edi killed $edi def $rdi
	leal	97(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
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
.subsections_via_symbols
