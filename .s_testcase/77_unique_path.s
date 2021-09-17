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
	.file	"77_unique_path.c"
	.text
	.align	2
	.global	uniquePaths
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	uniquePaths, %function
uniquePaths:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-56]
	cmp	r3, #1
	beq	.L2
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bne	.L3
.L2:
	mov	r3, #1
	b	.L13
.L3:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r2, r3, r2
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	sub	r3, r3, #1
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #-44]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L6
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L7
.L8:
	ldr	r3, [fp, #-56]
	sub	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #-44]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	blt	.L8
	ldr	r3, [fp, #-56]
	sub	r3, r3, #2
	str	r3, [fp, #-8]
	b	.L9
.L12:
	ldr	r3, [fp, #-60]
	sub	r3, r3, #2
	str	r3, [fp, #-12]
	b	.L10
.L11:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r0, [r3, #-44]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r3, #1
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r1, [r3, #-44]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r2, r0, r1
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-44]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L11
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L9:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L12
	ldr	r3, [fp, #-48]
.L13:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	uniquePaths, .-uniquePaths
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
	mov	r3, #3
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	uniquePaths
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
