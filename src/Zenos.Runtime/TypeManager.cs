using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using Internal.Runtime;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Sequential)]
    public unsafe class TypeManager
    {
        private IntPtr _osModule;
        private ReadyToRunHeader* _header;
        private DispatchMap** _dispatchMapTable;

        private IntPtr* _classlibFunctions;
        private uint _numClasslibFunctions;

        public void* GetModuleSection(ReadyToRunSectionType sectionId, out int length)
        {
            var pModuleInfoRows = (ModuleInfoRow*)(_header + 1);

            Debug.Assert(_header->EntrySize == sizeof(ModuleInfoRow));

            var sectionCount = _header->NumberOfSections;

            // TODO this should be true, if not `this` must not be set properly
            Debug.Assert(sectionCount == 0x21);

            //// TODO: Binary search
            for (int i = 0; i < sectionCount; i++)
            {
                var pCurrent = pModuleInfoRows + i;

                if ((int)sectionId == pCurrent->SectionId)
                {
                    length = pCurrent->Length;
                    return pCurrent->Start;
                }
            }

            length = 0;
            return null;
        }

        public static TypeManager Create(in IntPtr osModule, in IntPtr moduleHeader, IntPtr* classLibFunctions, in uint numClassLibFunctions)
        {
            var pReadyToRunHeader = (ReadyToRunHeader*)moduleHeader;

            // Sanity check the signature magic
            if (pReadyToRunHeader->Signature != ReadyToRunHeaderConstants.Signature)
                return null;

            // Only the current major version is supported currently
            if (pReadyToRunHeader->MajorVersion != ReadyToRunHeaderConstants.CurrentMajorVersion)
                return null;

            var tm = Memory.AllocObject<TypeManager>();
            tm._osModule = osModule;
            tm._header = pReadyToRunHeader;
            tm._dispatchMapTable = null;
            tm._classlibFunctions = classLibFunctions;
            tm._numClasslibFunctions = numClassLibFunctions;

            // TODO initialize module sections
            //            int length;
            //            m_pStaticsGCDataSection = (UInt8*)GetModuleSection(ReadyToRunSectionType::GCStaticRegion, &length);
            //            m_pStaticsGCInfo = (StaticGcDesc*)GetModuleSection(ReadyToRunSectionType::GCStaticDesc, &length);
            //            m_pThreadStaticsDataSection = (UInt8*)GetModuleSection(ReadyToRunSectionType::ThreadStaticRegion, &length);
            //            m_pThreadStaticsGCInfo = (StaticGcDesc*)GetModuleSection(ReadyToRunSectionType::ThreadStaticGCDescRegion, &length);
            //            m_pTlsIndex = (UInt32*)GetModuleSection(ReadyToRunSectionType::ThreadStaticIndex, &length);
            //            m_pLoopHijackFlag = (UInt32*)GetModuleSection(ReadyToRunSectionType::LoopHijackFlag, &length);
            return tm;
        }
    }
}