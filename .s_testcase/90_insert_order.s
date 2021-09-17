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
	.file	"90_insert_order.c"
	.text
	.comm	N,4,4
	.align	2
	.global	insert
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	insert, %function
insert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L4:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	ble	.L3
	ldr	r3, .L8
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L4
.L3:
	ldr	r3, .L8
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	b	.L5
.L6:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L5:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L6
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	N
	.size	insert, .-insert
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
	ldr	r3, .L14
	mov	r2, #10
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-56]
	mov	r3, #3
	str	r3, [fp, #-52]
	mov	r3, #4
	str	r3, [fp, #-48]
	mov	r3, #7
	str	r3, [fp, #-44]
	mov	r3, #8
	str	r3, [fp, #-40]
	mov	r3, #11
	str	r3, [fp, #-36]
	mov	r3, #13
	str	r3, [fp, #-32]
	mov	r3, #18
	str	r3, [fp, #-28]
	mov	r3, #56
	str	r3, [fp, #-24]
	mov	r3, #78
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	bl	getint
	str	r0, [fp, #-12]
	sub	r3, fp, #56
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	insert
	str	r0, [fp, #-12]
	b	.L11
.L12:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-52]
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
.L11:
	ldr	r3, .L14
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L12
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	N
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
