@echo off

set DEBUG_GDB=0
set QEMU_OPTIONS=
set ROOT=%~dp0
set TOOLS_PATH=%ROOT%\tools
set SCRIPTS_PATH=%ROOT%\scripts
set BIN_PATH=%ROOT%\bin\Debug
set ISO_PATH=%BIN_PATH%\os.iso
set KERNEL_PATH=%BIN_PATH%\kernel.bin
set KERNEL_PDB=%BIN_PATH%\kernel.pdb

set GDB_CMD=%TOOLS_PATH%\gdb.exe
set QEMU_CMD=%TOOLS_PATH%\qemu\qemu-system-x86_64.exe

IF "debug"=="%1" SET DEBUG_GDB=1

call:main

goto:eof

:main
  IF /I "%DEBUG_GDB%" EQU "1" (
    echo Debugging GDB
    set QEMU_OPTIONS=-S -gdb tcp::1234
    start "GDB" %GDB_CMD% -d %BIN_PATH% --exec %KERNEL_PATH% --symbols %KERNEL_PDB% -x %SCRIPTS_PATH%\start_gdb.txt
  )

  echo :: starting qemu ::
  "%QEMU_CMD%" -cdrom "%ISO_PATH%" -no-reboot -d cpu_reset -boot d -m 128 -serial file:serial.log %QEMU_OPTIONS%
goto:eof