global ft_strcpy
section .text

ft_strcpy:
.loop:
    mov al, byte [rsi]
    mov byte [rdi], al
    inc rdi
    inc rsi
    test al, al
    jnz .loop
    ret
