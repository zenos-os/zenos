global start_dotnet

section .text
bits 64

start_dotnet:
  extern __modules_a
  extern __modules_z

  extern stack_top
  mov rcx, stack_top
  extern OS_OS_Program__EntryPoint
  call OS_OS_Program__EntryPoint