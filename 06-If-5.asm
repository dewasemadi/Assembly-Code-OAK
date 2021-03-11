global main
    extern scanf, printf

segment .data
    format_in   db  "%d %d %d", 0
    format_out  db  "%d", 10, 0
    out1        db  "3", 10, 0
    out2        db  "1", 10, 0

segment .bss
    a   resd    1
    b   resd    1
    c   resd    1
    x   resd    1

segment .text
    main:

    ; scanf("%d %d %d", &a, &b, &c);
    push    c
    push    b
    push    a
    push    format_in
    call    scanf
    add     esp, 4*4

    mov     edx, 0
    mov     eax, [a]
    add     ebx, [b]
    add     ecx, [c]

    ;     if (a > b) && (a > c)
    ;     x = 3;
    ; else
    ;     x = 1;

    cmp     eax, ebx
    cmp     eax, ecx
    jg      print_three
    jmp     print_one

print_three: 
    push    out1
    jmp     print
   
print_one: 
    push    out2

print:
    call    printf
    add     esp, 4

    mov     eax, 0
    ret



