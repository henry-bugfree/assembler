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
	.file	"86_bin_search.c"
	.text
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-68]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L3
	mov	r3, #10
	str	r3, [fp, #-28]
	bl	getint
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L4
.L7:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-68]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L4
.L5:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-68]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	beq	.L6
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L7
.L6:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-68]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	bne	.L8
	ldr	r0, [fp, #-32]
	bl	putint
	b	.L9
.L8:
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-32]
	bl	putint
.L9:
	mov	r3, #10
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-32]
	bl	putch
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
