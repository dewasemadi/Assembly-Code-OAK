global main
extern scanf, printf, fflush
       
section .data
    fmt_in db "%f", 0
    fmt_in2 db "%d", 0
    fmt_out db "%.1f", 10, 0
    tampung dq 0.0       
           
section .bss
	n resd 4
	a resd 4
	hasil resd 4
      
section .text
           
main
	push n
    push fmt_in2
    call scanf
    
    mov edi, [n]
	fld qword[tampung]
	
.loop
	push a
	push fmt_in
	call scanf
	add esp, 8
	
	fadd dword[a]
	
	sub edi, 1
	cmp edi, 0
	jne .loop


	fidiv dword[n]
	fst qword[hasil]
	
	push dword[hasil+4]
	push dword[hasil]
	push fmt_out
	call printf

exit
    push 0
    call fflush

    mov eax, 1
    mov ebx, 0
    int 0x80