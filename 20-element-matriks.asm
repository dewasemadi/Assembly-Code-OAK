global main
    extern scanf, printf, fflush

section .data
    M       dd  7, 11, 10, 6
            dd  5, 8, 9, 2
            dd  1, 3, 12, 4
    n_col   dd  4
    format_in    db  "%d %d", 0
    format_out   db  "%d", 10, 0

section .bss
    i       resd    1
    j       resd    1
    value   resd    1

section .text
    main
    ; scanf("%d %d", &i, &j);
    .read
        push    j
        push    i
        push    format_in
        call    scanf
        add     esp, 3*4

        ; val = M[i][j] --> M[i*n_col+j]  ex: M[1][1] --> M[5]
        mov     eax, [i]
        mul     dword [n_col]
        add     eax, [j]
        mov     ebx, [M+eax*4]
        mov     [value], ebx    ;ebx = M[eax]

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
