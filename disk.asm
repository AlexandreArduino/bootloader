ReadDisk:
    mov si, ReadingDisk
    call print
    mov ah, 0x02
    mov bx, EXTENDED_SPACE ;Where the datas will be stored
    mov al, DISK_SECTORS
    mov dl, [BOOT_DISK]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02
    int 0x13
    jc DiskReadFailed
    ret
BOOT_DISK:
    db 0
DiskReadFailed:
    mov si, ErrorWhileReadingDisk
    call print
    ret