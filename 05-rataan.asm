global main
    extern scanf, printf, fflush

segment .data
    format_in  db "%d %d %d %d", 0
    format_out db "%d", 10, 0

segment .bss
    a       resd    1
    b       resd    1
    c       resd    1
    d       resd    1
    ans     resd    1
    
segment .text
    main:
        ; scanf("%d %d %d %d", &a, &b, &c, &d);
        push    d
        push    c
        push    b
        push    a
        push    format_in
        call    scanf  
        add     esp, 5*4
        
        ; ans = a+b+c+d
        mov     eax, [a]
        add     eax, [b]
        add     eax, [c]
        add     eax, [d]
        
        ; ans = ans/4
        mov     edx, 0
        mov     ecx, 4h
        div     ecx
        mov     [ans], eax
        
        ; printf("%d\n", c);
        push    dword [ans]
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
        
        