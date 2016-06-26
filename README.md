[![Build status][build-status-image]][build-status]   [![License][github-license]][github-license-link]  [![Issues][github-issues]][github-issues-link]  [![Stars][github-stars]][github-stars-link]  [![Forks][github-forks]][github-forks-link]  [![Gitter Chat][gitter-image]][gitter-chat]

[build-status-image]: https://ci.appveyor.com/api/projects/status/q2gcvnh5j7sfnkn8/branch/master?svg=true
[build-status]: https://ci.appveyor.com/project/zenos-os/zenos
[pull-requests-image]: http://www.issuestats.com/github/zenos-os/zenos/badge/pr
[pull-requests]: http://www.issuestats.com/github/zenos-os/zenos
[issues-closed-image]: http://www.issuestats.com/github/zenos-os/zenos/badge/issue
[issues-closed]: http://www.issuestats.com/github/zenos-os/zenos
[gitter-image]: https://img.shields.io/badge/gitter-join%20chat%20-blue.svg
[gitter-chat]: https://gitter.im/zenos-os/zenos
[github-issues]: https://img.shields.io/github/issues/zenos-os/zenos.svg
[github-forks]: https://img.shields.io/github/forks/zenos-os/zenos.svg
[github-stars]: https://img.shields.io/github/stars/zenos-os/zenos.svg
[github-license]: https://img.shields.io/badge/license-MIT-blue.svg
[github-link]: https://github.com/zenos-os/zenos
[github-stars-link]: https://github.com/zenos-os/zenos/stargazers
[github-forks-link]: https://github.com/zenos-os/zenos/network
[github-issues-link]: https://github.com/zenos-os/zenos/issues
[github-license-link]: https://raw.githubusercontent.com/zenos-os/zenos/master/LICENSE.txt


# Zenos

Zenos is a work in progress 64-bit operating system written in C# and x86-64 assembly.

# Overview

Currently Zenos works by using part of the .NET Native toolchain to AOT compile our C# kernel to a PE object file.

This object file is then linked with a collection of assembly based source files that provide access to low level opcodes we dont have in C#.

.NET CoreRT implements a number of C/C++ interop calls for which we will be replacing and implementing our own versions in C#.

For more information about the .NET Native toolchain see [CoreRT](https://github.com/dotnet/corert) on github.

# Roadmap

* Interrupt handlers
* Keyboard Support

# Contributing

How to compile:

> build.cmd

How to run the OS with QEMU:

> run.cmd

There is plenty of things that can be done. [Open an issue](https://github.com/zenos-os/zenos/issues/new) and make a suggestion.


# Inspiration

* https://intermezzos.github.io/book/
* [.NET Foundation](https://github.com/dotnet)
* https://github.com/mosa/MOSA-Project