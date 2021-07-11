[BITS 16]
[EXTERN kernel]
[ORG 0x7E00]
ExtendedSpace:
    mov si, StartProtectedMode
    call print
    mov si, LoadingGDT
    call print
    mov ax, gdtend
    mov bx, gdt
    sub ax, bx
    mov word [gdtptr], ax
    xor eax, eax
    xor ebx, ebx
    mov ax, ds
    mov ecx, eax
    shl ecx, 4
    mov bx, gdt
    add ecx, ebx
    mov dword [gdtptr+2], ecx
    cli
    lgdt [gdtptr]
    or  ax, 1
    mov cr0, eax
    jmp next
next:
    mov ax, 0x10
    mov ds, ax
    mov fs, ax
    mov gs, ax
    mov es, ax
    mov ss, ax
    mov esp, 0x9F000    
    mov si, BootloaderFinished
    call print
    ; jmp dword 0x8:0
%include "config.inc"
%include "TextToPrint.asm"
%include "print.asm"
%include "gdt.asm"

times 2048-($-$$) db 144