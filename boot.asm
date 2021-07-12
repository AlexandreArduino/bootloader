[BITS 16]
[ORG 0x7C00]
%include "segments.asm"
start:
    mov ax, 0x0
    mov ds, ax
    mov es, ax
    mov ax, TOP_STACK
    mov ss, ax
    mov sp, BOTTOM_STACK
    mov si, BootloaderLoaded
    call print
    mov [BOOT_DISK], dl
    call ReadDisk
    jmp 0x7E00
%include "disk.asm"
%include "print.asm"
BootloaderLoaded: db "Bootloader loaded!", 13, 10, 0
times 510-($-$$) db 0
dw 0xAA55