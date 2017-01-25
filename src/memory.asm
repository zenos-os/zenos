global alloc
global dealloc
global init_heap
global RhpGcAlloc

section .data
heap_base:  dq 0

section .text
bits 64

; void* RhpGcAlloc(EEType *pEEType, UInt32 uFlags, UIntNative cbSize, void * pTransitionFrame)
; passing EEType in rcx
; pasing size in r8
; pasing pTransitionFrame in r9
RhpGcAlloc:
    ; print `Err: RhpGcAlloc ` to screen
    push rcx

    mov rcx, r8
    call alloc

    pop rcx
    ret

;; RCX == size
;; returns RAX memory location
alloc:
    mov rax, [heap_base]
    add [heap_base], rcx
    ret

init_heap:
  extern stack_top
  mov rax, stack_top
  mov [heap_base], rax
  ret

dealloc:
  ret
