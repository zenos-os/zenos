using System;
using System.Runtime;
using System.Runtime.InteropServices;
using Internal.Runtime;
using OS.Runtime;
using ReadyToRunHeader = OS.Runtime.ReadyToRunHeader;
using ReadyToRunSectionType = OS.Runtime.ReadyToRunSectionType;

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
        //[NativeCallable(EntryPoint = "RhpGcAlloc")]
        [RuntimeExport("RhpGcAlloc")]
        public static void* RhpGcAlloc(void* pEEType, uint uFlags, long cbSize, void* pTransitionFrame)
        {
            return Memory.Alloc(cbSize);
        }

        [RuntimeExport("RhpRegisterFrozenSegment")]
        public static bool RhpRegisterFrozenSegment(IntPtr pSegmentStart, int length)
        {
            return RedHawkGCInterface.RhpRegisterFrozenSegment(pSegmentStart, length);
        }

        [RuntimeExport("RhpNewFast")]
        internal static unsafe RuntimeObject* RhpNewFast(EEType* pEEType)
        {
            var size = pEEType->BaseSize;
            var obj = (RuntimeObject*)Memory.Alloc(size);
            obj->_EEType = pEEType;
            
            return obj;
        }
    }

    static class RedHawkGCInterface
    {

        public static /*GcSegmentHandle*/ bool RhpRegisterFrozenSegment(IntPtr pSegmentStart, int length)
        {
            return true;
        }
    }
}