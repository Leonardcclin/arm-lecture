	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3,r4,r5,r6,lr}	@function prolog
	add r4, r0, #0		@r4<-arg0
	mov r5, #0		@r5<-#0
	sub r5, r5, #1		@r5<-#-1 previous
	mov r6, #1		@r6<-#1 result
.loop:
	add r3, r5, r6
	mov r5, r6
	mov r6, r3

	sub r4, r4, #1		@r4--
	cmp r4, #-1		@compare with -1
	bne .loop		@branch if not equal
	mov r0, r6		@return result

	pop {r3,r4,r5,r6,pc}

	.size fibonacci, .-fibonacci
	.end
