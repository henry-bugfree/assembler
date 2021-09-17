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
	.file	"83_enc_dec.c"
	.text
	.align	2
	.global	enc
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	enc, %function
enc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #25
	ble	.L2
	ldr	r3, [fp, #-8]
	add	r3, r3, #60
	str	r3, [fp, #-8]
	b	.L3
.L2:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #15
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	enc, .-enc
	.align	2
	.global	dec
	.syntax unified
	.arm
	.fpu softvfp
	.type	dec, %function
dec:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #85
	ble	.L6
	ldr	r3, [fp, #-8]
	sub	r3, r3, #59
	str	r3, [fp, #-8]
	b	.L7
.L6:
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	dec, .-dec
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
	mov	r3, #400
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	enc
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	dec
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
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
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
