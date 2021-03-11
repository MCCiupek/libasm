bits	64

section	.text
	global ft_write
	extern	__errno_location
	ft_write:
		mov	rax, 1
		syscall
		cmp	rax, 0
		jl	error
		ret
	error:
		push	rax
		call	__errno_location
		pop	qword[rax]
		neg	qword[rax]
		mov	rax, -1
		ret
