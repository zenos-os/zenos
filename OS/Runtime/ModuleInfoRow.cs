using System.Runtime.InteropServices;

namespace OS.Runtime
{
    [StructLayout(LayoutKind.Sequential)]
    public unsafe struct ModuleInfoRow
    {
        public int SectionId;
        public int Flags;
        public void* Start;
        public void* End;

        public static int GetLength(ModuleInfoRow* @this)
        {
            if (HasEndPointer(@this))
            {
                return (int)((long)@this->End - (long)@this->Start);
            }

            return sizeof(void*);
        }

        public static bool HasEndPointer(ModuleInfoRow* @this)
        {
            return (@this->Flags & (int)ModuleInfoFlags.HasEndPointer) == (int)ModuleInfoFlags.HasEndPointer;
        }
    };
}