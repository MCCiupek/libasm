bits	64

section .text
	global ft_strcpy
	ft_strcpy:
		push	rbp
		push	rdx
		mov	rbp, rsp
		mov	rdx, 0
	loop:
		mov	al, BYTE [rsi + rdx]
		mov	BYTE [rdi + rdx], al
		inc	rdx
		cmp	al, 0
		jne	loop
		mov	rax, rdi
		mov	rsp, rbp
		pop	rdx
		pop	rbp
		ret

;-------------------------------------------------------------------------------
; char *strcpy(char *dest, const char *src);
;
; The  strcpy()  function copies the string pointed to by
; src, including the terminating null byte ('\0'), to the
; buffer  pointed  to by dest. 
;
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------


