using System;
using System.Runtime;
using System.Runtime.CompilerServices;

namespace OS
{
    static class RuntimeImports
    {
        [RuntimeImport("InitializeModules"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void InitializeModules(IntPtr modules, int count);
    }
}