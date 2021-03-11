section .data
    hello db "Hello ",
    helloLen equ $-hello

section .bss
    v resb 4

section .text
global main

main:
        ; read(0, v, len)
        mov ebx, 0
        mov eax, 3
        mov ecx, v
        mov edx, 4
        int 0x80
    
        mov ebx, 0x1
        mov ecx, hello
        mov edx, helloLen
        mov eax, 0x4
        int 0x80
        
        mov ebx, 0x1
        mov ecx, v
        mov edx, 4
        mov eax, 0x4
        int 0x80
    
    
        xor ebx, ebx
        mov eax, 0x1
        int 0x80

