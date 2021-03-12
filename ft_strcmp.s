bits 64

section .text
	global ft_strcmp
	ft_strcmp:
		mov	r10b, BYTE [rdi]	; s1
		mov	r11b, BYTE [rsi]	; s2
		cmp	r10b, 0			; if not *s1 {
		je	exit			; exit loop }
		cmp	r11b, 0			; if not *s2 {
		je	exit			; exit loop }
		cmp	r10b, r11b		; compare *s1 and *s2
		jne	exit			; if DF != 0 { exit loop }
		inc	rdi			; s1++
		inc	rsi			; s2++
		jmp	ft_strcmp		; loop
	exit:
		movzx	rax, r10b		; rax <- *s1
		movzx	rbx, r11b		; rbx <- *s2
		sub	rax, rbx		; return value <- *s1 - *s2
		ret				; exit function

; -------------------------------------------------------------------------------
; Compares 2 strrings.
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------
