nasm -f elf64 multiboot_header.asm
nasm -f elf64 boot.asm
ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o

grub-mkrescue -o os.iso iso

