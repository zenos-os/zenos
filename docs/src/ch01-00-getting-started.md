# Getting Started

## Installation Requirements Summary

* Windows Subsystem for Linux (Ubuntu 18.04)
* CoreRT
* Zenos Tooling

### Windows Subsystem For Linux

Setup VS for remote debugging:
https://devblogs.microsoft.com/cppblog/targeting-windows-subsystem-for-linux-from-visual-studio/

### CoreRT Dependencies

Under WSL we want to install the following:
[CoreRT Prerequisites for building](https://github.com/dotnet/corert/blob/master/Documentation/prerequisites-for-building.md)


```bash
echo "deb http://llvm.org/apt/xenial/ llvm-toolchain-xenial-3.9 main" | sudo tee /etc/apt/sources.list.d/llvm.list
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt-get update
sudo apt-get install cmake clang-3.9 libicu-dev uuid-dev libcurl4-openssl-dev zlib1g-dev libkrb5-dev
```

#### Building ILC (Manually)

```bash
cd vendor/corert
./build.sh clean x64 Release
```

CoreRT binaries will be places in `<repo_root>vendor\corert\bin\Linux.x64.Release\tools`


### Zenos Tooling

Install Nuke Build tool:

```bash
dotnet tool install Nuke.GlobalTool --global
```

Install Debugging and ISO related tooling

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
