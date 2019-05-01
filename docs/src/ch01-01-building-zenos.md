# Building Zenos

Once all of the required dependencies are installed from [Getting Started](./ch01-00-getting-started.md) you can now build zenos by going to the WSL command prompt and running the following:

```bash
nuke CompileIso
```

## Running with QEMU

You can also run Zenos with qemu via:

```bash
nuke Run
```

## Debugging with GDB

You can debug using GDB using:

```bash
nuke Debug
```

When the above command is ran, GDB and QEMU are launched simultaneously and connected via remote debugging.

See the GDB Cheatsheet [here](ch04-gdb.md)