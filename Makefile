bootloader:
	nasm -f bin -o output/boot boot.asm
	nasm -f bin -o output/space space.asm
	cat output/boot output/space| dd of=output/bootloader bs=512 count=2880
	qemu-system-x86_64 output/bootloader