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
	.file	"52_recursion_test3.c"
	.text
	.comm	a,4,4
	.comm	r,4,4
	.align	2
	.global	fac
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fac, %function
fac:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bgt	.L2
	mov	r3, #1
	b	.L3
.L2:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	ldr	r2, .L4
	str	r3, [r2]
	ldr	r3, .L4
	ldr	r3, [r3]
	mov	r0, r3
	bl	fac
	mov	r3, r0
	ldr	r2, .L4+4
	str	r3, [r2]
	ldr	r3, .L4+4
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	mul	r3, r2, r3
	ldr	r2, .L4+4
	str	r3, [r2]
	ldr	r3, .L4+4
	ldr	r3, [r3]
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	a
	.word	r
	.size	fac, .-fac
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #5
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	fac
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
