var target = Argument("target", "Default");
var configuration = Argument("configuration", "Debug");

var scriptsDir = Directory("./scripts");

var buildDir = Directory("./bin") + Directory(configuration);
var objDir = Directory("./obj") + Directory(configuration);


Task("Clean")
    .Does(() =>
{
    CleanDirectory(buildDir);
    CleanDirectory(objDir);
});

Task("Restore-NuGet-Packages")
    .IsDependentOn("Clean")
    .Does(() =>
{
    NuGetRestore("Zenos.sln");
});


Task("Build")
    .IsDependentOn("Restore-NuGet-Packages")
    .Does(() =>
{
    // Use MSBuild
    MSBuild("Zenos.sln", settings =>
      settings
        .SetConfiguration(configuration));
});

Task("BuildIsoFile")
    .IsDependentOn("Build")
    .Does(() =>
{
  var isoDir = objDir + Directory("iso");
  var bootDir = isoDir + Directory("boot");
  var grubDir = bootDir + Directory("grub");
  var i386Dir = grubDir + Directory("i386-pc");
  var isoPath = buildDir + File("os.iso");

  CreateDirectory(i386Dir);
  CopyFile(buildDir + File("kernel.bin"), bootDir + File("kernel.bin"));
  CopyFile(scriptsDir + File("grub.cfg"), grubDir + File("grub.cfg"));
  StartProcess(@"tools\7za.exe", @"x tools\i386-pc.zip -o" + grubDir);
  StartProcess(@"tools\mkisofs.exe",
    @"-relaxed-filenames -J -R -o """ + isoPath + @""" -b ""boot/grub/i386-pc/eltorito.img"" -no-emul-boot -boot-load-size 4 -boot-info-table """ + isoDir + "\"");
  CleanDirectory(isoDir);
});


Task("Default")
    .IsDependentOn("BuildIsoFile");

RunTarget(target);