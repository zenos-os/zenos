using System;
using System.Collections.Generic;
using System.Runtime;
using System.Runtime.InteropServices;
using System.Text;

internal static partial class Interop
{
    internal static partial class Sys
    {
        [RuntimeImport("SystemNative_GetPid")]
        internal static extern int GetPid();
    }

    internal static uint GetCurrentProcessId() => (uint)Sys.GetPid();
}
