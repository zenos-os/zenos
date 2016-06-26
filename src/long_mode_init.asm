global long_mode_start

section .text
bits 64
long_mode_start:

    ; extern dotnet_main
    ;call dotnet_main
    ;extern __managed__Main
    ;mov	esi, 2
    ;mov	edi, 1
    ;call __managed__Main

    ; print `OKAY` to screen
    mov rax, 0x2f592f412f4b2f4f
    mov qword [0xb8000], rax
    hlt