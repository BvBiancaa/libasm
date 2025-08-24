section .text
global ft_strlen

ft_strlen:
    xor rax, rax    ;clear rax
.while:
    cmp byte [rdi + rax], 0 ;check if char at rdi + rax is \0
    je .done ;jump to done if equal
    inc rax ;increment rax
    jmp .while   ;restart loop
.done:
    ret ;return rax (len of string)