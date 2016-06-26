using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using OS.Runtime;
using Zenos.Runtime;

namespace OS
{
    public static class Program
    {
        public static void Main()
        {
            // fake entry point for now or the optimizer will remove it
            EntryPoint(IntPtr.Zero, 0, 0);
        }

        private static void Wait(int ms)
        {
            for (int i = 0; i < ms; i++)
            {
                WaitOneMilli();
            }
        }

        private static void WaitOneMilli()
        {
            var x = 0L;
            for (int i = 0; i < 715827; i++)
            {
                x += i;
            }
        }

        public static void EntryPoint(IntPtr modules, int count, long heapBase)
        {
            // nice to haves:
            // static ctors
            // string support
            // new objects?
            Screen.Init();      
            
            Kernel.Initialize(modules, count, heapBase);

            Screen.Clear();
            Screen.ForegroundColor = ConsoleColor.White;
            Screen.BackgroundColor = ConsoleColor.Black;

            var net = ".NET";
            Screen.WriteLine(net);

            Wait(100);

            Screen.WriteLine("Lives");
            Wait(100);

            //TODO this doesn't work: var str = FormatProvider.FormatInt32(123456, null, null);
            Screen.WriteLine(string.Concat("a", net));

            var taco = new Taco(25);
            Screen.Write((uint)taco.Meat);
            Screen.WriteLine();

            Wait(500);

            //Screen.WriteLine(Run());

            var serial = new Serial(0x3f8);
            serial.Write('a');
            serial.Write('b');
            serial.Write('c');

            Screen.WriteLine("Halting");
            while (true) ;
        }

        private static string Run()
        {
            var result = "";
            for (int i = 0; i < 10; i++)
            {
                result += i;
            }

            return result;
        }
    }

    internal class Taco
    {
        public int Meat { get; private set; }

        public Taco(int meat)
        {
            Meat = meat;
        }
    }
}