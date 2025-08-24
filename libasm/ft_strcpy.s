section .text
    global ft_strcpy

ft_strcpy:
    mov rax, rdi ; save destination pointer
.loop:
    mov bl, byte [rsi] ; load byte from first string
    mov byte [rdi], bl ; copy byte to second string
    inc rdi ; increment second string pointer
    inc rsi ; increment first string pointer
    test bl, bl ; check if the byte already copied is \0
    jnz .loop ; if not, continue copying
    ret