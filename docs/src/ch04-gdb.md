# GDB Cheatsheet


## Running:

    c                - continue running
    s                - step into source line
    si               - step int instruction
    n                - step over
    b Program.cs:25  - make a breakpoint for Program.cs on line 25
    bt               - print stack trace

## Information:

    info locals - Print local variables
    l           - source listing


## Memory

    x variableName    - print memory at address of variableName
    x 0x3423489       - print memory at address
    x/4 0x34534       - print four uint32 values