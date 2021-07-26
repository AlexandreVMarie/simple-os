; Infinite loop (e9 fd ff)
memory_load_address equ 0x7c00

loop:
    mov ebx, hello_world_msg + memory_load_address
    call print_msg
    jmp loop

hello_world_msg:
    db 'Hello world!', 0xa, 0xd, 0x0

print_msg:
    mov ah, 0x0e
    mov ecx, 0
print_msg_loop:
    mov al, [ebx + ecx]
    cmp al, 0
    je print_msg_end

    int 0x10

    inc ecx
    jmp print_msg_loop

print_msg_end:
    ret

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; Magic number
dw 0xaa55 
