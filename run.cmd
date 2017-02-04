@echo off

set DEBUG_GDB=0
set QEMU_OPTIONS=
set ROOT=%~dp0
set SCRIPTS_PATH=%ROOT%\scripts
set BIN_PATH=%ROOT%\bin\Debug
set ISO_PATH=%BIN_PATH%\os.iso
set KERNEL_PATH=%BIN_PATH%\kernel.bin
set KERNEL_PDB=%BIN_PATH%\kernel.pdb

set GDB_CMD="C:\ProgramData\Microsoft\AndroidNDK\android-ndk-r10e\toolchains\x86_64-4.9\prebuilt\windows\bin\x86_64-linux-android-gdb.exe"

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
  "C:\Program Files\qemu\qemu-system-x86_64.exe" -cdrom "%ISO_PATH%" -no-reboot -d cpu_reset -boot d -m 128 -serial file:serial.log %QEMU_OPTIONS%
goto:eof