global main
    extern scanf, printf, fflush

section .data
    fmt_in      db  "%f %f", 0
    fmt_out     db  "%.4f", 10, 0 
    pembagi     db  3

section .bss
    r   resd    1
    t   resd    1
    vol resq    1

section .text
main:
    ; scanf("%f %f", &r, &t)
    push    t
    push    r
    push    fmt_in
    call    scanf
    add     esp, 3*4

    ; 1/3*phi*r*r*t
    finit
    fldpi
    fmul    dword [r]
    fmul    dword [r]
    fmul    dword [t]
    fidiv	dword [pembagi]
    fst     qword [vol]

    push    dword [vol+4]
    push    dword [vol]
    push    fmt_out
    call    printf
    add     esp, 3*4

exit: 
    push    0
    call    fflush
    add     esp, 4
    mov     eax, 1
    mov     ebx, 0
    int		0x80
 