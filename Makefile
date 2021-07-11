ASMCOMPILER = nasm
ASMFLAGS = -f bin
ASMCOMMANDLINE = $(ASMCOMPILER) $(ASMFLAGS)
all: init bootloader boot
init:
	rm -Rf output/
	mkdir output/
bootloader:
	$(ASMCOMMANDLINE) boot.asm -o output/boot
	$(ASMCOMMANDLINE) ExtendedSpace.asm -o output/space
	$(ASMCOMMANDLINE) kernel.asm -o output/kernel
	cat output/boot output/space output/kernel | dd of=output/bootloader bs=512 count=2880
boot:
	qemu-system-x86_64 output/bootloader