ENTRY(start)

SECTIONS {
    . = 1M;

    .boot :
    {
        /* ensure that the multiboot header is at the beginning */
        *(.multiboot_header)
    }

    .text :
    {
        *(.text)
    }

    __modules :
    {
        *(.modules$A)
        *(__modules)
        *(.modules$Z)
    }
}