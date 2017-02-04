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

        public int Length
        {
            get
            {
                if (HasEndPointer)
                {
                    return (int) ((long) End - (long) Start);
                }

                return sizeof(void*);
            }
        }

        public bool HasEndPointer => (Flags & (int)ModuleInfoFlags.HasEndPointer) == (int)ModuleInfoFlags.HasEndPointer;
    };
}