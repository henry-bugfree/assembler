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
	.file	"62_long_code.c"
	.text
	.comm	n,4,4
	.align	2
	.global	bubblesort
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	bubblesort, %function
bubblesort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L6:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L5:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L4
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
.L4:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L5
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, .L8
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L6
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	n
	.size	bubblesort, .-bubblesort
	.align	2
	.global	insertsort
	.syntax unified
	.arm
	.fpu softvfp
	.type	insertsort, %function
insertsort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L11
.L15:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L12
.L14:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L13
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L14
.L13:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	ldr	r3, .L17
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L15
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	n
	.size	insertsort, .-insertsort
	.align	2
	.global	QuickSort
	.syntax unified
	.arm
	.fpu softvfp
	.type	QuickSort, %function
QuickSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L20
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	b	.L21
.L24:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L22:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L23
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	ble	.L24
.L23:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L26
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L26
.L28:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L26:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L27
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bgt	.L28
.L27:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L21
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L21:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L22
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	QuickSort
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-24]
	bl	QuickSort
	str	r0, [fp, #-20]
.L20:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	QuickSort, .-QuickSort
	.align	2
	.global	getMid
	.syntax unified
	.arm
	.fpu softvfp
	.type	getMid, %function
getMid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L34
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L32
	ldr	r3, .L34
	ldr	r3, [r3]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r3, [r3]
	add	r3, r2, r3
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	b	.L33
.L32:
	ldr	r3, .L34
	ldr	r3, [r3]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
.L33:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L35:
	.align	2
.L34:
	.word	n
	.size	getMid, .-getMid
	.align	2
	.global	getMost
	.syntax unified
	.arm
	.fpu softvfp
	.type	getMost, %function
getMost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 4024
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #4016
	sub	sp, sp, #12
	str	r0, [fp, #-4024]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L37
.L38:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #-4016]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L37:
	ldr	r3, [fp, #-8]
	cmp	r3, #1000
	blt	.L38
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L39
.L41:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-4024]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-4016]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-4016]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-4016]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bge	.L40
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-4016]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
.L40:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L39:
	ldr	r3, .L43
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L41
	ldr	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L44:
	.align	2
.L43:
	.word	n
	.size	getMost, .-getMost
	.align	2
	.global	revert
	.syntax unified
	.arm
	.fpu softvfp
	.type	revert, %function
revert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L46
.L47:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L46:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L47
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	revert, .-revert
	.align	2
	.global	arrCopy
	.syntax unified
	.arm
	.fpu softvfp
	.type	arrCopy, %function
arrCopy:
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
	b	.L50
.L51:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L50:
	ldr	r3, .L53
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L51
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L54:
	.align	2
.L53:
	.word	n
	.size	arrCopy, .-arrCopy
	.global	__aeabi_idivmod
	.align	2
	.global	calSum
	.syntax unified
	.arm
	.fpu softvfp
	.type	calSum, %function
calSum:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L56
.L59:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	cmp	r2, r3
	beq	.L57
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	b	.L58
.L57:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-8]
.L58:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L56:
	ldr	r3, .L61
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L59
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	n
	.size	calSum, .-calSum
	.global	__aeabi_idiv
	.align	2
	.global	avgPooling
	.syntax unified
	.arm
	.fpu softvfp
	.type	avgPooling, %function
avgPooling:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L64
.L68:
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bge	.L65
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	b	.L66
.L65:
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bne	.L67
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-16]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3]
	b	.L66
.L67:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r4, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-16]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [r4]
.L66:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L64:
	ldr	r3, .L72
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	blt	.L68
	ldr	r3, .L72
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L69
.L70:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L69:
	ldr	r3, .L72
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	blt	.L70
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	n
	.size	avgPooling, .-avgPooling
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 264
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #264
	ldr	r3, .L90
	mov	r2, #32
	str	r2, [r3]
	mov	r3, #7
	str	r3, [fp, #-140]
	mov	r3, #23
	str	r3, [fp, #-136]
	mov	r3, #89
	str	r3, [fp, #-132]
	mov	r3, #26
	str	r3, [fp, #-128]
	ldr	r3, .L90+4
	str	r3, [fp, #-124]
	mov	r3, #254
	str	r3, [fp, #-120]
	mov	r3, #27
	str	r3, [fp, #-116]
	mov	r3, #5
	str	r3, [fp, #-112]
	mov	r3, #83
	str	r3, [fp, #-108]
	ldr	r3, .L90+8
	str	r3, [fp, #-104]
	ldr	r3, .L90+12
	str	r3, [fp, #-100]
	ldr	r3, .L90+16
	str	r3, [fp, #-96]
	ldr	r3, .L90+20
	str	r3, [fp, #-92]
	ldr	r3, .L90+24
	str	r3, [fp, #-88]
	ldr	r3, .L90+28
	str	r3, [fp, #-84]
	mov	r3, #264
	str	r3, [fp, #-80]
	ldr	r3, .L90+32
	str	r3, [fp, #-76]
	ldr	r3, .L90+36
	str	r3, [fp, #-72]
	mov	r3, #29
	str	r3, [fp, #-68]
	mov	r3, #68
	str	r3, [fp, #-64]
	ldr	r3, .L90+40
	str	r3, [fp, #-60]
	mov	r3, #756
	str	r3, [fp, #-56]
	mov	r3, #452
	str	r3, [fp, #-52]
	ldr	r3, .L90+44
	str	r3, [fp, #-48]
	mov	r3, #58
	str	r3, [fp, #-44]
	mov	r3, #87
	str	r3, [fp, #-40]
	mov	r3, #96
	str	r3, [fp, #-36]
	mov	r3, #36
	str	r3, [fp, #-32]
	mov	r3, #39
	str	r3, [fp, #-28]
	mov	r3, #28
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r3, .L90+48
	str	r3, [fp, #-16]
	sub	r2, fp, #268
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	arrCopy
	str	r0, [fp, #-12]
	sub	r3, fp, #268
	mov	r0, r3
	bl	revert
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L75
.L76:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L75:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L76
	sub	r3, fp, #268
	mov	r0, r3
	bl	bubblesort
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L77
.L78:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L77:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L78
	sub	r3, fp, #268
	mov	r0, r3
	bl	getMid
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	sub	r3, fp, #268
	mov	r0, r3
	bl	getMost
	str	r0, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	sub	r2, fp, #268
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	arrCopy
	str	r0, [fp, #-12]
	sub	r3, fp, #268
	mov	r0, r3
	bl	bubblesort
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L79
.L80:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L79:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L80
	sub	r2, fp, #268
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	arrCopy
	str	r0, [fp, #-12]
	sub	r3, fp, #268
	mov	r0, r3
	bl	insertsort
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L81
.L82:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L81:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L82
	sub	r2, fp, #268
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	arrCopy
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #31
	str	r3, [fp, #-12]
	sub	r3, fp, #268
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	QuickSort
	str	r0, [fp, #-12]
	b	.L83
.L84:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L83:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L84
	sub	r2, fp, #268
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	arrCopy
	str	r0, [fp, #-12]
	sub	r3, fp, #268
	mov	r1, #4
	mov	r0, r3
	bl	calSum
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L85
.L86:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L85:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L86
	sub	r2, fp, #268
	sub	r3, fp, #140
	mov	r1, r2
	mov	r0, r3
	bl	arrCopy
	str	r0, [fp, #-12]
	sub	r3, fp, #268
	mov	r1, #3
	mov	r0, r3
	bl	avgPooling
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L87
.L88:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-264]
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	putint
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L87:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L88
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	n
	.word	282
	.word	273
	.word	574
	.word	905
	.word	354
	.word	657
	.word	935
	.word	639
	.word	459
	.word	929
	.word	279
	.word	290
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
