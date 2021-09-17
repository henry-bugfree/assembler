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
	.file	"43_time_prior_plus.c"
	.text
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
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
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	mov	r3, #20
	str	r3, [fp, #-16]
	mov	r3, #5
	str	r3, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-24]
	mvn	r3, #3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	mul	r2, r3, r2
	ldr	r3, [fp, #-16]
	add	r4, r2, r3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	sub	r3, r4, r3
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	putint
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
