# NOTES 

### Building

The following now builds all assembly files as well as the kernel.

TODO:
* Update building the ISO from OS.bin
* See if it will boot
* Should be good to delete LowLevel project now


```batch
dotnet build -r win-x64
```




Look into using the sample provided here:
https://github.com/dotnet/corert/blob/635cf21aca11265ded9d78d216424bd609c052f5/tests/src/Simple/StaticLibrary/StaticLibrary.csproj


https://natemcmaster.com/blog/2017/07/05/msbuild-task-in-nuget/


NuGet will automatically import the build/(package id).props file is imported into projects when the project has a single TargetFramework. It will import buildMultiTargeting/(package id).props when the project has multiple TargetFrameworks. (FYI - NuGet will also import build/(package id).targets and buildMultiTargeting/(package id).targets. .props files are imported near the top of the file and .targets files near the bottom.)


Looks like `NativeObject` msbuild property stores our file name for the obj file


GDB Debugging:

run `make debug` and `make gdb`

set breakpoint:
	b start_dotnet:
	b OS_OS_Program__EntryPoint

show registers
	info reg

disassemble
	disas  0x000000000101b07,+10
