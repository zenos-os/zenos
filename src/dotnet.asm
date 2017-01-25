global start_dotnet

section .text
bits 64

start_dotnet:
  extern __modules_a
  extern __modules_z

  extern OS_OS_Program__Main
  call OS_OS_Program__Main