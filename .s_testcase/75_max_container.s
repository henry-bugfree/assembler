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
	.file	"75_max_container.c"
	.text
	.align	2
	.global	maxArea
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	maxArea, %function
maxArea:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	mvn	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L7:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L3
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
	b	.L4
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	ldr	r2, [fp, #-12]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
.L4:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L5
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
.L5:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L6
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L6:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L7
	ldr	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	maxArea, .-maxArea
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
	mov	r3, #3
	str	r3, [fp, #-48]
	mov	r3, #3
	str	r3, [fp, #-44]
	mov	r3, #9
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-28]
	mov	r3, #1
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
	bl	maxArea
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
