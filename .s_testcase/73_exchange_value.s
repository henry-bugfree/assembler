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
	.file	"73_exchange_value.c"
	.text
	.comm	n,4,4
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	bl	getint
	str	r0, [fp, #-8]
	bl	getint
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	putch
	ldr	r0, [fp, #-12]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	putch
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
