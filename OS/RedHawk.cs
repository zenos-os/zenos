using System.Runtime;
using System.Runtime.InteropServices;

namespace OS
{
    public static class RedHawk {

        public static void SetError() {
          Screen.ForegroundColor = ConsoleColor.White;
          Screen.BackgroundColor = ConsoleColor.Red;
          Screen.Row += 1;
        }

        [RuntimeExport("Panic")]
        public static void Panic(int value)
        {
            SetError();
            Screen.Write("Err: ");
            Screen.Write(value);

            while (true) ;
        }

        private static void DisplayError(int a, char b, char c)
        {
            SetError();

            Screen.Write("Err: ");
            Screen.Write(a);
            Screen.Write(b);
            Screen.Write(c);
        }
    }
}