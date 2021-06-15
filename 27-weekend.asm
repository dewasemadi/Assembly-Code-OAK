global main
    extern scanf, printf, fflush

section .data
    fmt_in  db  "%s", 0
    wd      db  "weekday", 10, 0
    we      db  "weekend", 10, 0
    sun     db  "Sun", 0
    sat     db  "Sat", 0

section .bss
    string   resb    10

section .text
main
    push    string
    push    fmt_in
    call    scanf

    mov     esi, string
    mov     edi, sun

    cmpsb
    je      .sama

    mov     edi, sat

    cmpsb
    je      .sama

    push    wd
    call    printf
    jmp     exit

.sama
    push    we
    call    printf
    jmp     exit

exit
    push    0
    call    fflush
    mov     eax, 1
    mov     ebx, 0
    int 0x80