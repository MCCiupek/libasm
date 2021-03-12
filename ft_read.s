bits	64

section	.text
	global ft_read
	extern __errno_location
	ft_read:
		mov	rax, 2		; Open syscall
		xor	rsi, rsi	; flags (0 = O_RDONLY)
		syscall
		test	rax, rax
		jz	error
		push	rax
		sub	rsp, 16		; reserve 16 bytes of memory
	read_buf:
		xor	rax, rax	; Read syscall
		mov	rdi, [rsp + 16]	; fd
		mov	rsi, rsp	; address of buffer
		mov	rdx, 16		; buffer size
		syscall
		test	rax, rax
		jz	error
		ret
	error:
		push	rax
		call	__errno_location
		pop	qword[rax]
		neg	qword[rax]
		mov	rax, -1
		ret
		
