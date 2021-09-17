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
	.file	"99_register_realloc.c"
	.text
	.align	2
	.global	func
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	func, %function
func:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #164
	str	r0, [fp, #-160]
	str	r1, [fp, #-164]
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-164]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #2
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	mov	r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-32]
	add	r3, r3, #2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	add	r3, r3, #3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-48]
	add	r3, r3, #2
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-52]
	add	r3, r3, #3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-64]
	add	r3, r3, #2
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-68]
	add	r3, r3, #3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-72]
	add	r3, r3, #4
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-80]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-84]
	add	r3, r3, #3
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-88]
	add	r3, r3, #4
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-92]
	add	r3, r3, #1
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-96]
	add	r3, r3, #2
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-100]
	add	r3, r3, #3
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-104]
	add	r3, r3, #4
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-108]
	add	r3, r3, #1
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-112]
	add	r3, r3, #2
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-116]
	add	r3, r3, #3
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-120]
	add	r3, r3, #4
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-140]
	ldr	r3, [fp, #-128]
	add	r3, r3, #2
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-132]
	add	r3, r3, #3
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-136]
	add	r3, r3, #4
	str	r3, [fp, #-152]
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-164]
	sub	r3, r2, r3
	add	r3, r3, #10
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-140]
	ldr	r3, [fp, #-128]
	add	r3, r3, #2
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-132]
	add	r3, r3, #3
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-136]
	add	r3, r3, #4
	str	r3, [fp, #-152]
	ldr	r3, [fp, #-108]
	add	r3, r3, #1
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-112]
	add	r3, r3, #2
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-116]
	add	r3, r3, #3
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-120]
	add	r3, r3, #4
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-92]
	add	r3, r3, #1
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-96]
	add	r3, r3, #2
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-100]
	add	r3, r3, #3
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-104]
	add	r3, r3, #4
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-80]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-84]
	add	r3, r3, #3
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-88]
	add	r3, r3, #4
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-64]
	add	r3, r3, #2
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-68]
	add	r3, r3, #3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-72]
	add	r3, r3, #4
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-48]
	add	r3, r3, #2
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-52]
	add	r3, r3, #3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-32]
	add	r3, r3, #2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	add	r3, r3, #3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-144]
	add	r3, r3, #2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-148]
	add	r3, r3, #3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-152]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	sub	r2, r2, r3
	ldr	r3, [fp, #-32]
	sub	r2, r2, r3
	ldr	r3, [fp, #-36]
	sub	r2, r2, r3
	ldr	r3, [fp, #-40]
	sub	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r2, r2, r3
	ldr	r3, [fp, #-60]
	sub	r2, r2, r3
	ldr	r3, [fp, #-64]
	sub	r2, r2, r3
	ldr	r3, [fp, #-68]
	sub	r2, r2, r3
	ldr	r3, [fp, #-72]
	sub	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r2, r3
	ldr	r3, [fp, #-88]
	add	r2, r2, r3
	ldr	r3, [fp, #-92]
	sub	r2, r2, r3
	ldr	r3, [fp, #-96]
	sub	r2, r2, r3
	ldr	r3, [fp, #-100]
	sub	r2, r2, r3
	ldr	r3, [fp, #-104]
	sub	r2, r2, r3
	ldr	r3, [fp, #-108]
	add	r2, r2, r3
	ldr	r3, [fp, #-112]
	add	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r2, r2, r3
	ldr	r3, [fp, #-124]
	sub	r2, r2, r3
	ldr	r3, [fp, #-128]
	sub	r2, r2, r3
	ldr	r3, [fp, #-132]
	sub	r2, r2, r3
	ldr	r3, [fp, #-136]
	sub	r2, r2, r3
	ldr	r3, [fp, #-140]
	add	r2, r2, r3
	ldr	r3, [fp, #-144]
	add	r2, r2, r3
	ldr	r3, [fp, #-148]
	add	r2, r2, r3
	ldr	r3, [fp, #-152]
	add	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	func, .-func
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
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #18
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	func
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
