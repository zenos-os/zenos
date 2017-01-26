using System.Runtime.InteropServices;

namespace OS
{
    public static class RedHawk {

        public static void SetError() {
          Screen.ForegroundColor = ConsoleColor.White;
          Screen.BackgroundColor = ConsoleColor.Red;
          Screen.Row += 1;
        }

        [NativeCallable(EntryPoint = "Panic")]
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

    public struct ReadyToRunHeader
    {
        public uint Signature;      // ReadyToRunHeaderConstants.Signature
        public ushort MajorVersion;
        public ushort MinorVersion;

        public uint Flags;

        public ushort NumberOfSections;
        public byte EntrySize;
        public byte EntryType;
    }
}