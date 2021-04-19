global main
    extern scanf, printf, fflush

section .data
    i            dd   0
    format_in    db  "%d", 0
    format_out   db  "%d", 10, 0

section .bss
    n       resd    1

section .text
    main
        ; scanf("%d", &n);
        push    n
        push    format_in
        call    scanf
        add     esp, 2*4

        mov     ecx, [n]
        mov     ebx, [n]

        cmp     ebx, 0   ; if(n==0) jmp exit
        je      exit

        mov     eax, 1       ;eax = pangkat(n) 
        call    pangkat 
 
        ; printf("%d", eax);
        push    eax
        push    format_out
        call    printf
        add     esp, 2*4

        cmp     ebx, 0
        jne     main
   
        jmp     exit

    pangkat   ; eax = pangkat(eax)
        mov     edx, 2
        imul    edx
        loop    pangkat

        ret

    exit
        push    0
        call    fflush
        add     esp, 4
        mov     ebx, 0
        mov     eax, 0
        ret
