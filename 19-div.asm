global main
        extern printf, fflush

section .data
    n            dd  50
    x            dd  6
    format_out   db  "%d", 10, 0

segment .text
    main:
        mov eax, [n]      ; eax = 50
        mov ebx, 0       ; untuk hasil bagi
    cek:    
        cmp eax, [x]      ; cek eax dengan 6
        jge krg         ; kalo >= maka kurangi nilai eax dengan 6
        jmp sisa        ; selainnya maka nilai eax masuk ke ecx
    krg:    
        sub eax, [x]    ; eax - 6
        inc ebx         ; ebx++
        jmp cek         
    sisa:   
        mov ecx, eax    ; ecx = eax, sisa dari eax

        push ebx
        push format_out
        call printf
        add esp, 2*4
 
        ; return 0
        mov     eax, 0
        ret





; int n = 50, count = 0;
; for (int i = 0; i < n; i++)
; {
;     if (n < 6)
;         break;
;     n = n - 6;
;     count++;
; }