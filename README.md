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


Looks like we are stuck on alocating an array:
  put a bp at this symbol address:
    __NewArr1_System_Private_CoreLib_System_IntPtr__<Array>
    __EEType_System_Private_CoreLib_System_IntPtr__<Array>


; rcx array size
; rdx pointer to function to initialize each node
__NewArr1_System_Private_CoreLib_System_IntPtr__<Array>:
  disassemble 0x00000000001048b8,+0x10
    0x00000000001048b8:  mov    rdx,rcx
    0x00000000001048bb:  lea    rcx,[rip+0xa440e]        # 0x1a8cd0, __EEType_System_Private_CoreLib_System_IntPtr__<Array>
 => 0x00000000001048c2:  jmp    0x107cc0                 # RhpNewArray
    0x00000000001048c7:  nop

looks like the issue is with this INLINE_GETTHREAD macro within RhpNewArray
the crash occurs when we use the GS segment so maybe its not initialized?

this is all related to _tls_index and Thread Local Storage
* http://www.nynaeve.net/?p=180
* http://www.nynaeve.net/?p=181
* http://www.nynaeve.net/?p=183
* http://www.nynaeve.net/?p=185
* http://www.nynaeve.net/?p=186
