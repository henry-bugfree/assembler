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
	.file	"34_func_test2.c"
	.text
	.align	2
	.global	func1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	func1, %function
func1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	func1, .-func1
	.align	2
	.global	func2
	.syntax unified
	.arm
	.fpu softvfp
	.type	func2, %function
func2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	func2, .-func2
	.align	2
	.global	func3
	.syntax unified
	.arm
	.fpu softvfp
	.type	func3, %function
func3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	func3, .-func3
	.align	2
	.global	func4
	.syntax unified
	.arm
	.fpu softvfp
	.type	func4, %function
func4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, #8
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	mov	r3, #16
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	func4, .-func4
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
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	mov	r3, #32
	str	r3, [fp, #-16]
	mov	r3, #32
	str	r3, [fp, #-20]
	mov	r3, #32
	str	r3, [fp, #-24]
	bl	func1
	mov	r4, r0
	bl	func2
	mov	r3, r0
	add	r4, r4, r3
	bl	func3
	mov	r3, r0
	add	r4, r4, r3
	bl	func4
	mov	r3, r0
	add	r2, r4, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
