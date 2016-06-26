using System;
using System.Runtime;
using System.Runtime.InteropServices;

internal static partial class Interop
{
    internal unsafe partial class Sys
    {
        [RuntimeImport("SystemNative_Abort")]
        internal static extern void Abort();
    }
}
