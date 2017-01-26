using System;
using System.Runtime.InteropServices;

namespace OS
{
    public static unsafe class MinimalRuntime
    {
        struct ReadyToRunHeaderConstants
        {
            public const uint Signature = 0x00525452; // 'RTR'

            public const uint CurrentMajorVersion = 2;
            public const uint CurrentMinorVersion = 1;
        };

        [NativeCallable(EntryPoint = "RhpCreateTypeManager")]
        public static void* CreateTypeManager(void* moduleHeader)
        {
            var pReadyToRunHeader = (ReadyToRunHeader*) moduleHeader;

            // Sanity check the signature magic
            if (pReadyToRunHeader->Signature != ReadyToRunHeaderConstants.Signature)
                return null;

            // Only the current major version is supported currently
            if (pReadyToRunHeader->MajorVersion != ReadyToRunHeaderConstants.CurrentMajorVersion)
                return null;

            return TypeManager.New(pReadyToRunHeader);
        }

        //RhpGetModuleSection, (TypeManager* pModule, Int32 headerId, Int32* length)
        [NativeCallable(EntryPoint = "RhpGetModuleSection")]
        public static void* RhpGetModuleSection(TypeManager* pModule, int headerId, int* length)
        {
            return TypeManager.GetModuleSection(pModule, (ReadyToRunSectionType) headerId, length);
        }

        //void* RhpGcAlloc(EEType *pEEType, UInt32 uFlags, UIntNative cbSize, void * pTransitionFrame)
        [NativeCallable(EntryPoint = "RhpGcAlloc")]
        public static void* RhpGcAlloc(void* pEEType, uint uFlags, long cbSize, void* pTransitionFrame)
        {
            return Memory.Alloc(cbSize);
        }
        
    }

    public enum ReadyToRunSectionType : int
    {
        StringTable = 200,
        GCStaticRegion = 201,
        ThreadStaticRegion = 202,
        InterfaceDispatchTable = 203,
        TypeManagerIndirection = 204,
        EagerCctor = 205,

        // Sections 300 - 399 are reserved for RhFindBlob backwards compatibility
        ReadonlyBlobRegionStart = 300,
        ReadonlyBlobRegionEnd = 399,
    }

    public enum ModuleInfoFlags : int
    {
        HasEndPointer = 0x1,
    }

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
                return (byte)@this->End - (byte)@this->Start;
            }

            return sizeof(void*);
        }

        public static bool HasEndPointer(ModuleInfoRow* @this)
        {
            return (@this->Flags & (int)ModuleInfoFlags.HasEndPointer) == (int)ModuleInfoFlags.HasEndPointer;
        }
    };

    [StructLayout(LayoutKind.Sequential)]
    struct DispatchMap { }
}