global main
    extern scanf, printf, fflush

section .data
    format_in  db "%d %d", 0
    format_out db "%d", 10, 0

section .bss
    a   resd    1
    b   resd    1
    c   resd    1
    
segment .text

    main:
        ; scanf("%d %d", &a, &b);
        push    b
        push    a
        push    format_in
        call    scanf  
        add     esp, 3*4
        
        ; c = a+b
        mov     eax, [a]
        add     eax, [b]
        mov     [c], eax
        
        ; printf("%d\n", c);
        push    dword [c]
        push    format_out
        call    printf
        add     esp, 2*4
        
        ; fflush(NULL)
        push    0
        call    fflush
        add     esp, 4
        
        ; return 0
        mov     eax, 0
        ret
        
        