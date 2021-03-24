global main
    extern scanf, printf, fflush
    
segment .data
    format   db     "%d", 0
    dingin   db     "dingin", 10, 0
    hangat   db     "hangat", 10, 0
    panas    db     "panas", 10, 0
    
segment .bss
    p       resd    1
    
segment .text
    main:
        ; scanf("%d", &p);
        push    p
        push    format
        call    scanf
        add     esp, 2*4
        
        mov     eax, [p]
        
        ; condition
        cmp     eax, 61
        jg      print_panas
        cmp     eax, 36
        jge     print_hangat
        cmp     eax, 36
        jl      print_dingin
        
    print_panas:
        push    panas
        jmp     print
        
    print_hangat:
        push    hangat
        jmp     print
        
    print_dingin:
        push    dingin
        jmp     print
        
    print:
        call    printf
        add     esp, 4
        ; return 0
        mov     eax, 0
        ret