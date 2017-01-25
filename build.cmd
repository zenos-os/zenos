@echo off

SET VSVARS_CMD="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"

ml64 > nul 2>&1 || call %VSVARS_CMD% amd64

SET DEBUG_GDB=0

IF "debug"=="%1" SET DEBUG_GDB=1

set ROOT=%~dp0
set ISO_PATH=%ROOT%\bin\os.iso

set TOOLS_PATH=%ROOT%\tools
set CORERT_PATH=%ROOT%..\corert

set CoreRT_AppDepSdkVer=1.0.6-prerelease-00004
set CoreRT_BuildArch=x64
set CoreRT_AppDepSdkPkg=toolchain.win7-%CoreRT_BuildArch%.Microsoft.DotNet.AppDep
set CoreRT_AppDepSdkDir=%CORERT_PATH%\packages\%CoreRT_AppDepSdkPkg%\%CoreRT_AppDepSdkVer%

set NASM_CMD=%TOOLS_PATH%\nasm.exe
set MASM_CMD=ml64
set QEMU_OPTIONS=

call:main

goto:eof

:main

  echo :: Building assembly files ::
  call:compile_asm boot
  call:compile_asm multiboot_header
  call:compile_asm red_hawk
  call:compile_asm globals
  call:compile_asm load_end_addr
  call:compile_asm modules
  call:compile_asm dotnet
  call:compile_asm memory
  call:compile_masm AllocFast

  echo :: Building KOS ::

  echo :: Converting KOS to Native ::

  echo :: Linking KOS ::
  link @src\linker.rsp || call:error "running linker"

  echo :: Building iso ::

  mkdir obj\iso\boot\grub
  copy bin\kernel.bin obj\iso\boot\kernel.bin > nul
  copy src\grub.cfg obj\iso\boot\grub > nul
  mkdir obj\iso\boot\grub\i386-pc
  tools\7za.exe x .\tools\i386-pc.zip -oobj\iso\boot\grub > nul || call:error "extracting grub"
  tools\mkisofs -relaxed-filenames -J -R -o ".\bin\os.iso" -b "boot/grub/i386-pc/eltorito.img" -no-emul-boot -boot-load-size 4 -boot-info-table "./obj/iso" 2> nul || call:error "compiling iso"
  rmdir /s /q obj\iso

  echo :: Compilation Complete ::

goto:eof

:: obj\Debug\dnxcore50\native\kos.obj
:compile_asm
  echo  - Assembling: src\%~1.asm
  %NASM_CMD% -f win64 -o obj\%~1.obj src\%~1.asm || call:error "compiling %~1.asm"
goto:eof

:compile_masm
  echo  - Assembling: src\%~1.asm
  %MASM_CMD% /nologo /c src\%~1.asm  || call:error "compiling %~1.asm"
  move %~1.obj obj\%~1.obj > nul
goto:eof


:error
  echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  echo An error occurred while %~1
  echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  exit /b 1
goto:eof