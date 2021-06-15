global main
    extern scanf, printf, fflush
     
section .data
    fmt_in	db "%f %f", 0
    fmt_out	db "%f", 10, 0
         
section .bss
    a resd 4
    b resd 4

section .text
main:


exit: 
    push    0
    call    fflush
    add     esp, 4
    mov     eax, 0
    ret