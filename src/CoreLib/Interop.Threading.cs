// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;
using System.Runtime;
using System.Runtime.InteropServices;

internal static partial class Interop
{
    internal unsafe partial class Sys
    {
        [RuntimeImport("CoreLibNative_LowLevelMutex_Acquire")]
        internal static extern void LowLevelMutex_Acquire(IntPtr mutex);

        [RuntimeImport("CoreLibNative_LowLevelMutex_Release")]
        internal static extern void LowLevelMutex_Release(IntPtr mutex);

        [RuntimeImport("CoreLibNative_LowLevelMonitor_New")]
        internal static extern IntPtr LowLevelMonitor_New();

        [RuntimeImport("CoreLibNative_LowLevelMonitor_Delete")]
        internal static extern void LowLevelMonitor_Delete(IntPtr monitor);

        [RuntimeImport("CoreLibNative_LowLevelMonitor_Wait")]
        internal static extern void LowLevelMonitor_Wait(IntPtr monitor);

        [RuntimeImport("CoreLibNative_LowLevelMonitor_TimedWait")]
        internal static extern bool LowLevelMonitor_TimedWait(IntPtr monitor, int timeoutMilliseconds);

        [RuntimeImport("CoreLibNative_LowLevelMonitor_Signal_Release")]
        internal static extern void LowLevelMonitor_Signal_Release(IntPtr monitor);

        internal delegate IntPtr ThreadProc(IntPtr parameter);

        [RuntimeImport("CoreLibNative_RuntimeThread_CreateThread")]
        internal static extern bool RuntimeThread_CreateThread(IntPtr stackSize, IntPtr startAddress, IntPtr parameter);
    }
}
