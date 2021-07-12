[BITS 16]
%include "segments.asm"
[ORG PROGRAM_SPACE]

ExtendedSpace:
    mov si, NewSpace
    call print
    jmp ProtectedMode
%include "print.asm"
%include "gdt.asm"
ProtectedMode:
    mov si, LoadingProtectedMode
    call print
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov eax, cr0
    jmp codeseg:StartProtectedMode
EnableA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret
NewSpace: db "New space loaded!", 13, 10, 0
LoadingProtectedMode: db "Loading protected mode...", 13, 10, 0
[BITS 32]
StartProtectedMode:
    mov ax, dataseg
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ebp, 0x90000
    mov esp, ebp
    jmp $
[BITS 16]
times 2048-($-$$) db 0