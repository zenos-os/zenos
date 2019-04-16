# Getting Started

## Installation Requirements

* Windows Subsystem for Linux (Ubuntu 18.04)
* CoreRT
* Zenos Tooling


dotnet tool install Nuke.GlobalTool --global

### Windows Subsystem For Linux

Setup VS for remote debugging:
https://devblogs.microsoft.com/cppblog/targeting-windows-subsystem-for-linux-from-visual-studio/

### CoreRT

Under WSL we want to install the following:
[CoreRT Prerequisites for building](https://github.com/dotnet/corert/blob/master/Documentation/prerequisites-for-building.md)


```bash
echo "deb http://llvm.org/apt/xenial/ llvm-toolchain-xenial-3.9 main" | sudo tee /etc/apt/sources.list.d/llvm.list
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt-get update
sudo apt-get install cmake clang-3.9 libicu55 uuid-dev libcurl4-openssl-dev zlib1g-dev libkrb5-dev
```

### Building ILC

```bash
cd vendor/corert
./build.sh clean
```

CoreRT binaries will be places in `<repo_root>vendor\corert\bin\Linux.x64.<Config>\tools`


### Zenos Tooling

```bash
sudo apt install \
    gdb \
    grub-pc-bin \
    nasm \
    xorriso
```


### Troubleshooting

If you get an error similar to:

```
Initializing BuildTools...
chmod: cannot access '/mnt/e/code/OsDev/zenos/vendor/corert/packages/microsoft.dotnet.buildtools/3.0.0-preview1-03220-01'$'\r''/lib/init-tools.sh': No such file or directory
```

run `vi -b BuildToolsVersion.txt` and remove trailing ^M

maybe QEMU

Tools go to:
    /mnt/e/code/OsDev/zenos/vendor/corert/bin/Linux.x64.Debug/sdk/libRuntime.a
