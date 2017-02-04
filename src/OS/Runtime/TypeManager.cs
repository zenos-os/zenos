using System.Runtime.InteropServices;

namespace OS.Runtime
{
    [StructLayout(LayoutKind.Sequential)]
    public unsafe struct TypeManager
    {
        private ReadyToRunHeader* m_pHeader;
        private DispatchMap** m_pDispatchMapTable;

        public static TypeManager* New(ReadyToRunHeader* p)
        {
            var tm = (TypeManager*)Memory.Alloc(sizeof(TypeManager));
            tm->m_pHeader = p;
            tm->m_pDispatchMapTable = null;

            return tm;
        }

        public static void* GetModuleSection(TypeManager* pModule, ReadyToRunSectionType sectionId, int* length)
        {
            var pModuleInfoRows = (ModuleInfoRow*)(pModule->m_pHeader + 1);
            Screen.WriteLine("GetModuleSection");

            //// TODO: Binary search
            for (int i = 0; i < pModule->m_pHeader->NumberOfSections; i++)
            {
                var pCurrent = pModuleInfoRows[i];

                Screen.Write("Row: ");
                Screen.Write((uint)i);
                Screen.Write(", Id = ");
                Screen.Write((uint)pCurrent.SectionId);
                Screen.Write(", Length = ");
                Screen.Write((uint)pCurrent.Length);
                Screen.WriteLine();
                
                if ((int)sectionId == pCurrent.SectionId)
                {
                    *length = pCurrent.Length;
                    return pCurrent.Start;
                }
            }

            *length = 0;
            return null;
        }
    }
}