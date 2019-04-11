using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Nuke.Common;
using Nuke.Common.Execution;
using Nuke.Common.Git;
using Nuke.Common.ProjectModel;
using Nuke.Common.Tooling;
using Nuke.Common.Tools.DotNet;
using Nuke.Common.Utilities.Collections;
using static Nuke.Common.EnvironmentInfo;
using static Nuke.Common.IO.FileSystemTasks;
using static Nuke.Common.IO.PathConstruction;
using static Nuke.Common.Tools.DotNet.DotNetTasks;
using static Nuke.Common.Tooling.ProcessTasks;
using static Nuke.Common.Logger;

[CheckBuildProjectConfigurations]
[UnsetVisualStudioEnvironmentVariables]
class Build : NukeBuild
{
    /// Support plugins are available for:
    ///   - JetBrains ReSharper        https://nuke.build/resharper
    ///   - JetBrains Rider            https://nuke.build/rider
    ///   - Microsoft VisualStudio     https://nuke.build/visualstudio
    ///   - Microsoft VSCode           https://nuke.build/vscode

    public static int Main() => Execute<Build>(x => x.CompileIso);

    [Parameter("Configuration to build - Default is 'Debug' (local) or 'Release' (server)")]
    readonly Configuration Configuration = IsLocalBuild ? Configuration.Debug : Configuration.Release;

    [Solution] readonly Solution Solution;
    [GitRepository] readonly GitRepository GitRepository;

    // Paths
    AbsolutePath SourceDirectory => RootDirectory / "src";
    AbsolutePath TestsDirectory => RootDirectory / "tests";
    AbsolutePath ArtifactsDirectory => RootDirectory / "artifacts";
    AbsolutePath ScriptsDirectory => RootDirectory / "scripts";
    AbsolutePath ObjectsDirectory => RootDirectory / "obj";
    AbsolutePath IsoFilesIntermediatePath => ObjectsDirectory / "isofiles";
    AbsolutePath AssemblyFiles => SourceDirectory / "Zenos.Kernel" / "asm";
    AbsolutePath BuildOutputDirectory => RootDirectory / "bin" / Configuration / "netstandard2.0";
    AbsolutePath CoreRTDirectory => RootDirectory / "vendor" / "corert";

    // Files
    AbsolutePath IsoFile => ArtifactsDirectory / "os.iso";
    AbsolutePath KernelFile => ArtifactsDirectory / "kernel.bin";
    AbsolutePath GrubScript => ScriptsDirectory / "grub.cfg";
    AbsolutePath LinkerScript => ScriptsDirectory / "linker.ld";
    AbsolutePath StartGdbScript => ScriptsDirectory / "start_gdb.txt";
    AbsolutePath OSAssembly => BuildOutputDirectory / "Zenos.Kernel.dll";
    AbsolutePath CorelibAssembly => BuildOutputDirectory / "Zenos.CoreLib.dll";
    AbsolutePath RuntimeAssembly => BuildOutputDirectory / "Zenos.Runtime.dll";
    AbsolutePath OSObjectFile => ObjectsDirectory / "Kernel.o";

    // Commands
    AbsolutePath QemuCommand => RootDirectory / "tools" / "qemu" / "qemu-system-x86_64.exe";
    string QemuOptions => $"-cdrom {IsoFile} -no-reboot -serial file:os_serial.txt";
    AbsolutePath IlcCommand => RootDirectory / "vendor" / "corert" / "bin" / "Linux.x64.Release" / "tools" / "ilc";
    string NasmOptions = "-f elf64";


    string WslPath(string path) =>
        StartProcess("wsl", $"wslpath -u \"{path}\"", logOutput: true)
            .AssertZeroExitCode()
            .Output
            .Select(x => x.Text)
            .FirstOrDefault();

    bool NeedsBuild(AbsolutePath target, IEnumerable<AbsolutePath> sources) =>
        NeedsBuild(target, sources.ToArray());

    bool NeedsBuild(AbsolutePath target, params AbsolutePath[] sources)
    {
        if (!FileExists(target))
        {
            Info($"Missing target: {target}");
            return true;
        }

        var targetDate = GetLastWriteTimeUtc(target);


        Info($"Sources:");

        var sourcesDates = (from source in sources
                            let sourceDate = GetLastWriteTimeUtc(source)
                            orderby sourceDate descending
                            select new { source, sourceDate }).ToList();

        var sourcesDate = sourcesDates.FirstOrDefault();

        Info($"Target: {target}");
        Info($"Target Date: {targetDate}");
        Info($"Source: {sourcesDate.source}");
        Info($"Source Date: {sourcesDate.sourceDate}");
        return targetDate < sourcesDate.sourceDate;
    }

    Target Clean => _ => _
        .Before(Restore)
        .Executes(() =>
        {
            SourceDirectory.GlobDirectories("**/bin", "**/obj").ForEach(DeleteDirectory);
            TestsDirectory.GlobDirectories("**/bin", "**/obj").ForEach(DeleteDirectory);
            EnsureCleanDirectory(ArtifactsDirectory);
        });

    Target Restore => _ => _
        .OnlyWhenDynamic(() => NeedsBuild(OSAssembly, SourceDirectory.GlobFiles("**/*.cs")))
        .Executes(() => DotNetRestore(s => s.SetProjectFile(Solution)));

    Target CompileOS => _ => _
        .DependsOn(Restore)
        .OnlyWhenDynamic(() => NeedsBuild(OSAssembly, SourceDirectory.GlobFiles("**/*.cs")))
        .Executes(() =>
            DotNetBuild(s => s
                .SetProjectFile(Solution)
                .SetConfiguration(Configuration)
                .EnableNoRestore()));

    Target CompileILC => _ => _
        .OnlyWhenDynamic(() => NeedsBuild(IlcCommand, CoreRTDirectory.GlobFiles("**/*.cs")))
        .Executes(() =>
        {
            StartProcess("wsl", "cd ./vendor/corert; ./build.sh x64 Release").AssertZeroExitCode();
            Touch(IlcCommand);
        });

    Target CompileOSObjectFile => _ => _
        .DependsOn(CompileILC)
        .DependsOn(CompileOS)
        .OnlyWhenDynamic(() => NeedsBuild(OSObjectFile, OSAssembly, CorelibAssembly, RuntimeAssembly))
        .Executes(() => StartProcess("wsl",
                $"{WslPath(IlcCommand)} -g --systemmodule Zenos.CoreLib --out {WslPath(OSObjectFile)} {WslPath(OSAssembly)} {WslPath(CorelibAssembly)} {WslPath(RuntimeAssembly)}")
            .AssertZeroExitCode());

    bool ShouldCompileAssembly() =>
        AssemblyFiles
            .GlobFiles("*.asm")
            .Any(fileName => NeedsBuild(ObjectsDirectory / $"{Path.GetFileNameWithoutExtension(fileName)}.o", fileName));

    Target CompileAssembly => _ => _
        .OnlyWhenDynamic(() => ShouldCompileAssembly())
        .Executes(() =>
        {
            EnsureExistingDirectory(ObjectsDirectory);

            Info(AssemblyFiles.ToString());

            var files = AssemblyFiles.GlobFiles("*.asm");
            files.ForEach(file =>
            {
                var unixFile = WslPath(file);
                var objDir = WslPath(ObjectsDirectory);
                var name = Path.GetFileNameWithoutExtension(file);
                StartProcess("wsl", $"nasm {NasmOptions} -o {objDir}/{name}.o {unixFile}").AssertZeroExitCode();
            });
        });

    Target CompileKernel => _ => _
        .DependsOn(CompileAssembly)
        .DependsOn(CompileOSObjectFile)
        .DependsOn(EnsureArtifactsPath)
        .OnlyWhenDynamic(() => NeedsBuild(KernelFile, AssemblyFiles, LinkerScript, OSObjectFile))
        .Executes(() =>
        {
            StartProcess("wsl",
                    $"ld --nmagic --output={WslPath(KernelFile)} --script={WslPath(LinkerScript)} obj/multiboot_header.o obj/boot.o {WslPath(OSObjectFile)} obj/modules.o obj/dotnet.o obj/load_end_addr.o")
                .AssertZeroExitCode();
        });

    Target EnsureArtifactsPath => _ => _
        .OnlyWhenDynamic(() => !DirectoryExists(ArtifactsDirectory))
        .Executes(() => EnsureExistingDirectory(ArtifactsDirectory))
        .Unlisted();

    Target CompileIso => _ => _
        .DependsOn(CompileKernel)
        .DependsOn(EnsureArtifactsPath)
        .OnlyWhenDynamic(() => NeedsBuild(IsoFile, KernelFile, GrubScript))
        .Executes(() =>
        {
            EnsureCleanDirectory(IsoFilesIntermediatePath);
            EnsureExistingDirectory(IsoFilesIntermediatePath / "boot" / "grub");
            CopyFile(KernelFile, IsoFilesIntermediatePath / "boot" / "kernel.bin");
            CopyFile(GrubScript, IsoFilesIntermediatePath / "boot" / "grub" / "grub.cfg");

            StartProcess("wsl", $"grub-mkrescue -o {WslPath(IsoFile)} {WslPath(IsoFilesIntermediatePath)}").AssertZeroExitCode();
        });

    Target Run => _ => _
        .DependsOn(CompileIso)
        .Executes(() => StartProcess(QemuCommand, QemuOptions).WaitForExit());

    Target Debug => _ => _
        .DependsOn(CompileIso)
        .Executes(() =>
        {
            var qemu = StartProcess(QemuCommand, $"{QemuOptions}  -no-shutdown -d cpu_reset -S -s");
            //StartProcess("wsl", $"gdb --se={WslPath(KernelFile)} -x {WslPath(StartGdbScript)}", logOutput: true)
            //    .WaitForExit();
            return qemu.WaitForExit();
        });

    Target GDB => _ => _
        .DependsOn(CompileIso)
        .Executes(() => StartProcess("wsl", $"gdb --se={WslPath(KernelFile)} -x {WslPath(StartGdbScript)}").WaitForExit());

}
