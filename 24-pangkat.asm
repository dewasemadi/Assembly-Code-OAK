global main
    extern scanf, printf, fflush
     
section .data
    format_in	db "%d", 0
    format_out	db "%d", 10, 0
         
section .bss
    a resd 4
    b resd 4
        
section .text         
main
    
label
	push a
	push format_in
	call scanf
	mov ebx, [a]
	
	cmp ebx, 0
	je exit
	
	push b
	push format_in
	call scanf
	mov ecx, [b]
	
	mov eax, 1
	call pangkat
	
	push eax
	push format_out
	call printf
	
	jmp label
	
pangkat
	imul ebx
	loop pangkat
	ret

exit 
    push 0
    call fflush
         
    mov eax, 1
    mov ebx, 0
    int 0x80