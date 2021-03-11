global main
    extern scanf, printf, fflush

segment .data
    format_in  db   "%d %d %d %d", 0
    format_out db   "%d", 10, 0
    mutu_a      db   "A", 10, 0
    mutu_b      db   "B", 10,0
    mutu_c      db   "C", 10,0
    mutu_d      db   "D", 10,0
    mutu_e      db   "E", 10,0

segment .bss
    a       resd    1
    b       resd    1
    c       resd    1
    d       resd    1
    
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
        
        ; eax = a+b+c+d
        mov     eax, [a]
        add     eax, [b]
        add     eax, [c]
        add     eax, [d]
        
        ; eax = eax/4
        mov     edx, 0
        mov     ecx, 4h
        div     ecx
        
        cmp     eax, 80
        jge     print_a
        cmp     eax, 60
        jge     print_b
        cmp     eax, 50
        jge     print_c
        cmp     eax, 40
        jge     print_d
        cmp     eax, 39
        jle     print_e

    print_a:
        push    mutu_a
        jmp     print
    
    print_b:
        push    mutu_b
        jmp     print
    
    print_c:
        push    mutu_c
        jmp     print
    
    print_d:
        push    mutu_d
        jmp     print
    
    print_e:
        push    mutu_e
    
    print:  
        call    printf
        add     esp, 4
        mov     eax, 0
        ret