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
	.file	"82_int_split.c"
	.text
	.comm	N,4,4
	.comm	newline,4,4
	.align	2
	.global	split
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	split, %function
split:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L5
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r0, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, .L5+4
	smull	r2, r3, r1, r3
	asr	r2, r3, #2
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	sub	r2, r1, r3
	str	r2, [r0]
	ldr	r3, [fp, #-16]
	ldr	r2, .L5+4
	smull	r1, r2, r3, r2
	asr	r2, r2, #2
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	bne	.L3
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	N
	.word	1717986919
	.size	split, .-split
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	ldr	r3, .L11
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, .L11+4
	mov	r2, #10
	str	r2, [r3]
	ldr	r3, .L11+8
	str	r3, [fp, #-12]
	sub	r3, fp, #32
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	split
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L8
.L9:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-28]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	putint
	ldr	r3, .L11+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	putch
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L9
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	N
	.word	newline
	.word	1478
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
