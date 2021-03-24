global main
    extern scanf, printf, fflush

section .data
    i            dd  0
    format_in    db  "%d", 0 
    format_out   db  "%d", 10, 0

section .bss
    n       resd    1

section .text
    main:
        ;    scanf("%d", &n);
        push    n
        push    format_in
        call    scanf
        add     esp, 2*4

        mov     ebx, [n]
        mov     dword[i], 0
        mov     eax, 0

    tambah:
        add     eax,[i]
        inc     dword[i]
        inc     dword[i]
        inc     dword[i]
        cmp     dword[i], ebx
        jle     tambah
    
        ; printf("%d\n", eax);
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        ; return 0
        mov     eax, 0
        ret