	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_fn                             ## -- Begin function fn
	.p2align	4, 0x90
_fn:                                    ## @fn
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$7, -4(%rbp)
	movb	$65, -5(%rbp)
	movb	$66, -10(%rbp)
	movb	$66, -9(%rbp)
	movb	$66, -8(%rbp)
	movb	$66, -7(%rbp)
	movb	$0, -6(%rbp)
	movl	$9, -24(%rbp)
	movb	$67, -20(%rbp)
	movb	$68, -19(%rbp)
	movb	$68, -18(%rbp)
	movb	$68, -17(%rbp)
	movb	$68, -16(%rbp)
	movb	$0, -15(%rbp)
	movl	-4(%rbp), %edi
	callq	_f1
	movsbl	-5(%rbp), %edi
	callq	_f2
	leaq	-10(%rbp), %rdi
	callq	_f3
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -32(%rbp)
	movq	-40(%rbp), %rdi
	movl	-32(%rbp), %esi
	callq	_f4
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols