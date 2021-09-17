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
	.file	"96_many_param_call.c"
	.text
	.align	2
	.global	testParam8
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	testParam8, %function
testParam8:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	sub	r2, r2, r3
	ldr	r3, [fp, #-20]
	sub	r2, r2, r3
	ldr	r3, [fp, #4]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r2, r3
	ldr	r3, [fp, #12]
	add	r2, r2, r3
	ldr	r3, [fp, #16]
	add	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	testParam8, .-testParam8
	.align	2
	.global	testParam16
	.syntax unified
	.arm
	.fpu softvfp
	.type	testParam16, %function
testParam16:
	@ Function supports interworking.
	@ args = 48, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r2, r3
	ldr	r3, [fp, #12]
	add	r2, r2, r3
	ldr	r3, [fp, #16]
	add	r2, r2, r3
	ldr	r3, [fp, #20]
	sub	r2, r2, r3
	ldr	r3, [fp, #24]
	add	r2, r2, r3
	ldr	r3, [fp, #28]
	add	r2, r2, r3
	ldr	r3, [fp, #32]
	add	r2, r2, r3
	ldr	r3, [fp, #36]
	add	r2, r2, r3
	ldr	r3, [fp, #40]
	add	r2, r2, r3
	ldr	r3, [fp, #44]
	add	r2, r2, r3
	ldr	r3, [fp, #48]
	add	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	testParam16, .-testParam16
	.align	2
	.global	testParam32
	.syntax unified
	.arm
	.fpu softvfp
	.type	testParam32, %function
testParam32:
	@ Function supports interworking.
	@ args = 112, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r2, r3
	ldr	r3, [fp, #12]
	add	r2, r2, r3
	ldr	r3, [fp, #16]
	add	r2, r2, r3
	ldr	r3, [fp, #20]
	add	r2, r2, r3
	ldr	r3, [fp, #24]
	add	r2, r2, r3
	ldr	r3, [fp, #28]
	add	r2, r2, r3
	ldr	r3, [fp, #32]
	add	r2, r2, r3
	ldr	r3, [fp, #36]
	sub	r2, r2, r3
	ldr	r3, [fp, #40]
	sub	r2, r2, r3
	ldr	r3, [fp, #44]
	sub	r2, r2, r3
	ldr	r3, [fp, #48]
	sub	r2, r2, r3
	ldr	r3, [fp, #52]
	sub	r2, r2, r3
	ldr	r3, [fp, #56]
	sub	r2, r2, r3
	ldr	r3, [fp, #60]
	sub	r2, r2, r3
	ldr	r3, [fp, #64]
	sub	r2, r2, r3
	ldr	r3, [fp, #68]
	sub	r2, r2, r3
	ldr	r3, [fp, #72]
	sub	r2, r2, r3
	ldr	r3, [fp, #76]
	add	r2, r2, r3
	ldr	r3, [fp, #80]
	add	r2, r2, r3
	ldr	r3, [fp, #84]
	add	r2, r2, r3
	ldr	r3, [fp, #88]
	add	r2, r2, r3
	ldr	r3, [fp, #92]
	add	r2, r2, r3
	ldr	r3, [fp, #96]
	add	r2, r2, r3
	ldr	r3, [fp, #100]
	add	r2, r2, r3
	ldr	r3, [fp, #104]
	add	r2, r2, r3
	ldr	r3, [fp, #108]
	add	r2, r2, r3
	ldr	r3, [fp, #112]
	add	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	testParam32, .-testParam32
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
	sub	sp, sp, #240
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #2
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	mov	r3, #4
	str	r3, [fp, #-24]
	mov	r3, #5
	str	r3, [fp, #-28]
	mov	r3, #6
	str	r3, [fp, #-32]
	mov	r3, #7
	str	r3, [fp, #-36]
	mov	r3, #8
	str	r3, [fp, #-40]
	mov	r3, #9
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #1
	str	r3, [fp, #-52]
	mov	r3, #2
	str	r3, [fp, #-56]
	mov	r3, #3
	str	r3, [fp, #-60]
	mov	r3, #4
	str	r3, [fp, #-64]
	mov	r3, #5
	str	r3, [fp, #-68]
	mov	r3, #6
	str	r3, [fp, #-72]
	mov	r3, #7
	str	r3, [fp, #-76]
	mov	r3, #8
	str	r3, [fp, #-80]
	mov	r3, #9
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-88]
	mov	r3, #1
	str	r3, [fp, #-92]
	mov	r3, #2
	str	r3, [fp, #-96]
	mov	r3, #3
	str	r3, [fp, #-100]
	mov	r3, #4
	str	r3, [fp, #-104]
	mov	r3, #5
	str	r3, [fp, #-108]
	mov	r3, #6
	str	r3, [fp, #-112]
	mov	r3, #7
	str	r3, [fp, #-116]
	mov	r3, #8
	str	r3, [fp, #-120]
	mov	r3, #9
	str	r3, [fp, #-124]
	mov	r3, #0
	str	r3, [fp, #-128]
	mov	r3, #1
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-36]
	str	r3, [sp, #12]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #8]
	ldr	r3, [fp, #-28]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-24]
	str	r3, [sp]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	testParam8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	putint
	ldr	r3, [fp, #-68]
	str	r3, [sp, #44]
	ldr	r3, [fp, #-64]
	str	r3, [sp, #40]
	ldr	r3, [fp, #-60]
	str	r3, [sp, #36]
	ldr	r3, [fp, #-56]
	str	r3, [sp, #32]
	ldr	r3, [fp, #-52]
	str	r3, [sp, #28]
	ldr	r3, [fp, #-48]
	str	r3, [sp, #24]
	ldr	r3, [fp, #-44]
	str	r3, [sp, #20]
	ldr	r3, [fp, #-40]
	str	r3, [sp, #16]
	ldr	r3, [fp, #-36]
	str	r3, [sp, #12]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #8]
	ldr	r3, [fp, #-28]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-24]
	str	r3, [sp]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	testParam16
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	putint
	ldr	r3, [fp, #-132]
	str	r3, [sp, #108]
	ldr	r3, [fp, #-128]
	str	r3, [sp, #104]
	ldr	r3, [fp, #-124]
	str	r3, [sp, #100]
	ldr	r3, [fp, #-120]
	str	r3, [sp, #96]
	ldr	r3, [fp, #-116]
	str	r3, [sp, #92]
	ldr	r3, [fp, #-112]
	str	r3, [sp, #88]
	ldr	r3, [fp, #-108]
	str	r3, [sp, #84]
	ldr	r3, [fp, #-104]
	str	r3, [sp, #80]
	ldr	r3, [fp, #-100]
	str	r3, [sp, #76]
	ldr	r3, [fp, #-96]
	str	r3, [sp, #72]
	ldr	r3, [fp, #-92]
	str	r3, [sp, #68]
	ldr	r3, [fp, #-88]
	str	r3, [sp, #64]
	ldr	r3, [fp, #-84]
	str	r3, [sp, #60]
	ldr	r3, [fp, #-80]
	str	r3, [sp, #56]
	ldr	r3, [fp, #-76]
	str	r3, [sp, #52]
	ldr	r3, [fp, #-72]
	str	r3, [sp, #48]
	ldr	r3, [fp, #-68]
	str	r3, [sp, #44]
	ldr	r3, [fp, #-64]
	str	r3, [sp, #40]
	ldr	r3, [fp, #-60]
	str	r3, [sp, #36]
	ldr	r3, [fp, #-56]
	str	r3, [sp, #32]
	ldr	r3, [fp, #-52]
	str	r3, [sp, #28]
	ldr	r3, [fp, #-48]
	str	r3, [sp, #24]
	ldr	r3, [fp, #-44]
	str	r3, [sp, #20]
	ldr	r3, [fp, #-40]
	str	r3, [sp, #16]
	ldr	r3, [fp, #-36]
	str	r3, [sp, #12]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #8]
	ldr	r3, [fp, #-28]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-24]
	str	r3, [sp]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	testParam32
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	putint
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
