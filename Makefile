CORELIB=./bin/Debug/netstandard2.0/System.Private.CoreLib.dll
TYPELOADER=./vendor/corert/bin/Linux.x64.Release/sdk/System.Private.TypeLoader.dll
RUNTIME=./vendor/corert/bin/Linux.x64.Release/framework/System.Runtime.dll
ILC=./vendor/corert/bin/Linux.x64.Release/tools/ilc
DOTNET=dotnet
NASM = nasm
QEMU_OPTS=-cdrom bin/os.iso -no-reboot -serial file:os_serial.txt

ASM_FLAGS = -f elf64 

OBJ_DIR=obj
ASM_DIR=src/OS/asm

_DEPS = boot.asm dotnet.asm load_end_addr.asm modules.asm multiboot_header.asm

OS_SOURCES = $(wildcard src/OS/*.cs) $(wildcard src/OS/*/*.cs)
OS_DLL=bin/Debug/netstandard2.0/OS.dll
RUNTIME_DLL=bin/Debug/netstandard2.0/Zenos.Runtime.dll
OS_OBJ=obj/OS.o

ISO=bin/os.iso
KERNEL=bin/kernel.bin
GRUB_SCRIPT=scripts/grub.cfg

DEPS = $(patsubst %,$(ASM_DIR)/%,$(_DEPS))

_OBJ = $(_DEPS:.asm=.o)
OBJ = $(patsubst %,$(OBJ_DIR)/%,$(_OBJ))

default: run

.PHONY: default build run clean debug

build: $(ISO)

run: $(ISO)
	./tools/qemu/qemu-system-x86_64.exe $(QEMU_OPTS)

debug: $(ISO)
	./tools/qemu/qemu-system-x86_64.exe $(QEMU_OPTS) -no-shutdown -d cpu_reset -S -s

gdb: $(ISO)
	gdb --se=$(KERNEL) -x scripts/start_gdb.txt

$(ISO): $(KERNEL) $(GRUB_SCRIPT)
	@echo Building ISO && \
	mkdir -p obj/isofiles/boot/grub && \
	cp $(KERNEL) obj/isofiles/boot/kernel.bin && \
	cp $(GRUB_SCRIPT) obj/isofiles/boot/grub/grub.cfg && \
	grub-mkrescue -o $(ISO) obj/isofiles

$(KERNEL): $(OS_OBJ) $(OBJ) scripts/linker.ld
	@echo Building $(KERNEL); \
	ld --nmagic --output=$(KERNEL) --script=scripts/linker.ld obj/multiboot_header.o obj/boot.o obj/OS.o obj/modules.o obj/dotnet.o obj/load_end_addr.o
	# clang-3.9 -march=i686 -ffreestanding -fno-builtin -nostdlib obj/multiboot_header.o obj/boot.o obj/OS.o obj/modules.o obj/dotnet.o obj/load_end_addr.o

$(OS_OBJ): $(OS_DLL) $(ILC) $(RUNTIME_DLL)
	echo Converting to Native code; \
	$(ILC) -g --out $(OS_OBJ) $(OS_DLL) $(RUNTIME_DLL) $(CORELIB)

$(OBJ_DIR): $(OBJ_DIR)
	@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(ASM_DIR)/%.asm
	@echo Assembling $@; \
	$(NASM) $(ASM_FLAGS) -o $@ $<

$(RUNTIME_DLL): $(OS_DLL)

$(OS_DLL): $(OS_SOURCES)
	@echo Building OS; \
	$(DOTNET) restore && \
	$(DOTNET) build

$(ILC):
	@cd ./vendor/corert; ./build.sh clean anyos Release

clean:
	rm -rf obj/
	rm -rf bin/

print-%  : ; @echo $* = $($*)