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
	.file	"58_sort_test6.c"
	.text
	.comm	n,4,4
	.align	2
	.global	counting_sort
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	counting_sort, %function
counting_sort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #76
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-52]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L3
	b	.L4
.L5:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-64]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-52]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-64]
	add	r3, r1, r3
	ldr	r3, [r3]
	add	r2, r2, #1
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-52]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-72]
	cmp	r2, r3
	blt	.L5
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L6
.L7:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-52]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-52]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L6:
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L7
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-12]
	b	.L8
.L9:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-64]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-52]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r1, [fp, #-64]
	add	r3, r1, r3
	ldr	r3, [r3]
	sub	r2, r2, #1
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-52]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r1, [fp, #-64]
	add	r3, r1, r3
	ldr	r3, [r3]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-52]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-68]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L8:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bgt	.L9
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	counting_sort, .-counting_sort
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #88
	ldr	r3, .L15
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
	ldr	r3, .L15
	ldr	r2, [r3]
	sub	r1, fp, #92
	sub	r3, fp, #52
	mov	r0, r3
	bl	counting_sort
	str	r0, [fp, #-8]
	b	.L12
.L13:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-88]
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
.L12:
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L13
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	n
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
