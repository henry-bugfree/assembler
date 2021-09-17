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
	.file	"84_palindrome_number.c"
	.text
	.align	2
	.global	palindrome
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	palindrome, %function
palindrome:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r1, [fp, #-32]
	ldr	r3, .L7
	smull	r2, r3, r1, r3
	asr	r2, r3, #2
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-24]
	ldr	r3, [fp, #-32]
	ldr	r2, .L7
	smull	r1, r2, r3, r2
	asr	r2, r2, #2
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L4
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L4
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L5
.L4:
	mov	r3, #0
	str	r3, [fp, #-12]
.L5:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	1717986919
	.size	palindrome, .-palindrome
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
	ldr	r3, .L13
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	palindrome
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bne	.L10
	ldr	r0, [fp, #-8]
	bl	putint
	b	.L11
.L10:
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
.L11:
	mov	r3, #10
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putch
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	1221
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
