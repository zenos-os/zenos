How to run:
  build OS.csproj
  run OS.csproj which will compile OS.obj
  run build.cmd from command line
  run `run.cmd debug` from command line


https://qemu.weilnetz.de/w64/

TODO:
* looks like we can get into 64 bit mode and paging setup works if the OS.obj isnt included.
* I think our stack address in the mb_header is actually pointing to some other code so its probably overwriting it

* Currently some things are working but we are going directly into OS_OS_Program__Main rather than __managed__Main

currently when calling InitializeModules we end of calling RhpReversePInvoke2 which calls itself in a loop
so whatever is happening it isnt calling the code we have defined for it. There is a definition here:
https://github.com/dotnet/corert/blob/058296779d02b720b740669bf280135914bd75f7/src/Native/Runtime/thread.cpp#L1237


dumpbin /SYMBOLS obj\OS.obj > obj\os_symbols.txt

this is all related to _tls_index and Thread Local Storage
* http://www.nynaeve.net/?p=180
* http://www.nynaeve.net/?p=181
* http://www.nynaeve.net/?p=183
* http://www.nynaeve.net/?p=185
* http://www.nynaeve.net/?p=186


InitializeModules
InitializeGlobalTablesForModule
InitializeStatics
RhNewObject
disassemble 0x112ae0,+94

Looks like we are at least getting to InitializeStatics but there are some issues where we are writing to the screen when we shouldnt be


So now we are in InitializeModules and when we assign `Modules = modules` we get an exception
most likely due to InitializeStatics not actually working. So need to look here as we should
have an item for StartupCodeHelpers initialized.

I think the original issue with InitializeStatics is fixed now but we need to implement AllocHandle
in order to finish initializing statics



GDB notes:
  dissassemble a method:
    disassemble 0x112ae0,+100