extern __errno_location
section .text
    global ft_write

ft_write:
    mov rax, 1  ; syscall number for write
    syscall ; do the syscall
    cmp rax, 0  ; compare rax (ret of syscall) with 0
    jl .error   ; if less (negative number), handle error
    ret ;return

.error:
    neg rax    ; absolute value of error code
    mov rdi, rax ; move error code to rdi
    call __errno_location wrt ..plt  ; get pointer to errno
    mov [rax], rdi  ; store error code in errno
    mov rax, -1 ; move -1 in rax (ret value)
    ret
