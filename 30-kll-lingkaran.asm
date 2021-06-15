global main
    extern scanf, printf, fflush

section .data
    fmt_in      db  "%f", 0
    fmt_out     db  "%f", 10, 0

section .bss
    d   resd    1
    kll resq    1

section .text
main:
    push    d
    push    fmt_in
    call    scanf
    add     esp, 2*4

    fldpi       ; kll = pi*d
    fmul    dword [d]
    fst     qword [kll]

    push    dword [kll+4]
    push    dword [kll]
    push    fmt_out
    call    printf
    add     esp, 3*4

exit: 
    push    0
    call    fflush
    add     esp, 4
    mov     eax, 0
    ret
 