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
	.file	"72_enum.c"
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L5:
	ldr	r3, [fp, #-8]
	rsb	r2, r3, #100
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r2, r3, r2
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsr	r1, r3, #31
	add	r3, r1, r3
	asr	r3, r3, #1
	add	r3, r2, r3
	cmp	r3, #100
	bne	.L4
	ldr	r0, [fp, #-8]
	bl	putint
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r0, [fp, #-16]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	putch
.L4:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #101
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L5
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #20
	ble	.L3
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
