bits 64

section .text
	global ft_strcmp
	ft_strcmp:
		repe	cmpsb		; compare and inc until [rdi] = [rsi]
		je	exit
		;jne	mismatch	; exit if rdi = rsi
		;ret
	mismatch:
		dec	rsi		
		dec	rdi
	exit:
		mov	rax, 0
		mov	rax, [rdi]
		sub	rax, [rsi]
		ret				; exit function

; -------------------------------------------------------------------------------
; Returns the length of a string.
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------
