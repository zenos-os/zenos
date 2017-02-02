How to run:
  build OS.csproj
  run OS.csproj which will compile OS.obj
  run build.cmd from command line
  run `run.cmd debug` from command line


https://qemu.weilnetz.de/w64/

TODO:
* get gdb able to print symbols
* Call InitializeModules properly
* Support static constructors
  * RhGetThreadStaticStorageForModule
  * RhSetThreadStaticStorageForModule

dumpbin /SYMBOLS obj\OS.obj > obj\os_symbols.txt

this is all related to _tls_index and Thread Local Storage
* http://www.nynaeve.net/?p=180
* http://www.nynaeve.net/?p=181
* http://www.nynaeve.net/?p=183
* http://www.nynaeve.net/?p=185
* http://www.nynaeve.net/?p=186

GDB notes:
  dissassemble a method:
    disassemble 0x112ae0,+100