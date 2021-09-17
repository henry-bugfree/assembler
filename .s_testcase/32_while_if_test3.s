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
	.file	"32_while_if_test3.c"
	.text
	.align	2
	.global	deepWhileBr
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	deepWhileBr, %function
deepWhileBr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	b	.L2
.L3:
	mov	r3, #42
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	bgt	.L2
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L2
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #74
	ble	.L3
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	deepWhileBr, .-deepWhileBr
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
	mov	r3, #2
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	deepWhileBr
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
