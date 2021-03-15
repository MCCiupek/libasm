bits 64

section .data
	message db	'Hello World!', 10	; 10 = new line ?
	message_length 	equ $-message

section .text
	global _start
	_start:
		mov 	rax, 1			; system call for write
		mov 	rdi, 1			; fd (1 = stdout)
		mov 	rsi, message		; address of the string to output
		mov 	rdx, message_length	; number of bytes
		syscall				; invoke operating system to write

		mov 	rax, 60			; system call for exit
		mov 	rdi, 0			; exit code 0
		syscall				; invoke operating system to exit

; -------------------------------------------------------------------------------
; Writes 'Hello World!' to the console using only system calls.
; Runs on 64-bit Linux only.
;
; To assemble and run :
; nasm -f elf64 hello_world.s && ld hello_world.o -o hello_world && ./hello_world  
; -------------------------------------------------------------------------------
