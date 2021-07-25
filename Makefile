boot_sect_simple.bin: boot_sect_simple.asm
	nasm -f bin $^ -o $@

test: boot_sect_simple.bin
	qemu-system-x86_64 -drive format=raw,file=$<




