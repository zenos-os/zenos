using System;

namespace OS.Data
{
    public static unsafe class Poison
    {
        public const ulong PoisonPointerDelta = 0xdead000000000000;
    }
}
