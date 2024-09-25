section .data
	msg1 db 'Enter the first string:',0xa
	msg2 db 'Enter the second string:',0xa
	msgeq db 'Strings are equal',0xa
	msgne db 'Strings are not equal',0xa
	
section .bss
	str1 resb 100
	str2 resb 100
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,23
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,24
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str2
	mov edx,100
	int 0x80
	
	mov byte[str1+eax-1],0
	mov byte[str2+eax-1],0
	
	mov esi,str1
	mov edi,str2
	
	compare_loop:
		mov al,[esi]
		mov dl,[edi]
		cmp al,dl
		jne strings_ne
		test al,al
		jz strings_e
		inc esi
		inc edi
		jmp compare_loop
		
	strings_ne:
		mov eax,4
		mov ebx,1
		mov ecx,msgne
		mov edx,22
		int 0x80
		jmp exit
		
	strings_e:
		mov eax,4
		mov ebx,1
		mov ecx,msgeq
		mov edx,18
		int 0x80
		
	exit:
		mov eax,1
		xor ebx,ebx
		int 0x80
	
