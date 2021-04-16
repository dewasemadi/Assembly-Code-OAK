global main
    extern scanf, printf, fflush

section .data
    M       dd  7, 11, 10, 6
            dd  5, 8, 9, 2
            dd  1, 3, 12, 4
    n_col   dd  4
    format_in    db  "%d", 0
    format_out   db  "%d", 10, 0

section .bss
    i       resd    1
    value   resd    1

section .text
    main
        ; scanf("%d", &i);
    .read
        push    i
        push    format_in
        call    scanf
        add     esp, 2*4


        mov     ecx, 4 
        mov     eax, 4  
        mov     ebx, [i]
        mul     ebx
        mov     ebx, 0  

    .mul 
        add     ebx, dword[M+4*eax]
        add     eax, 1
        loop    main.mul

        mov     [value], ebx    ;value = jumlah baris

        ; printf("%d\n", value);
    .print
        push    dword [value]
        push    format_out
        call    printf
        push    0
        call    fflush
        add     esp, 3*4

    exit
        mov     eax, 0
        ret
