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
            ModuleInfoRow* pModuleInfoRows = (ModuleInfoRow*)(pModule->m_pHeader + 1);

            //// TODO: Binary search
            for (int i = 0; i < pModule->m_pHeader->NumberOfSections; i++)
            {
                ModuleInfoRow* pCurrent = pModuleInfoRows + i;
                if ((int)sectionId == pCurrent->SectionId)
                {
                    *length = ModuleInfoRow.GetLength(pCurrent);
                    return pCurrent->Start;
                }
            }

            *length = 0;
            return null;
        }
    }
}