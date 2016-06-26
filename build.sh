# nasm -f elf64 multiboot_header.asm
# nasm -f elf64 boot.asm
# ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o

mkdir -p obj/iso/boot/grub
cp bin/kernel.bin obj/iso/boot/kernel.bin
cp src/grub.cfg obj/iso/boot/grub
grub-mkrescue -o bin/os.iso obj/iso 2> /dev/null
rm -r obj/iso