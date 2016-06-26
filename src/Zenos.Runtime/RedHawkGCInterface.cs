using System;
using System.Runtime;

namespace OS.Runtime
{
    internal static class RedHawkGCInterface
    {
        [RuntimeExport("RhpRegisterFrozenSegment")]
        public static /*GcSegmentHandle*/ bool RhpRegisterFrozenSegment(IntPtr pSegmentStart, int length)
        {
            return true;
        }
    }
}