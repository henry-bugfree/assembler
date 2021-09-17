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
	.file	"61_rec_fibonacci.c"
	.text
	.comm	n,4,4
	.align	2
	.global	f
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	f, %function
f:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L2
	mov	r3, #1
	b	.L3
.L2:
	ldr	r3, [fp, #-32]
	cmp	r3, #2
	bne	.L4
	mov	r3, #1
	b	.L3
.L4:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #2
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	f
	mov	r4, r0
	ldr	r0, [fp, #-20]
	bl	f
	mov	r3, r0
	add	r3, r4, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
.L3:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	f, .-f
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
	mov	r3, r0
	ldr	r2, .L7
	str	r3, [r2]
	ldr	r3, .L7
	ldr	r3, [r3]
	mov	r0, r3
	bl	f
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putch
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	n
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
