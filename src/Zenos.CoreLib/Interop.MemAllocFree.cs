// See the LICENSE file in the project root for more information.

using System;
using System.Runtime;
using System.Runtime.InteropServices;

internal static partial class Interop
{
    internal unsafe partial class Sys
    {
        internal static extern IntPtr MemAlloc(UIntPtr sizeInBytes);

        internal static extern void MemFree(IntPtr ptr);
    }

    internal static IntPtr MemAlloc(UIntPtr sizeInBytes)
    {
        IntPtr allocatedMemory = Interop.Sys.MemAlloc(sizeInBytes);
        if (allocatedMemory == IntPtr.Zero)
        {
            throw new OutOfMemoryException();
        }
        return allocatedMemory;
    }

    internal static void MemFree(IntPtr allocatedMemory)
    {
        Interop.Sys.MemFree(allocatedMemory);
    }
}
