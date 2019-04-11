# NOTES 

### Building

The following now builds all assembly files as well as the kernel.

TODO:
  * Get Interrupts working
  * Convert to UEFI boot


https://natemcmaster.com/blog/2017/07/05/msbuild-task-in-nuget/


GDB Debugging:

run `make debug` and `make gdb`

set breakpoint:
	b start_dotnet:
	b OS_OS_Program__EntryPoint

show registers
	info reg

disassemble
	disas  0x000000000101b07,+10



Interrupts:
	install interrupt table
	https://github.com/redox-os/kernel/blob/0c8ba636f4263665dae1b0fdd0a040e4e0c724f5/arch/x86_64/src/idt.rs
	https://github.com/awesomekling/serenity/blob/master/Kernel/i386.cpp

	interrupt macro definition:
	https://github.com/redox-os/kernel/blob/e20135575c6392dfbf43e117cafee03e00ae8f0c/arch/x86_64/src/lib.rs
	https://github.com/redox-os/kernel/blob/054fc41beb82019152bfc5186557aedb4e8b5d2a/src/arch/x86_64/macros.rs

	interrupt macro usage:
	https://github.com/redox-os/kernel/blob/054fc41beb82019152bfc5186557aedb4e8b5d2a/src/arch/x86_64/interrupt/exception.rs

