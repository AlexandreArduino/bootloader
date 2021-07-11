BOOTLOADER_LOADED: db "Bootloader loaded!", 13, 10, 0
AUTHOR: db "This was developped by BAALBAKY Alexandre :)", 13, 10, 0
ReadingDisk: db "Reading Hard Drive Disk...", 13, 10, 0
ErrorWhileReadingDisk: db "Error while reading disk...", 13, 10, "Maybe to many sectors!", 13, 10, 0
StartExtendedSpace: db "Welcome to the extended space!", 13, 10, 0
StartProtectedMode: db "Entering protected mode...", 13, 10, 0
LoadingGDT: db "Loading Global Descriptor Table...", 13, 10, 0
BootloaderFinished: db "Bootloader is ready to load the kernel!", 13, 10, 0