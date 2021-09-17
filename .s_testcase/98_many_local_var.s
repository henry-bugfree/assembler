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
	.file	"98_many_local_var.c"
	.text
	.comm	n,4,4
	.align	2
	.global	main
	.arch armv4t
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
	sub	sp, sp, #128
	bl	getint
	str	r0, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	beq	.L3
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	add	r3, r3, #1
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	add	r3, r3, #1
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	add	r3, r3, #1
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-104]
	add	r3, r3, #1
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	add	r3, r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-120]
	add	r3, r3, #1
	str	r3, [fp, #-124]
	ldr	r3, [fp, #-124]
	add	r3, r3, #1
	str	r3, [fp, #-128]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r0, [fp, #-16]
	bl	putint
	ldr	r0, [fp, #-20]
	bl	putint
	ldr	r0, [fp, #-24]
	bl	putint
	ldr	r0, [fp, #-28]
	bl	putint
	ldr	r0, [fp, #-32]
	bl	putint
	ldr	r0, [fp, #-36]
	bl	putint
	ldr	r0, [fp, #-40]
	bl	putint
	ldr	r0, [fp, #-44]
	bl	putint
	ldr	r0, [fp, #-48]
	bl	putint
	ldr	r0, [fp, #-52]
	bl	putint
	ldr	r0, [fp, #-56]
	bl	putint
	ldr	r0, [fp, #-60]
	bl	putint
	ldr	r0, [fp, #-64]
	bl	putint
	ldr	r0, [fp, #-68]
	bl	putint
	ldr	r0, [fp, #-72]
	bl	putint
	ldr	r0, [fp, #-76]
	bl	putint
	ldr	r0, [fp, #-80]
	bl	putint
	ldr	r0, [fp, #-84]
	bl	putint
	ldr	r0, [fp, #-88]
	bl	putint
	ldr	r0, [fp, #-92]
	bl	putint
	ldr	r0, [fp, #-96]
	bl	putint
	ldr	r0, [fp, #-100]
	bl	putint
	ldr	r0, [fp, #-104]
	bl	putint
	ldr	r0, [fp, #-108]
	bl	putint
	ldr	r0, [fp, #-112]
	bl	putint
	ldr	r0, [fp, #-116]
	bl	putint
	ldr	r0, [fp, #-120]
	bl	putint
	ldr	r0, [fp, #-124]
	bl	putint
	ldr	r0, [fp, #-128]
	bl	putint
	mov	r3, #10
	str	r3, [fp, #-132]
	ldr	r0, [fp, #-132]
	bl	putch
	ldr	r0, [fp, #-8]
	bl	putint
	ldr	r0, [fp, #-132]
	bl	putch
	ldr	r3, [fp, #-112]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
