bits 16

memory_load_address equ 0x7c00
stack_base_address equ 0x8000

loop:
    mov sp, stack_base_address
    mov bp, sp
    push memory_load_address + hello_world_msg
    call print_msg
    jmp loop_forever

loop_forever:
    jmp loop_forever

hello_world_msg:
    db 'Hello world!', 0xa, 0xd, 0x0

print_msg:
    mov bp, sp
    mov bx, [bp + 2]
    mov ah, 0x0e
    mov ecx, 0

print_msg_loop:
    mov si, cx
    mov al, [bx + si]
    cmp al, 0
    je print_msg_end

    int 0x10

    inc cx
    jmp print_msg_loop

print_msg_end:
    ret

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; Magic number
dw 0xaa55 
