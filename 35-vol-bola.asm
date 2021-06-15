global main
    extern scanf, printf, fflush

section .data
    fmt_in      db  "%f", 0
    fmt_out     db  "%.4f", 10, 0 
    pengali     dq  4
    pembagi     dq  3

section .bss
    r   resq    1
    vol resq    1

section .text
main:
    ; scanf("%f", &r)
    push    r
    push    fmt_in
    call    scanf
    add     esp, 2*4

    ; 4/3*phi*r*r*r
    fldpi
    fmul    dword [r]
    fmul    dword [r]
    fmul    dword [r]

    fild    dword [pengali]
    fidiv	dword [pembagi]
    fmul
    
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
    mov     eax, 0
    ret
 