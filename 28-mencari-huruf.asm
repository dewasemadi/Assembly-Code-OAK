global main
extern scanf, printf, fflush

section .data
    fmtin       db      "%s", 0
    fmtout      db      "%d", 10, 0
    non         db      "tidak ada", 10, 0

section .bss
    string      resb    52
    huruf       resb    2

section .text
    main:
                push    string  
                push    fmtin
                call    scanf
                add     esp, 8

                push    huruf
                push    fmtin
                call    scanf
                add     esp, 8

                cld
                mov     al, [huruf]
                mov     edi, string
                mov     ecx, 52 
                repne   scasb

                sub     edi, string

                cmp     edi, 52
                je      takada

                push    edi
                push    fmtout
                call    printf
                add     esp, 8
                jmp     exit

    takada:
                push    non
                call    printf
                add     esp, 4            

    exit:
                push    0
                call    fflush
                add     esp, 4

                mov     eax, 0
                ret

                