using System;
using System.Runtime;
using System.Runtime.CompilerServices;
using OS.Runtime;
using Zenos.Runtime;
using static Zenos.Runtime.RedHawk;
using RedHawk = Zenos.Runtime.RedHawk;

namespace OS
{
    class Kernel
    {
        [RuntimeImport("InitializeModules"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void InitializeModules(IntPtr osModule, IntPtr pModuleHeaders, int count, IntPtr pClasslibFunctions,
                int nClasslibFunctions);

        public static void Initialize(IntPtr modules, int count, long heapBase)
        {
            Memory.Init(heapBase);
            Screen.Init();
            Screen.Clear();
            Screen.WriteLine("Screen initialized");

            RedHawk.Initialize();
            Screen.WriteLine("RedHawk initialized");

            if (!RuntimeInstance.Initialize())
            {
                Panic("RuntimeInstance could not be initialized");
                return;
            }
            Screen.WriteLine("RuntimeInstance initialized");

            InitializeModules(IntPtr.Zero, modules, count, IntPtr.Zero, 0);
            Screen.WriteLine("Modules initialized");
        }
    }
}