using System.Runtime;
using System.Runtime.CompilerServices;

namespace OS
{
    static class Native
    {
        [RuntimeImport("Out8"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void OutByte(ushort port, byte value);

        [RuntimeImport("Out16"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void OutUInt16(ushort port, ushort value);

        [RuntimeImport("Out32"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void OutUInt32(ushort port, uint value);

        [RuntimeImport("In8"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern byte InByte(ushort port);

        [RuntimeImport("In16"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern ushort InUInt16(ushort port);

        [RuntimeImport("In32"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern uint InUInt32(ushort port);
    }
}