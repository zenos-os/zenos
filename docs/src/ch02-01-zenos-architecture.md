# Zenos Architecture

## Components

* ILCompiler(CoreRT)
* System.Private.CoreLib
* Zenos compiler
* Zenos OS

## Build process

1. Build Zenos OS C# Components
2. Build Native ZenosOS object files(ILCompiler)
3. Build Assembly components
   * multiboot_header
   * boot
   * OS.obj
   * modules
   * dotnet
   * load_end_addr
4. Link all object files
5. Build ISO


## Build commands

```bash
make debug
make gdb
make
```

## Calling convention

RDI, RSI, RDX, RCX, R8, R9



Listing symbols:

```bash
readelf -s ./sdk/libPortableRuntime.a
nm -g ./sdk/libPortableRuntime.a
```

investigate OSGroup=AnyOS in corert https://github.com/dotnet/corert/blob/c57237f6b22f58e037b6f316ebc138e8fa5833f6/dir.props

should be able to run `./build.sh clean Release anyos`

should be able to add `/p:DefineConstants="MYSYMBOL1;MYSYMBOL2"` to the above with the appropriate constants

GOALS:

* blockers:
  * erroring on some unimplemented methods
* get internalsvisibleto working so that we can access the inner types
* see if we can get a build more aligned with a CUSTOM OS
  * to get anyos working we would need to define some types or stubs for several classes
  * INPLACE_RUNTIME;FEATURE_COMINTEROP;FEATURE_MANAGED_ETW_CHANNELS;FEATURE_MANAGED_ETW;
  * FEATURE_SYNCTABLE;netcoreapp;EETYPE_TYPE_MANAGER;
  * ES_BUILD_PN;ES_SESSION_INFO;AMD64;BIT64;PLATFORM_WINDOWS;CORERT;;DEBUGRESOURCES;SIGNED
