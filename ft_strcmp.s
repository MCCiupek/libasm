bits 64

section .text
	global ft_strcmp
	ft_strcmp:
		xor	rcx, rcx		; init counter (i = 0)
		xor	rax, rax		; init return value
	loop:
		cmp	BYTE [rdi + rcx], 0	; check s1[i]
		jz	exit			; exit if NULL
		cmp	BYTE [rsi + rcx], 0	; check s2[i]
		jz	exit			; exit if NULL
		mov	al, BYTE [rsi + rcx]	; al <- s1[i]
		cmp	BYTE [rdi + rcx], al	; compare al and s2[i]
		jnz	exit			; exit loop if DF != 0
		inc	rcx			; i++
		jmp	loop
	exit:
		movzx	rax, BYTE [rdi + rcx]	; rax <- s1[i]
		movzx	rdx, BYTE [rsi + rcx]	; rdx <- s2[i]
		sub	rax, rdx		; return value <- s1[i] - s2[i]
		ret				; exit function

; -------------------------------------------------------------------------------
; int strcmp(const char *s1, const char *s2);
;
; Compares 2 strings s1 and s2.
;
; Runs on 64-bit Linux only.
; -------------------------------------------------------------------------------
