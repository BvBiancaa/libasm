section .text
global ft_strlen

ft_strlen:
    xor rax, rax    ;
.while:
    cmp byte [rdi + rax], 0 ;
    je .done ;
    inc rax ;
    jmp .while   ;
.done:
    ret ;