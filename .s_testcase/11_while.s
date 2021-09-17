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
	.file	"11_while.c"
	.text
	.comm	a,4,4
	.comm	b,4,4
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L5
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L5+4
	mov	r2, #3
	str	r2, [r3]
	b	.L2
.L3:
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L5
	str	r3, [r2]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L5+4
	str	r3, [r2]
.L2:
	ldr	r3, .L5+4
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L3
	ldr	r3, .L5
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	b
	.word	a
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
