using System.Runtime;
using System.Runtime.InteropServices;

internal static partial class Interop
{
    internal static partial class Sys
    {
        [RuntimeImport("SystemNative_GetTimestampResolution")]
        internal static extern bool GetTimestampResolution(out long resolution);

        [RuntimeImport("SystemNative_GetTimestamp")]
        internal static extern bool GetTimestamp(out long timestamp);
    }
}
