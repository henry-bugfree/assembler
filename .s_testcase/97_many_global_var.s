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
	.file	"97_many_global_var.c"
	.text
	.comm	a0,4,4
	.comm	a1,4,4
	.comm	a2,4,4
	.comm	a3,4,4
	.comm	a4,4,4
	.comm	a5,4,4
	.comm	a6,4,4
	.comm	a7,4,4
	.comm	a8,4,4
	.comm	a9,4,4
	.comm	a10,4,4
	.comm	a11,4,4
	.comm	a12,4,4
	.comm	a13,4,4
	.comm	a14,4,4
	.comm	a15,4,4
	.comm	a16,4,4
	.comm	a17,4,4
	.comm	a18,4,4
	.comm	a19,4,4
	.comm	a20,4,4
	.comm	a21,4,4
	.comm	a22,4,4
	.comm	a23,4,4
	.comm	a24,4,4
	.comm	a25,4,4
	.comm	a26,4,4
	.comm	a27,4,4
	.comm	a28,4,4
	.comm	a29,4,4
	.comm	a30,4,4
	.comm	a31,4,4
	.comm	a32,4,4
	.comm	a33,4,4
	.comm	a34,4,4
	.comm	a35,4,4
	.comm	a36,4,4
	.comm	a37,4,4
	.comm	a38,4,4
	.comm	a39,4,4
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
	sub	r2, r2, r3
	ldr	r3, [fp, #4]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	sub	r2, r2, r3
	ldr	r3, [fp, #12]
	sub	r2, r2, r3
	ldr	r3, [fp, #16]
	sub	r2, r2, r3
	ldr	r3, [fp, #20]
	add	r2, r2, r3
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
	add	r2, r2, r3
	ldr	r3, [fp, #40]
	add	r2, r2, r3
	ldr	r3, [fp, #44]
	add	r2, r2, r3
	ldr	r3, [fp, #48]
	add	r2, r2, r3
	ldr	r3, [fp, #52]
	add	r2, r2, r3
	ldr	r3, [fp, #56]
	add	r2, r2, r3
	ldr	r3, [fp, #60]
	sub	r2, r2, r3
	ldr	r3, [fp, #64]
	sub	r2, r2, r3
	ldr	r3, [fp, #68]
	sub	r2, r2, r3
	ldr	r3, [fp, #72]
	sub	r2, r2, r3
	ldr	r3, [fp, #76]
	sub	r2, r2, r3
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
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #196
	ldr	r3, .L9
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L9+4
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L9+8
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L9+12
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L9+16
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, .L9+20
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, .L9+24
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, .L9+28
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, .L9+32
	mov	r2, #8
	str	r2, [r3]
	ldr	r3, .L9+36
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L9+40
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L9+44
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L9+48
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L9+52
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L9+56
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, .L9+60
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, .L9+64
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, .L9+68
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, .L9+72
	mov	r2, #8
	str	r2, [r3]
	ldr	r3, .L9+76
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L9+80
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L9+84
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L9+88
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L9+92
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L9+96
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, .L9+100
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, .L9+104
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, .L9+108
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, .L9+112
	mov	r2, #8
	str	r2, [r3]
	ldr	r3, .L9+116
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L9+120
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L9+124
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L9+128
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, .L9+132
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, .L9+136
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, .L9+140
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, .L9+144
	mov	r2, #8
	str	r2, [r3]
	ldr	r3, .L9+148
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L9+152
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L9+156
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L9
	ldr	ip, [r3]
	ldr	r3, .L9+4
	ldr	lr, [r3]
	ldr	r3, .L9+8
	ldr	r4, [r3]
	ldr	r3, .L9+12
	ldr	r5, [r3]
	ldr	r3, .L9+16
	ldr	r3, [r3]
	ldr	r2, .L9+20
	ldr	r2, [r2]
	ldr	r1, .L9+24
	ldr	r1, [r1]
	ldr	r0, .L9+28
	ldr	r0, [r0]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r5
	mov	r2, r4
	mov	r1, lr
	mov	r0, ip
	bl	testParam8
	mov	r3, r0
	ldr	r2, .L9
	str	r3, [r2]
	ldr	r3, .L9
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint
	ldr	r3, .L9+128
	ldr	r10, [r3]
	ldr	r3, .L9+132
	ldr	r3, [r3]
	str	r3, [fp, #-40]
	ldr	r3, .L9+136
	ldr	r2, [r3]
	str	r2, [fp, #-44]
	ldr	r3, .L9+140
	ldr	r0, [r3]
	str	r0, [fp, #-48]
	ldr	r3, .L9+144
	ldr	r0, [r3]
	ldr	r3, .L9+148
	ldr	ip, [r3]
	ldr	r3, .L9+152
	ldr	lr, [r3]
	ldr	r3, .L9+156
	ldr	r4, [r3]
	ldr	r3, .L9+32
	ldr	r5, [r3]
	ldr	r3, .L9+36
	ldr	r6, [r3]
	ldr	r3, .L9+40
	ldr	r7, [r3]
	ldr	r3, .L9+44
	ldr	r8, [r3]
	ldr	r3, .L9+48
	ldr	r9, [r3]
	ldr	r3, .L9+52
	ldr	r1, [r3]
	ldr	r3, .L9+56
	ldr	r2, [r3]
	ldr	r3, .L9+60
	ldr	r3, [r3]
	str	r3, [sp, #44]
	str	r2, [sp, #40]
	str	r1, [sp, #36]
	str	r9, [sp, #32]
	str	r8, [sp, #28]
	str	r7, [sp, #24]
	str	r6, [sp, #20]
	str	r5, [sp, #16]
	str	r4, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	str	r0, [sp]
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-44]
	ldr	r1, [fp, #-40]
	mov	r0, r10
	bl	testParam16
	mov	r3, r0
	ldr	r2, .L9
	str	r3, [r2]
	ldr	r3, .L9
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint
	ldr	r3, .L9
	ldr	r3, [r3]
	str	r3, [fp, #-40]
	ldr	r3, .L9+4
	ldr	r2, [r3]
	str	r2, [fp, #-44]
	ldr	r3, .L9+8
	ldr	ip, [r3]
	str	ip, [fp, #-48]
	ldr	r3, .L9+12
	ldr	lr, [r3]
	str	lr, [fp, #-52]
	ldr	r3, .L9+16
	ldr	r4, [r3]
	str	r4, [fp, #-56]
	ldr	r3, .L9+20
	ldr	r5, [r3]
	str	r5, [fp, #-60]
	ldr	r3, .L9+24
	ldr	r6, [r3]
	str	r6, [fp, #-64]
	ldr	r3, .L9+28
	ldr	r7, [r3]
	str	r7, [fp, #-68]
	ldr	r3, .L9+32
	ldr	r8, [r3]
	str	r8, [fp, #-72]
	ldr	r3, .L9+36
	ldr	r9, [r3]
	str	r9, [fp, #-76]
	ldr	r3, .L9+40
	ldr	r10, [r3]
	str	r10, [fp, #-80]
	ldr	r3, .L9+44
	ldr	r1, [r3]
	str	r1, [fp, #-84]
	ldr	r3, .L9+48
	ldr	r0, [r3]
	str	r0, [fp, #-88]
	ldr	r3, .L9+52
	ldr	ip, [r3]
	str	ip, [fp, #-92]
	ldr	r3, .L9+56
	ldr	lr, [r3]
	str	lr, [fp, #-96]
	ldr	r3, .L9+60
	ldr	r3, [r3]
	str	r3, [fp, #-100]
	ldr	r3, .L9+64
	ldr	r2, [r3]
	str	r2, [fp, #-104]
	ldr	r3, .L9+68
	ldr	r4, [r3]
	str	r4, [fp, #-108]
	ldr	r3, .L9+72
	ldr	r5, [r3]
	str	r5, [fp, #-112]
	ldr	r3, .L9+76
	ldr	r10, [r3]
	ldr	r3, .L9+80
	ldr	r9, [r3]
	ldr	r3, .L9+84
	ldr	r8, [r3]
	ldr	r3, .L9+88
	ldr	r7, [r3]
	ldr	r3, .L9+92
	ldr	r6, [r3]
	ldr	r3, .L9+96
	ldr	r5, [r3]
	ldr	r3, .L9+100
	ldr	r4, [r3]
	ldr	r3, .L9+104
	ldr	lr, [r3]
	ldr	r3, .L9+108
	ldr	ip, [r3]
	ldr	r3, .L9+112
	ldr	r0, [r3]
	ldr	r3, .L9+116
	ldr	r1, [r3]
	ldr	r3, .L9+120
	ldr	r2, [r3]
	ldr	r3, .L9+124
	ldr	r3, [r3]
	str	r3, [sp, #108]
	str	r2, [sp, #104]
	str	r1, [sp, #100]
	str	r0, [sp, #96]
	str	ip, [sp, #92]
	str	lr, [sp, #88]
	str	r4, [sp, #84]
	str	r5, [sp, #80]
	str	r6, [sp, #76]
	str	r7, [sp, #72]
	str	r8, [sp, #68]
	str	r9, [sp, #64]
	str	r10, [sp, #60]
	ldr	r5, [fp, #-112]
	str	r5, [sp, #56]
	ldr	r4, [fp, #-108]
	str	r4, [sp, #52]
	ldr	r2, [fp, #-104]
	str	r2, [sp, #48]
	ldr	r3, [fp, #-100]
	str	r3, [sp, #44]
	ldr	lr, [fp, #-96]
	str	lr, [sp, #40]
	ldr	ip, [fp, #-92]
	str	ip, [sp, #36]
	ldr	r0, [fp, #-88]
	str	r0, [sp, #32]
	ldr	r1, [fp, #-84]
	str	r1, [sp, #28]
	ldr	r10, [fp, #-80]
	str	r10, [sp, #24]
	ldr	r9, [fp, #-76]
	str	r9, [sp, #20]
	ldr	r8, [fp, #-72]
	str	r8, [sp, #16]
	ldr	r7, [fp, #-68]
	str	r7, [sp, #12]
	ldr	r6, [fp, #-64]
	str	r6, [sp, #8]
	ldr	r5, [fp, #-60]
	str	r5, [sp, #4]
	ldr	r4, [fp, #-56]
	str	r4, [sp]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-40]
	bl	testParam32
	mov	r3, r0
	ldr	r2, .L9
	str	r3, [r2]
	ldr	r3, .L9
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	a0
	.word	a1
	.word	a2
	.word	a3
	.word	a4
	.word	a5
	.word	a6
	.word	a7
	.word	a8
	.word	a9
	.word	a10
	.word	a11
	.word	a12
	.word	a13
	.word	a14
	.word	a15
	.word	a16
	.word	a17
	.word	a18
	.word	a19
	.word	a20
	.word	a21
	.word	a22
	.word	a23
	.word	a24
	.word	a25
	.word	a26
	.word	a27
	.word	a28
	.word	a29
	.word	a30
	.word	a31
	.word	a32
	.word	a33
	.word	a34
	.word	a35
	.word	a36
	.word	a37
	.word	a38
	.word	a39
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
