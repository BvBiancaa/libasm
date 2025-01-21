global ft_read
section .text

ft_read:
    ; rdi = file descriptor
    ; rsi = buffer
    ; rdx = size
    mov rax, 0
    syscall
    ret
