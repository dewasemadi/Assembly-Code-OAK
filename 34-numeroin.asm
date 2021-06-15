extern scanf, printf, fflush

section .data
	baca	db	"%s", 0
	tulisc1	db	"%c", 0
	tulisc2 db	"%c", 10, 0
	tulisd	db	"%d", 0

section .bss
	string	resb	51

section .text
	global main

main:
	push	string
	push	baca
	call	scanf
	add		esp, 8

	cld
	mov		al, 0			; cari panjang kata
	mov		edi, string
	mov		ecx, 50
	repne	scasb

	sub		edi, string		; minus 2(depan,belakang)
	add     edi, -3

	push	dword[string]
	push	tulisc1
	call	printf
	add		esp, 8

	push	edi
	push	tulisd
	call	printf
	add		esp, 8
	
	add     edi, 1

	push	dword[string+edi]
	push	tulisc2
	call	printf
	add		esp, 8
	jmp		exit

exit:
	push		0
	call		fflush

	mov			eax, 1
	mov			ebx, 0
	int			0x80