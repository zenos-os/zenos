using System;
using System.Collections.Generic;
using System.Text;

namespace System.Threading
{
    internal partial class ClrThreadPool
    {
        private class CpuUtilizationReader
        {
            public int CurrentUtilization => throw new NotImplementedException();
        }
    }
}
