section .text
    global ft_strdup
    extern malloc
    extern __errno_location
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    push rdi ; save string pointer
    call ft_strlen ; get length of string
    inc rax ; add 1 to len for null terminator
    mov rdi, rax ; size for malloc
    call malloc wrt ..plt   ; call malloc
    test rax, rax   ; check if rax is 0
    jz .error   ; jump to error if 0 (malloc code failed)
    pop rsi ; get original string pointer
    mov rdi, rax ; set destination pointer to malloc'd memory
    call ft_strcpy  ; copy string
    ret

.error:
    pop rdi ; restore string pointer (usless but needed for stack cleanup)
    mov rdi, 12 ; ENOMEM error code (Cannot allocate memory), standard error code
    call __errno_location wrt ..plt ; get pointer to errno
    mov [rax], rdi  ; store error code in errno
    xor rax, rax ; return NULL
    ret