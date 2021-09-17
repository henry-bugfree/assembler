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
	.file	"42_index_func_ret.c"
	.text
	.align	2
	.global	_getMaxOfAll
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	_getMaxOfAll, %function
_getMaxOfAll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L6
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L2
.L4:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bge	.L3
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L4
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	-999999
	.size	_getMaxOfAll, .-_getMaxOfAll
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mvn	r3, #1
	str	r3, [fp, #-20]
	mov	r3, #2
	str	r3, [fp, #-16]
	mvn	r3, #6
	str	r3, [fp, #-12]
	sub	r3, fp, #20
	mov	r1, #3
	mov	r0, r3
	bl	_getMaxOfAll
	mov	r3, r0
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-16]
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	putint
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
