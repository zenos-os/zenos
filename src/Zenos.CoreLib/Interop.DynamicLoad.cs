using System;
using System.Runtime;
using System.Runtime.InteropServices;

internal static partial class Interop
{
    internal unsafe partial class Sys
    {
        [RuntimeImport("SystemNative_LoadLibrary")]
        internal static extern IntPtr LoadLibrary(string filename);

        [RuntimeImport("SystemNative_GetProcAddress")]
        internal static extern IntPtr GetProcAddress(IntPtr handle, byte* symbol);

        [RuntimeImport("SystemNative_FreeLibrary")]
        internal static extern void FreeLibrary(IntPtr handle);
    }
}
