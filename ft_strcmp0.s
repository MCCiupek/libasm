bits 64

section .text
	global ft_strcmp
	extern	putchar
	ft_strcmp:
		cld
		repe	cmpsb		; compare and inc until [rdi] = [rsi]
		cmp ecx, 0
		je	exit
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
