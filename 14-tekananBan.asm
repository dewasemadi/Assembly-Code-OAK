global main
    extern scanf, printf, fflush
    
segment .data
    format   db     "%d", 0
    kempes   db     "kempes", 10, 0
    pas      db     "pas", 10, 0
    keras    db     "keras", 10, 0
    
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
        cmp     eax, 35
        jg      print_keras
        cmp     eax, 29
        jge     print_pas
        cmp     eax, 29
        jl      print_kempes
        
    print_keras:
        push    keras
        jmp     print
        
    print_pas:
        push    pas
        jmp     print
        
    print_kempes:
        push    kempes
        jmp     print
        
    print:
        call    printf
        add     esp, 4
        ; return 0
        mov     eax, 0
        ret