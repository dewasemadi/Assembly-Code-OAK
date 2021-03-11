section .data
    source db 'Hello x86', 0xa
    length equ $ - source


section .text
    global main
    
main:
    mov edx, length
    mov ecx, source
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov eax, 1
    mov ebx, 0 
    int 0x80
