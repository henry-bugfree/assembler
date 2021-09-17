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
	.file	"59_sort_test7.c"
	.text
	.comm	n,4,4
	.align	2
	.global	Merge
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	Merge, %function
Merge:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #124
	str	r0, [fp, #-112]
	str	r1, [fp, #-116]
	str	r2, [fp, #-120]
	str	r3, [fp, #-124]
	ldr	r2, [fp, #-120]
	ldr	r3, [fp, #-116]
	sub	r3, r2, r3
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-120]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-116]
	add	r3, r2, r3
	lsl	r3, r3, #2
	ldr	r2, [fp, #-112]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-60]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L3
	b	.L4
.L5:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-120]
	add	r3, r2, r3
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-112]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-100]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L5
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-116]
	str	r3, [fp, #-16]
	b	.L6
.L9:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-100]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-60]
	cmp	r2, r3
	blt	.L7
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-112]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-60]
	str	r3, [r2]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-112]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-100]
	str	r3, [r2]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L6:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L10
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L9
	b	.L10
.L11:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-112]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-60]
	str	r3, [r2]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L11
	b	.L12
.L13:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-112]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-100]
	str	r3, [r2]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L13
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Merge, .-Merge
	.align	2
	.global	MergeSort
	.syntax unified
	.arm
	.fpu softvfp
	.type	MergeSort, %function
MergeSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L16
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	MergeSort
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-16]
	bl	MergeSort
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	Merge
	str	r0, [fp, #-12]
.L16:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	MergeSort, .-MergeSort
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
	ldr	r3, .L22
	mov	r2, #10
	str	r2, [r3]
	mov	r3, #4
	str	r3, [fp, #-52]
	mov	r3, #3
	str	r3, [fp, #-48]
	mov	r3, #9
	str	r3, [fp, #-44]
	mov	r3, #2
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-32]
	mov	r3, #6
	str	r3, [fp, #-28]
	mov	r3, #5
	str	r3, [fp, #-24]
	mov	r3, #7
	str	r3, [fp, #-20]
	mov	r3, #8
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, .L22
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	sub	r3, fp, #52
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	MergeSort
	str	r0, [fp, #-8]
	b	.L19
.L20:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-48]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putch
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L19:
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L20
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	n
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
