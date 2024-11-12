section .data
    msg db "enter:"
    msgp db "pal",0xa
    msgnp db "n_pal",0xa
    
section .bss
    str1 resb 100
    str2 resb 100
    
section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,6
    int 0x80
    
    mov eax,3
    mov ebx,0
    mov ecx,str1
    mov edx,100
    int 0x80
    
    mov byte[str1+eax-1],0
    
    mov esi,str1
    mov edi,str1
    xor ecx,ecx
    mov ecx,eax
    dec ecx
    add edi,ecx
    dec edi
    
loop1:
    mov al,[esi]
    mov bl,[edi]
    test al,al
    jz pali
    cmp al,bl
    jne check
    inc esi
    dec edi
    jmp loop1
    
check:
    cmp bl,'a'
    jb upper
    cmp bl,'z'
    ja upper
    sub bl,32
    jmp stch
    
upper:
    cmp bl,'A'
    jb stch
    cmp bl,'Z'
    ja stch
    add bl,32
    
stch:
    cmp al,bl
    jne n_p
    inc esi
    dec edi
    jmp loop1
    
    
n_p:
    mov eax,4
    mov ebx,1
    mov ecx,msgnp
    mov edx,6
    int 0x80
    jmp exit
    
pali:
    mov eax,4
    mov ebx,1
    mov ecx,msgp
    mov edx,4
    int 0x80
    jmp exit
    
exit:
    mov eax,1
    int 0x80
    
    
    
    
    
    
    
