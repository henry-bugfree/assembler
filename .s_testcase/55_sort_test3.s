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
	.file	"55_sort_test3.c"
	.text
	.comm	n,4,4
	.align	2
	.global	QuickSort
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	QuickSort, %function
QuickSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L2
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	b	.L3
.L6:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	ble	.L6
.L5:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L8
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L8
.L10:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L9
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bgt	.L10
.L9:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	QuickSort
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-24]
	bl	QuickSort
	str	r0, [fp, #-20]
.L2:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	QuickSort, .-QuickSort
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	ldr	r3, .L17
	mov	r2, #10
	str	r2, [r3]
	mov	r3, #4
	str	r3, [fp, #-56]
	mov	r3, #3
	str	r3, [fp, #-52]
	mov	r3, #9
	str	r3, [fp, #-48]
	mov	r3, #2
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #1
	str	r3, [fp, #-36]
	mov	r3, #6
	str	r3, [fp, #-32]
	mov	r3, #5
	str	r3, [fp, #-28]
	mov	r3, #7
	str	r3, [fp, #-24]
	mov	r3, #8
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #9
	str	r3, [fp, #-12]
	sub	r3, fp, #56
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	QuickSort
	str	r0, [fp, #-8]
	b	.L14
.L15:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-52]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	putch
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L14:
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L15
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	n
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
