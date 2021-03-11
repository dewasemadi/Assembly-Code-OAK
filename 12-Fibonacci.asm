global main
    extern scanf, printf, fflush

section .data
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

        mov     ebp, 0
        mov     edx, 1
        mov     ebx, edx
        mov     ecx, [n]
        mov     eax, 0
        mov     ebx, 1

    fib:
        mov     eax, edx
        mov     ebp, eax
        mov     edx, ebx
        add     ebx, ebp
        loop    fib

        ; printf("%d\n", eax);
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        ; return 0
        mov     eax, 0
        ret
