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
	.file	"80_lcm.c"
	.text
	.comm	n,4,4
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.align	2
	.global	gcd
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	gcd, %function
gcd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bge	.L2
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
.L2:
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-8]
	b	.L3
.L4:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	gcd, .-gcd
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
	bl	getint
	str	r0, [fp, #-8]
	bl	getint
	str	r0, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	gcd
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
