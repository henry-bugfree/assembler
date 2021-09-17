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
	.file	"81_jump_game.c"
	.text
	.align	2
	.global	canJump
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	canJump, %function
canJump:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bne	.L2
	mov	r3, #1
	b	.L14
.L2:
	ldr	r3, [fp, #-60]
	sub	r2, r3, #1
	ldr	r3, [fp, #-56]
	ldr	r3, [r3]
	cmp	r2, r3
	bgt	.L4
	mov	r3, #1
	b	.L14
.L4:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-48]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-60]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L6
	ldr	r3, [fp, #-60]
	sub	r3, r3, #1
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #-48]
	ldr	r3, [fp, #-60]
	sub	r3, r3, #2
	str	r3, [fp, #-8]
	b	.L7
.L13:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-60]
	sub	r1, r3, #1
	ldr	r3, [fp, #-8]
	sub	r3, r1, r3
	cmp	r2, r3
	bge	.L8
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	b	.L10
.L8:
	ldr	r3, [fp, #-60]
	sub	r2, r3, #1
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L10
.L12:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-48]
	cmp	r3, #0
	beq	.L11
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #-48]
.L11:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L12
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L13
	ldr	r3, [fp, #-52]
.L14:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	canJump, .-canJump
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
	bl	canJump
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
