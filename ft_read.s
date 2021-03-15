bits	64

section	.text
	global ft_read
	extern __errno_location
	ft_read:
		xor	rax, rax		; Read syscall
		syscall
		cmp	rax, 0			; Return Value == 0 ?
		jl	error			; if DF != 0 then error
		ret				; else return
	error:
		push	rax			; Save errno
		call	__errno_location	; REtrieve address to errno
		pop	qword[rax]		; Put errno in return value to __errno_location
		neg	qword[rax]
		mov	rax, -1			; Return -1
		ret

; -------------------------------------------------------------------------------
; ssize_t read(int fd, void *buf, size_t count);
;
; read()  attempts  to read up to count bytes from
; file descriptor fd into the buffer  starting  at
; buf.
;
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------

