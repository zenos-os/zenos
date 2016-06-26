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

  ; subtract __modules_z - __modules_a to get the size of memory for all module entries (8 bytes each)
  lea      rax, [__modules_z]
  lea      rcx, [__modules_a]
  sub      rax, rcx
  ; divide the size by 8 to get the number of modules
  sar      rax, 3
  mov      rsi, rax
  ; rsi is now the count of modules

  lea      rdi, [__modules_a]
  mov      rdx, stack_top
  call OS_OS_Program__EntryPoint

  ret

; rdi port
; rsi value
Out8:
  push rax
  push rdx
  mov rdx, rdi
  mov rax, rsi
  ; rax has the value now
  ; rsi has the port
  out dx, al
  pop rdx
  pop rax
  ret

; rdi port
; rsi value
Out16:
  push rax
  push rdx
  mov rdx, rdi
  mov rax, rsi
  ; rax has the value now
  ; rsi has the port
  out dx, ax
  pop rdx
  pop rax
  ret
  
; rdi port
; rsi value
Out32:
  push rax
  push rdx
  mov rdx, rdi
  mov rax, rsi
  ; rax has the value now
  ; rsi has the port
  out dx, eax
  pop rdx
  pop rax
  ret

; rdi port
In8:
  push rdx
  mov rdx, rdi
  ; rdx has the port
  in al, dx
  pop rdx
  ret

; rdi port
In16:
  push rdx
  mov rdx, rdi
  ; rdx has the port
  in ax, dx
  pop rdx
  ret

; rdi port
In32:
  push rdx
  mov rdx, rdi
  ; rdx has the port
  in eax, dx
  pop rdx
  ret