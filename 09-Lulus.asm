global main
    extern scanf, printf, fflush

segment .data
    format_in  db   "%d %d %d %d", 0
    format_out db   "%d", 10, 0
    lulus      db   "lulus", 10, 0
    tidak      db   "tidak", 10,0

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
        
        cmp     eax, 40
        jge     print_lulus
        jl      print_tidak

    print_lulus:
        push    lulus
        jmp     print
    
    print_tidak:
        push    tidak
    
    print:  
        call    printf
        add     esp, 4
        mov     eax, 0
        ret