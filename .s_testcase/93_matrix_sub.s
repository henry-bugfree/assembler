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
	.file	"93_matrix_sub.c"
	.text
	.comm	N,4,4
	.comm	M,4,4
	.comm	L,4,4
	.align	2
	.global	sub
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sub, %function
sub:
	@ Function supports interworking.
	@ args = 20, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r0, [fp, #12]
	add	r3, r0, r3
	sub	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r0, [fp, #16]
	add	r3, r0, r3
	sub	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r0, [fp, #20]
	add	r3, r0, r3
	sub	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L3
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sub, .-sub
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #152
	ldr	r3, .L15
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L15+4
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L15+8
	mov	r2, #3
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #-20]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #-32]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #-44]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #-56]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #-68]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #-80]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L7
	sub	ip, fp, #60
	sub	r2, fp, #48
	sub	r1, fp, #36
	sub	r0, fp, #24
	sub	r3, fp, #132
	str	r3, [sp, #16]
	sub	r3, fp, #120
	str	r3, [sp, #12]
	sub	r3, fp, #108
	str	r3, [sp, #8]
	sub	r3, fp, #84
	str	r3, [sp, #4]
	sub	r3, fp, #72
	str	r3, [sp]
	mov	r3, ip
	bl	sub
	str	r0, [fp, #-8]
	b	.L8
.L9:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-104]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L9
	mov	r3, #10
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-12]
	bl	putch
	b	.L10
.L11:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-116]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L11
	mov	r3, #10
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-12]
	bl	putch
	b	.L12
.L13:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-128]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L13
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
.L16:
	.align	2
.L15:
	.word	N
	.word	M
	.word	L
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
