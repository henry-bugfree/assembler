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
	.file	"71_max_subsequence_sum.c"
	.text
	.align	2
	.global	maxSubArray
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	maxSubArray, %function
maxSubArray:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L2
	mov	r3, #0
	b	.L3
.L2:
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L4
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	b	.L3
.L4:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L5
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L6
	mov	r3, #0
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L7
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
.L7:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L5:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L8
	ldr	r3, [fp, #-12]
.L3:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	maxSubArray, .-maxSubArray
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	mvn	r3, #3
	str	r3, [fp, #-48]
	mov	r3, #3
	str	r3, [fp, #-44]
	mov	r3, #9
	str	r3, [fp, #-40]
	mvn	r3, #1
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-28]
	mvn	r3, #5
	str	r3, [fp, #-24]
	mov	r3, #5
	str	r3, [fp, #-20]
	mov	r3, #7
	str	r3, [fp, #-16]
	mov	r3, #8
	str	r3, [fp, #-12]
	mov	r3, #10
	str	r3, [fp, #-8]
	sub	r3, fp, #48
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	maxSubArray
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
