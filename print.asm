print:
    push ax
    push bx
.start:
    lodsb
    cmp al, 0
    jz .end
    mov ah, 0x0E
    int 0x10
    jmp .start
.end:
    pop bx
    pop ax
    ret