global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
section .text

ft_strdup:
    mov rsi, rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc
    mov rsi, rdi
    mov rdi, [rsp + 8]
    call ft_strcpy
    ret
