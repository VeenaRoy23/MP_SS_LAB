section .data
    msg db "Enter: "
    pal db "Pallindrome",0xa
    n_pal db "Not pallindrome",0xa
    
section .bss
    str1 resb 100
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,7
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,str1
    mov edx,100
    int 0x80
    
    mov byte[str1+eax-1],0
    xor ecx,ecx
    mov ecx,eax
    dec ecx
    
    mov esi,str1
    mov edi,str1
    add edi,ecx
    dec edi
    
loop1:
    mov al,[esi]
    mov bl,[edi]
    cmp al,bl
    jne n_p
    inc esi
    dec edi
    test al,al
    jz done
    jmp loop1
    
n_p:
    mov eax,4
    mov ebx,1
    mov ecx,n_pal
    mov edx,16
    int 0x80
    jmp exit
    
done:  
    mov eax,4
    mov ebx,1
    mov ecx,pal
    mov edx,12
    int 0x80
    jmp exit
    
exit:
    mov eax,1
    int 0x80





