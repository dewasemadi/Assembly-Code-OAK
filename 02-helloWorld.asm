global main
extern printf, fflush

section .data
msg db "Hello world!", 10,0

section .text
main:

; printf(msg)
push msg
call printf
add esp, 4

; fflush(NULL)
push 0
call fflush
add esp, 4

; return 0
mov eax, 0
ret