	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"38_if_complex_expr.c"
	.text
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #5
	str	r3, [fp, #-8]
	mov	r3, #5
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-16]
	mvn	r3, #1
	str	r3, [fp, #-20]
	mov	r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	blt	.L2
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	beq	.L3
	ldr	r3, [fp, #-16]
	add	r3, r3, #3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L3
.L2:
	ldr	r0, [fp, #-24]
	bl	putint
.L3:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	cmn	r3, #67
	blt	.L4
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	beq	.L5
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L5
.L4:
	mov	r3, #4
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	putint
.L5:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
