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
	.file	"57_sort_test5.c"
	.text
	.comm	n,4,4
	.align	2
	.global	swap
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swap, .-swap
	.align	2
	.global	heap_ajust
	.syntax unified
	.arm
	.fpu softvfp
	.type	heap_ajust, %function
heap_ajust:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L4
.L8:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L5:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L6
	mov	r3, #0
	b	.L7
.L6:
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	swap
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L8
	mov	r3, #0
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	heap_ajust, .-heap_ajust
	.align	2
	.global	heap_sort
	.syntax unified
	.arm
	.fpu softvfp
	.type	heap_sort, %function
heap_sort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L10
.L11:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	heap_ajust
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L11
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L12
.L13:
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-24]
	bl	swap
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-24]
	bl	heap_ajust
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L13
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	heap_sort, .-heap_sort
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
	ldr	r3, .L19
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
	ldr	r3, .L19
	ldr	r2, [r3]
	sub	r3, fp, #52
	mov	r1, r2
	mov	r0, r3
	bl	heap_sort
	str	r0, [fp, #-8]
	b	.L16
.L17:
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
.L16:
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L17
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	n
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
