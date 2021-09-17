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
	.file	"18_cal_prio.c"
	.text
	.comm	a,4,4
	.comm	b,4,4
	.comm	c,4,4
	.align	2
	.global	main
	.arch armv4t
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
	bl	getint
	mov	r3, r0
	ldr	r2, .L3
	str	r3, [r2]
	bl	getint
	mov	r3, r0
	ldr	r2, .L3+4
	str	r3, [r2]
	bl	getint
	mov	r3, r0
	ldr	r2, .L3+8
	str	r3, [r2]
	ldr	r3, .L3+4
	ldr	r3, [r3]
	ldr	r2, .L3+8
	ldr	r2, [r2]
	mul	r2, r3, r2
	ldr	r3, .L3
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	a
	.word	b
	.word	c
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
