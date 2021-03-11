bits 64

section .text
	global ft_strcmp
	ft_strcmp:
		xor	rax, rax	; rax = 0
		repe	cmpsb		; compare and inc until [rdi] = [rsi]
		je	exit		; exit if rdi = rsi
		dec	rsi		
		dec	rdi
	exit:
		mov	rax, [rdi]
		sub	rax, [rsi]
	;exit:	
		ret				; exit function

; -------------------------------------------------------------------------------
; Returns the length of a string.
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------
