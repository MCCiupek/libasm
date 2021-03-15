bits 64

section .text
	global ft_strcmp
	ft_strcmp:
		or	al, al		; rax = 0
		jz	exit		; compare and inc until [rdi] = [rsi]
		sub	al, [rsi]	; exit if rdi = rsi
		jnz	exit		
		inc	rsi
		jmp	ft_strcmp
	exit:
		mov	rax, [rdi]
		sub	rax, [rsi]
		ret				; exit function

; -------------------------------------------------------------------------------
; Returns the length of a string.
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------
