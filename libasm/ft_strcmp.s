section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax    ; clear rax
.while:
    mov al, [rdi]   ; load byte from first string
    mov bl, [rsi]   ; load byte from second string
    cmp al, bl  ; compare bytes
    jne .done   ; if not equal, jump to done
    test al, bl ; check if both are null terminators
    je .done    ; if either of them is null, jump to done
    inc rdi ; increment first string pointer
    inc rsi ; increment second string pointer
    jmp .while  ; go back to the start of the loop
.done:
    cmp al, bl  ; compare the last bytes again
    jge .submagg ; if al >= bl, jump to submagg
    jle .submin ; if al <= bl, jump to submin
.submagg:
    sub al, bl  ; subtract second byte from first
    ret
.submin:
    sub al, bl ; subtract first byte from second
    movsx eax, al; move al (8bit) to eax (32bit) to make it signed
    ret