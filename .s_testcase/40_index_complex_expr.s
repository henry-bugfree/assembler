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
	.file	"40_index_complex_expr.c"
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	mov	r3, #5
	str	r3, [fp, #-8]
	mov	r3, #5
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-16]
	mvn	r3, #1
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-44]
	mov	r3, #2
	str	r3, [fp, #-40]
	mov	r3, #3
	str	r3, [fp, #-36]
	mov	r3, #4
	str	r3, [fp, #-32]
	mov	r3, #5
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	add	r2, r3, #4
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, [fp, #-16]
	mvn	r3, #2
	sub	r3, r3, r1
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	sub	r1, r2, r3
	ldr	r3, .L3
	smull	r2, r3, r1, r3
	asr	r2, r3, #1
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	lsl	r3, r2, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-40]
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	putint
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	add	r2, r3, #67
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	sub	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	add	r1, r2, r3
	ldr	r3, .L3
	smull	r2, r3, r1, r3
	asr	r2, r3, #1
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	lsl	r3, r2, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-40]
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	putint
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	1717986919
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
