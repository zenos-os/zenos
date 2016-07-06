@echo off

:: "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

set ROOT=%~dp0
set TOOLS_PATH=%ROOT%\tools
set NASM_CMD=%TOOLS_PATH%\nasm.exe

call:main

echo Done.&goto:eof

:main

  call:compile_asm boot
  call:compile_asm multiboot_header
  call:compile_asm red_hawk
  call:compile_asm load_end_addr
  E:\code\OsDev\corert\src\ILCompiler\desktop\bin\Debug\ilc.exe @ilc.rsp
  link @src\linker.rsp

goto:eof
::..\corert\Tools\dotnetcli\dotnet build --native --ilcpath E:\code\OsDev\corert\bin\Product\Windows_NT.x64.Debug\packaging\publish1
:: E:\code\OsDev\corert\src\ILCompiler\desktop\bin\Debug\ilc.exe @ilc.rsp
:: obj\Debug\dnxcore50\native\kos.obj
:compile_asm
  %NASM_CMD% -f win64 -o obj\%~1.obj src\%~1.asm
goto:eof
