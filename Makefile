boot_sect_simple.elf: boot_sect_simple.asm
	nasm -f elf -F dwarf -g $< -o $@

boot_sect_simple.bin: boot_sect_simple.elf
	objcopy -O binary --only-section=.text $< $@

test: boot_sect_simple.bin
	qemu-system-x86_64 -drive format=raw,file=$<

test-debug: boot_sect_simple.bin
	qemu-system-x86_64 -S -s -drive format=raw,file=$<

gdb:
	gdb -x gdb_commands.txt

clean:
	rm boot_sect_simple.elf
	rm boot_sect_simple.bin
