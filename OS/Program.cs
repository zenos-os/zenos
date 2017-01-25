using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using static OS.Imports;

namespace OS
{
    static unsafe class Imports
    {
        [RuntimeImport("InitializeModules"), MethodImpl(MethodImplOptions.InternalCall)]
        public static extern void InitializeModules(IntPtr modules, int count);
    }

    class Program
    {

        static void Wait(int ms)
        {
            for (int i = 0; i < ms; i++)
            {
                WaitOneMilli();
            }
        }

        static void WaitOneMilli()
        {
            var x = 0L;
            for (int i = 0; i < 715827; i++)
            {
                x += i;
            }
        }
        
        static void Main()
        {
            // nice to haves:
            // static ctors
            // string support
            // new objects?

            Screen.Init();
            Screen.Clear();
            Wait(200);

            Screen.WriteLine(".NET WILL");
            Wait(500);

            DoInitModules();
            Wait(500);
            Screen.WriteLine("Lives");
            Wait(500);
            while (true) ;
        }

        static void DoInitModules()
        {
            InitializeModules(new IntPtr(0x017a000), 1);
        }
    }
}
