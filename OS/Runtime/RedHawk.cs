using System.Runtime;

namespace OS.Runtime
{
    public static partial class RedHawk {
        
        public static void SetError() {
          Screen.ForegroundColor = ConsoleColor.White;
          Screen.BackgroundColor = ConsoleColor.Red;
        }

        [RuntimeExport("Panic")]
        public static void Panic(int value)
        {
            SetError();
            Screen.Write("Err: ");
            Screen.Write(value);

            while (true) ;
        }

        private static void DisplayError(string message)
        {
            SetError();

            Screen.Write("Err: ");
            Screen.WriteLine(message);
        }
    }
}