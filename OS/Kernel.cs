using System;
using System.Runtime;
using System.Runtime.CompilerServices;
using OS.Runtime;

namespace OS
{
    class Kernel
    {
        [RuntimeImport("InitializeModules"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void InitializeModules(IntPtr modules, int count);

        public static void Start(IntPtr modules, int count, long heapBase)
        {
            Memory.Init(heapBase);

            InitializeModules(modules, count);

            RedHawk.Init();
            Screen.Init();
            Screen.Clear();
        }
    }
}