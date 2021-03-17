bits	64

section	.text
	global	ft_strdup
	
	extern	ft_strlen
	extern	ft_strcpy
	extern	malloc
	extern	__errno_location

	ft_strdup:
		push	rdi			; rdi = string to cpoy
		call	ft_strlen		; get length
		inc	rax			; add one for the null-terminating character
		mov	rdi, rax		; move length to rdi to use it as argument
		;mov	rdi, -1
		call	malloc			; call malloc(length)
		;test	rax, rax
		cmp	rax, 0			; if malloc returns NULL then,
		je 	exit			; 	exit
		mov	rdi, rax		; send dest as arg
		pop	rsi
		call	ft_strcpy		; call strcpy
		ret				; return
	exit:
	;	push	rax			; save errno
		call	__errno_location	; retrieve errno address
		mov	rdi, 12
		mov 	[rax],rdi
	;	pop	qword[rax]
	;	neg	qword[rax]
		mov	rax, 0			; return 0
		pop	rdi
		ret

; -------------------------------------------------------------------------------
; char *strdup(const char *s);
;
; The strdup() function returns a pointer to a new stringwhich  is  a duplicate of the string s.
;
; Runs on 64-bits Linux only
; -------------------------------------------------------------------------------
