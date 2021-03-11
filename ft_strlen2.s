bits 64

section .text
	global ft_strlen2
	ft_strlen2:
		xor	rcx, rcx	; rcx = 0
		dec	rcx		; rcx--
		xor	rax, rax	; rax = 0 -> al = 0
		repne	scasb		; Scan memory until al is found
		sub	rax, rcx	; rax = rax - rcx
		sub	rax, 2		; rax -= 2
		ret

; -------------------------------------------------------------------------------
; Returns the length of a string.
; Runs on 64-bit Linux only.
;
; SCASB searches memory for the byte in rax, starting at rdi. 
; While the byte is different is decreases rcx by 1 after each comparison.
; If the byte is the same it increases rcx by one.
; Hence length is 0 - rcx - 2 
; -------------------------------------------------------------------------------
