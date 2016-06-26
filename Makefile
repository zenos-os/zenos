kernel := bin/kernel.bin
iso := bin/os.iso

linker_script := src/linker.ld
grub_cfg := src/grub.cfg
assembly_source_files := $(wildcard src/*.asm)
assembly_object_files := $(patsubst src/%.asm, \
	obj/%.o, $(assembly_source_files))

.PHONY: all clean run iso

all: $(kernel)

clean:
	@rm -r bin
	@rm -r obj

run: $(iso)
	@qemu-system-x86_64 -cdrom $(iso)

iso: $(iso)

$(iso): $(kernel) $(grub_cfg)
	@mkdir -p obj/iso/boot/grub
	@cp $(kernel) obj/iso/boot/kernel.bin
	@cp $(grub_cfg) obj/iso/boot/grub
	@grub-mkrescue -o $(iso) obj/iso 2> /dev/null
	@rm -r obj/iso

$(kernel): $(assembly_object_files) $(linker_script)
	@mkdir -p $(shell dirname $@)
	@ld -n -T $(linker_script) -o $(kernel) $(assembly_object_files)

# compile assembly files
obj/%.o: src/%.asm
	@mkdir -p $(shell dirname $@)
	@nasm -felf64 $< -o $@