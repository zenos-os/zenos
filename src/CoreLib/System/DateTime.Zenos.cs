using System;
using System.Collections.Generic;
using System.Text;

namespace System
{
    public readonly partial struct DateTime
    {
        internal const bool s_systemSupportsLeapSeconds = false;

#if !CORECLR
        public static DateTime UtcNow
        {
            get
            {
                throw new NotImplementedException();
//                return new DateTime(((ulong)(Interop.Sys.GetSystemTimeAsTicks() + UnixEpochTicks)) | KindUtc);
            }
        }
#endif

        internal static DateTime FromFileTimeLeapSecondsAware(long fileTime) => default;
        internal static long ToFileTimeLeapSecondsAware(long ticks) => default;

        // IsValidTimeWithLeapSeconds is not expected to be called at all for now on non-Windows platforms
        internal static bool IsValidTimeWithLeapSeconds(int year, int month, int day, int hour, int minute, int second, DateTimeKind kind) => false;
    }
}
