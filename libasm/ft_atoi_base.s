section .text
    global ft_atoi_base

ft_atoi_base:
    xor rax, rax    ; clear rax
    xor rdx, rdx    ; clear rdx
    xor rcx, rcx    ; clear rcx
    xor rbx, rbx    ; clear rbx
    mov rbx, 1      ; set rbx to 1 -> used to keep track of sign
.check_base:
    cmp rsi, 16 ; compare rsi (register where base is stored) to 16
    jg .errorreturn ; if base > 16, return error
    cmp rsi, 2  ; compare rsi to 2
    jl .errorreturn ; if base < 2, return error
.trim:
    ; is this in the subject??
    mov dl, byte [rdi + rcx]    ; get first byte from rdi (where number string is stored)
    cmp dl, 0   ; compare dl to 0
    je  .check_sign ; if equal, go to .errorreturn -> string was empty
    cmp dl, 32  ; compare dl to space
    je  .skip_char  ; if equal, skip to next char
    cmp dl, 9   ; compare dl to tab
    je  .skip_char  ; if equal skip to next char
    jmp .check_sign ; end of trim, jump to .check_sign
.skip_char:
    inc rcx ; rcx ++
    jmp .trim   ; go back to trim
.check_sign:
    mov dl, byte [rdi + rcx]    ; get first sign if there's one
    cmp dl, 0   ;cmp dl to 0
    je  .parse  ; if end of string is reached jump to .errorreturn
    cmp dl, '-' ; compare dl to -
    jne .check_str  ; if not equal jump to .check_str
    neg rbx ; rbx * -1 
    inc rcx ; rcx ++
.check_str:
    mov dl, byte [rdi + rcx]    ;get rdi + rcx, at this point no - or white spaces are allowed
    cmp dl, 0   ; cmp dl to 0
    je  .parse  ; if end of string finish parsing in .parse
    inc rcx ; rcx ++
    cmp dl, '0' ; compare dl to 48 in ascii
    jl  .errorreturn ; if less jump to .errorreturn
    cmp dl, '9' ; compare dl to 57 in ascii
    jle .parse_digit    ;if less or equal (0 <= dl <= 9 )jump to .parse_digit 
    cmp dl, 'A' ;compare dl to 'A'
    jl  .errorreturn    ;if it's less than 'A' jump to .errorreturn
    cmp dl, 'F' ; compare dl to 'F'
    jle .parse_digit    ; if less or equal ('A' <= dl <= 'F') jump to .parse_digit
    cmp dl, 'a' ; compare dl to 'a'
    jl  .errorreturn ; if less go to .errorreturn
    cmp dl, 'f' ; compare dl to 'f'
    jle .parse_digit    ;if less or equal ('a' <= dl <= 'f') jump to .parse_digit
    jmp .errorreturn    ;if dl is equal other character jump to .errorreturn (OR SHOULD I RETURN NUMBER)?
.parse_digit:
    sub dl, '0' ; dl - 48
    cmp dl, 9   ; compare dl to 9
    jg  .convert_letter ; if greater dl was a letter, jump to .convert_letter
    jmp .convert_done   ; else jump to .convert_done
.convert_letter:
    sub dl, 32  ; a/A - f/F -> 0-5
    sub dl, 10                    ; Now 'A'/'a' -> 10, 'B'/'b' -> 11, etc.
.convert_done:
    imul rax, rsi   ; multiply rax by base (stored in rsi)
    add rax, rdx    ; add the current digit value to the result
    jmp .check_str  ; continue (jump to .check_str again)
.parse:
    imul rax, rbx   ; multiply rax by rbx so the sign
    ret
.errorreturn:
    mov rax, 0  ;ERROR RETURN IS 0???
    ret
