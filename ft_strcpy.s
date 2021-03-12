bits	64

section .text
	global ft_strcpy
	ft_strcpy:
		push	rbp
		push	rdx
		mov	rbp, rsp
		mov	rdx, 0
	loop:
		;cmp	BYTE [rsi + rdx], 0
		;je	exit
		mov	al, BYTE [rsi + rdx]
		mov	BYTE [rdi + rdx], al
		inc	rdx
		cmp	al, 0
		jne	loop
		;jmp	loop
	;exit:
	;	xor	al, al
	;	mov	BYTE [rdi + rdx], al	
		mov	rax, rdi
		mov	rsp, rbp
		pop	rdx
		pop	rbp
		ret
