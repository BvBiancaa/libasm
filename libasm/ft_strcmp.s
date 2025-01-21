section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax    ;
.while:
    mov al, [rdi]   ;
    mov bl, [rsi]   ;
    cmp al, bl  ;
    jne .done   ;
    test al, bl ;
    je .done    ;
    inc rdi ;
    inc rsi ;
    jmp .while  ;
.done:
    cmp al, bl  ;
    jge .submagg ;    
    jle .submin ;
.submagg:
    sub al, bl  ;
    ret
.submin:
    sub al, bl ;
    movsx eax, al; 
    ret