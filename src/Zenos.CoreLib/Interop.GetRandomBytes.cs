using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

internal partial class Interop
{
    internal unsafe partial class Sys
    {
//        [DllImport(Interop.Libraries.SystemNative, EntryPoint = "SystemNative_GetNonCryptographicallySecureRandomBytes")]
        internal static extern unsafe void GetNonCryptographicallySecureRandomBytes(byte* buffer, int length);
    }

    internal static unsafe void GetRandomBytes(byte* buffer, int length)
    {
        Sys.GetNonCryptographicallySecureRandomBytes(buffer, length);
    }
}
