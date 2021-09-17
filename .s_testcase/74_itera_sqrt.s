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
	.file	"74_itera_sqrt.c"
	.text
	.global	__aeabi_idiv
	.align	2
	.global	fsqrt
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fsqrt, %function
fsqrt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L3
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	fsqrt, .-fsqrt
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
	mov	r3, #400
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	fsqrt
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putch
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
