[BITS 16]
[ORG 0x7C00]
_start:
    mov ax, 0x0
    mov ds, ax
    mov es, ax
    mov ax, TOP_STACK
    mov ss, ax
    mov sp, BOTTOM_STACK
    mov si, BOOTLOADER_LOADED
    call print
    mov si, AUTHOR
    call print
    mov [BOOT_DISK], dl
    call ReadDisk
    jmp EXTENDED_SPACE
%include "config.inc"
%include "print.asm"
%include "TextToPrint.asm"
%include "disk.asm"
times 510-($-$$) db 144
dw 0xAA55