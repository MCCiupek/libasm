bits 64

section .text
	global ft_strlen
	ft_strlen:
		mov 	rax, 0			; Initiate rax to 0
		jmp	while			; Enter while loop
	while:
		cmp	BYTE [rdi + rax], 0	; s[i] == 0 ?
		je	exit			; if TRUE { exit while }
		inc	rax			; else { i++
		jmp	while			; loop }
	exit:
		ret				; exit function

; -------------------------------------------------------------------------------
; Returns the length of a string.
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------
