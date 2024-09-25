section .data
	msg1 db 'Enter the string:',0xa
	len1 equ $ - msg1
	msg2 db 'Enter the character:',0xa
	len2 equ $ - msg2
	msg3 db 'Character count:'
	len3 equ $ - msg3
	
section .bss
	str1 resb 100
	chr resb 1
	count resb 10
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov cx,msg1
	mov edx,len1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov ecx,len2
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,chr
	mov edx,1
	int 0x80
	
	mov byte[str1+eax-1],0
	
	mov esi,[str1]
	mov bl,[chr]
	xor ecx,ecx
	
	count_loop:
		mov al,[esi]
		cmp al,0
		je done
		cmp al,bl
		jne next_char
		inc ecx
		
	next_char:
		inc esi
		jmp count_loop
		
	done:
		mov [count],ecx
		
		mov eax,4
		mov ebx,1
		mov ecx,msg3
		mov edx,len3
		int 0x80
		
		mov eax, [count]
    add eax, '0'    ; Convert to ASCII
    mov [count], al 
    
		mov eax,4
		mov ebx,1
		mov ecx,count
		mov edx,10
		int 0x80
		
		mov eax,1
		xor ebx,ebx
		int 0x80
