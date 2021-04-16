global main
    extern scanf, printf, fflush

section .data
    M       dd  7, 11, 10, 6
            dd  5, 8, 9, 12
            dd  11, 13, 12, 15
    n_col   dd  4
    format_in    db  "%d", 0
    format_out   db  "%d ", 0
    format_out_newline  db  "%d", 10, 0

section .bss
    n       resd    1
    value   resd    1

section .text
    main
        ; scanf("%d", &n);
    .read
        push    n
        push    format_in
        call    scanf
        add     esp, 2*4


        mov     ebx, [n]
        mov     eax, [M]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp , 2*4

        mov     eax, [M+4]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        mov     eax, [M+8]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        mov     eax, [M+12]
        mul     ebx
        push    eax
        push    format_out_newline
        call    printf
        add     esp, 2*4



        mov     eax, [M+16]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4
        
        mov     eax, [M+20]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        mov     eax, [M+24]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        mov     eax, [M+28]
        mul     ebx
        push    eax
        push    format_out_newline
        call    printf
        add     esp, 2*4




        
        mov     eax, [M+32]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        mov     eax, [M+36]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        mov     eax, [M+40]
        mul     ebx
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4


        mov     eax, [M+44]
        mul     ebx
        push    eax
        push    format_out_newline
        call    printf
        add     esp, 2*4


   
        push    0
        call    fflush
        add     esp, 4

    exit
        mov     ebx, 0
        mov     eax, 0
        ret
