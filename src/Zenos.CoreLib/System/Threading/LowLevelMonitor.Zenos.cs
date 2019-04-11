using System;
using System.Collections.Generic;
using System.Text;

namespace System.Threading
{
    partial class LowLevelMonitor
    {


        private void DisposeCore()
        {
//            if (_nativeMonitor == IntPtr.Zero)
//            {
//                return;
//            }
//
//            Interop.Sys.LowLevelMonitor_Delete(_nativeMonitor);
//            _nativeMonitor = IntPtr.Zero;
        }

        private void AcquireCore()
        {
//            Interop.Sys.LowLevelMutex_Acquire(_nativeMonitor);
        }

        private void ReleaseCore()
        {
//            Interop.Sys.LowLevelMutex_Release(_nativeMonitor);
        }


        private void WaitCore()
        {
//            Interop.Sys.LowLevelMonitor_Wait(_nativeMonitor);
        }

        private bool WaitCore(int timeoutMilliseconds)
        {
//            Debug.Assert(timeoutMilliseconds >= -1);
//
//            if (timeoutMilliseconds < 0)
//            {
//                WaitCore();
//                return true;
//            }
//
//            return Interop.Sys.LowLevelMonitor_TimedWait(_nativeMonitor, timeoutMilliseconds);
            throw new NotImplementedException();
        }

        private void Signal_ReleaseCore()
        {
//            Interop.Sys.LowLevelMonitor_Signal_Release(_nativeMonitor);
        }
    }
}
