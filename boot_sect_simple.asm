

; Infinite loop (e9 fd ff)
loop:
    mov ebx, hello_world_msg
    call print_msg

hello_world_msg:
    db 'Hello world!', 0

print_msg:
    mov ah, 0x0e
    mov ecx, 0
print_msg_loop:
    mov al, [ebx + ecx]
    cmp al, 0
    je print_msg_end

    int 0x10

    inc ecx

print_msg_end:
    ret

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; Magic number
dw 0xaa55 
