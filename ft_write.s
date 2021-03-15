bits	64

section	.text
	global ft_write
	extern	__errno_location
	ft_write:
		mov	rax, 1			; Write syscall
		syscall
		cmp	rax, 0			; Return Value == 0 ?
		jl	error			; if DF != 0 then error
		ret				; else return
	error:
		push	rax			; Save errno
		call	__errno_location	; Retrieve address to errno
		pop	qword[rax]		; put errno in return value to ___erno_location
		neg	qword[rax]
		mov	rax, -1			; Return -1
		ret

; -------------------------------------------------------------------------------
; ssize_t write(int fd, const void *buf, size_t nBytes);
;
; Writes up to nBytes bytes from the buffer starting at buf to the file referred to by fd.
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------

