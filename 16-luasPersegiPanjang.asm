global main
    extern scanf, printf, fflush
    
segment .data
    format_in       db      "%d %d", 0
    format_out      db      "%d", 10, 0
    
segment .bss
    p       resd    1
    l       resd    1
    ans     resd    1
    
segment .text
    main:
        ; scanf("%d %d", &p, &l);
        push    l
        push    p
        push    format_in
        call    scanf
        add     esp, 3*4
        
        ; ans = p*l
        mov     al, [p]
        mov     bl, [l]
        mul     bl
        mov     [ans], ax
        
        ; printf("%d\n", ans);
        push    dword [ans]
        push    format_out
        call    printf
        add     esp, 2*4
        
        ; return 0
        mov     eax, 0
        ret