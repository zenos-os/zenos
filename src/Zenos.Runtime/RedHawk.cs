using System.Runtime;
using System.Runtime.InteropServices;

namespace Zenos.Runtime
{
    public static partial class RedHawk
    {
        private static int ErrorCount;
        private const int MaxErrorCount = 3;

        public static void Initialize()
        {
            ErrorCount = 0;
        }

        public static void SetError()
        {
            Screen.ForegroundColor = ConsoleColor.White;
            Screen.BackgroundColor = ConsoleColor.Red;
        }

        [RuntimeExport("Panic")]
        public static void Panic(string message)
        {
            SetError();
            Screen.WriteLine(message);

            while (true)
            {
                WaitOneMilli();
            }
        }

        private static void DisplayErrorInfo(string message)
        {
            var currForeground = Screen.ForegroundColor;
            var currBackground = Screen.BackgroundColor;

            SetError();

            Screen.Write("Err: ");
            Screen.WriteLine(message);
            Wait(500);
            
            Screen.ForegroundColor = currForeground;
            Screen.BackgroundColor = currBackground;
        }

        public static void Wait(int ms)
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

        public static void DisplayError(string message)
        {
            DisplayErrorInfo(message);

            ErrorCount++;

            if (ErrorCount >= MaxErrorCount)
            {
                Panic("Halted.");
            }
        }
    }

}