global ft_read
section .text
extern __errno_location

ft_read:
    ; rdi = file descriptor
    ; rsi = buffer
    ; rdx = size
    mov rax, 0 ; syscall number for read
    syscall ; do the syscall
    cmp rax, 0  ;compare rax (return value of syscall) with 0
    jl .error  ; if less than 0, handle error
    ret

.error:
    neg rax ;absolute value of the error code
    mov rdi, rax ; move error code to rdi
    call __errno_location wrt ..plt ; get pointer to errno
    mov [rax], rdi ; store error code in errno
    mov rax, -1 ; move -1 in rax (return value)
    ret