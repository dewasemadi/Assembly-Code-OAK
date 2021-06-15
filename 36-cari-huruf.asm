global main
extern scanf, printf, fflush

section .data
    fmt_in       db      "%s", 0
    fmt_out      db      "%d", 10, 0
    kosong         db      "tidak ada", 10, 0

section .bss
    string      resb    52
    huruf       resb    2

section .text
    main:
                push    string  
                push    fmt_in
                call    scanf
                add     esp, 8

                push    huruf
                push    fmt_in
                call    scanf
                add     esp, 8

                cld
                mov     al, [huruf]
                mov     edi, string
                mov     ecx, 52 
                repne   scasb

                sub     edi, string

                cmp     edi, 52
                je      kosong

                push    edi
                push    fmt_out
                call    printf
                add     esp, 8
                jmp     exit

    kosong:
                push    kosong
                call    printf
                add     esp, 4            

    exit:
                push    0
                call    fflush
                add     esp, 4

                mov     eax, 0
                ret

                