section .text
bits 64

%macro no_error_code_interrupt_handler %1
global interrupt_handler_%1
interrupt_handler_%1:
    push    dword 0                     ; push 0 as error code
    push    dword %1                    ; push the interrupt number
    jmp     common_interrupt_handler    ; jump to the common handler
%endmacro

%macro error_code_interrupt_handler %1
global interrupt_handler_%1
interrupt_handler_%1:
    push    dword %1                    ; push the interrupt number
    jmp     common_interrupt_handler    ; jump to the common handler
%endmacro

common_interrupt_handler:
    extern HandleInterrupt
    push rax
    push rbx
    push rcx
    push rdx

    push rdi
    push rsi
    push rsp ; there is probably something special we need to do here since we are adding to the stack
    push rbp

    push rip
    push rflags
    
    mov  rcx, rsp+80
    call HandleInterrupt

    pop  rflags
    pop  rip

    pop  rbp
    pop  rsp
    pop  rsi
    pop  rdi

    pop  rdx
    pop  rcx
    pop  rbx
    pop  rax
    
    ; pop interupt number and error code
    add  rsp, 16
    iretq


global LoadIDT
; rcx address of the IDT
LoadIDT:
    mov     rax, rcx    ; load the address of the IDT into register eax
    lidt    rax             ; load the IDT
    ret                     ; return to the calling function


no_error_code_interrupt_handler 0       ; create handler for interrupt 0
no_error_code_interrupt_handler 1
no_error_code_interrupt_handler 2
no_error_code_interrupt_handler 3
no_error_code_interrupt_handler 4
no_error_code_interrupt_handler 5
no_error_code_interrupt_handler 6
no_error_code_interrupt_handler 7  
error_code_handler              8 
no_error_code_interrupt_handler 9 
error_code_handler              10
error_code_handler              11
error_code_handler              12
error_code_handler              13
error_code_handler              14
no_error_code_interrupt_handler 15
no_error_code_interrupt_handler 16
error_code_handler              17