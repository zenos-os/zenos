global start_dotnet
global Out8
global Out16
global Out32
global In8
global In16
global In32

section .text
bits 64

start_dotnet:
  extern stack_top
  extern OS_OS_Program__EntryPoint

  extern __modules_a
  extern __modules_z

  lea      rax, [__modules_z]
  lea      rcx, [__modules_a]
  sub      rax, rcx
  sar      rax, 3
  mov      edx, eax
  ; edx is now the count of modules

  lea      rcx, [__modules_a]
  mov      r8, stack_top
  call OS_OS_Program__EntryPoint

  ret

; rcx port
; rdx value
Out8:
  push rax
  mov rax, rdx
  mov rdx, rcx
  ; rax has the value now
  ; rdx has the port
  out dx, al
  pop rax
  ret

; rcx port
; rdx value
Out16:
  push rax
  mov rax, rdx
  mov rdx, rcx
  ; rax has the value now
  ; rdx has the port
  out dx, ax
  pop rax
  ret

; rcx port
; rdx value
Out32:
  push rax
  mov rax, rdx
  mov rdx, rcx
  ; rax has the value now
  ; rdx has the port
  out dx, eax
  pop rax
  ret


; rcx port
In8:
  push rdx
  mov rax, rdx
  mov rdx, rcx
  ; rax has the value now
  ; rdx has the port
  in al, dx
  pop rdx
  ret

; rcx port
In16:
  push rdx
  mov rax, rdx
  mov rdx, rcx
  ; rax has the value now
  ; rdx has the port
  in ax, dx
  pop rdx
  ret

; rcx port
In32:
  push rdx
  mov rax, rdx
  mov rdx, rcx
  ; rax has the value now
  ; rdx has the port
  in eax, dx
  pop rdx
  ret