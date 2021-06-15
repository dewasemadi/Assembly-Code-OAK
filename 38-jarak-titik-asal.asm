global main
extern scanf, printf, fflush
      
section .data
    fmt_in db "%f %f", 0
    fmt_out db "%f", 10, 0
          
section .bss
    a resd 1
    b resd 1
    hasil1 resd 1
    hasil2 resd 1
    hasil3 resd 1
     
section .text
main
    push b
    push a
    push fmt_in
    call scanf
     
    fld dword[a]
    fld dword[a]
    fmulp
    fstp dword[hasil2]
     
    fld dword[b]
    fld dword[b]
    fmulp
    fstp dword[hasil3]
     
    fld dword[hasil2]
    fld dword[hasil3]
    faddp
     
    fsqrt
    fstp qword[hasil1]
     
    push dword[hasil1+4]
    push dword[hasil1]
    push fmt_out
    call printf
     
exit
    push 0
    call fflush

    mov eax, 1
    mov ebx, 0
    int 0x80