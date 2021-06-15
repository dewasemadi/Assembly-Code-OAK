global main
    extern scanf, printf, fflush

section .data
    fmt_in	db "%s", 0
    fmt_out	db "%d", 10, 0
         
section .bss
    string  resb    21
        
section .text
main
	push    string
    push    fmt_in
    call    scanf
    add     esp, 2*4

    cld
    mov     al, 0
    mov     edi, string
    mov     ecx, -1
    repne   scasb

    sub     edi, string
    dec     edi

    push    edi
    push    fmt_out
    call    printf
    add     esp, 2*4

exit:
    push    0
    call    fflush
    add     esp, 4
    mov     eax, 0
    ret