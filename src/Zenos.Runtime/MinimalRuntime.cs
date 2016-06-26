using System;
using System.Diagnostics;
using System.Runtime;
using System.Runtime.InteropServices;
using Internal.Runtime;

namespace Zenos.Runtime
{
    public static unsafe class MinimalRuntime
    {
        [RuntimeExport("RhpPInvoke")]
        public static void RhpPInvoke()
        {
            // TODO
        }


        [RuntimeExport("RhpPInvokeReturn")] 
        public static void RhpPInvokeReturn()
        {
            // TODO
        }

        [RuntimeExport("PalGetTickCount64")]
        public static long PalGetTickCount64()
        {
            // TODO
            return 0;
        }

        [RuntimeExport("RhpGetModuleSection")]
        public static void* RhpGetModuleSection(TypeManagerHandle* pModule, int headerId, out int length)
        {
            return pModule->AsTypeManagerPtr->GetModuleSection((ReadyToRunSectionType)headerId, out length);
        }

        [RuntimeExport("RhpReversePInvoke2")]
        internal static unsafe void RhpReversePInvoke2(ref ReversePInvokeFrame frame)
        {
        }

        [RuntimeExport("RhpReversePInvokeReturn2")]
        internal static unsafe void RhpReversePInvokeReturn2(ref ReversePInvokeFrame frame)
        {
        }

        ////void* RhpGcAlloc(EEType *pEEType, UInt32 uFlags, UIntNative cbSize, void * pTransitionFrame)
        ////[RuntimeExport("RhpGcAlloc")]
        //        [RuntimeExport("RhpGcAlloc")]
        //        internal static void* RhpGcAlloc(RawEEType* pEEType, uint uFlags, long cbSize, void* pTransitionFrame)
        //        {
        //            return Memory.Alloc(cbSize);
        //        }
        [RuntimeExport("RhpAssignRef")]
        public static void RhpAssignRef(void** dst, void* @ref)
        {
            *dst = @ref;
            // InlineCheckedWriteBarrier(dst, ref);
        }


        [RuntimeExport("RhpNewFast")]
        internal static void* RhpNewFast(EEType* pEEType)
        {
            var size = pEEType->BaseSize;
            var obj = (RuntimeObject*)Memory.Alloc(size);
            obj->SetEEType(pEEType);

            return obj;
        }


        [RuntimeExport("RhpNewArray")]
        internal static unsafe RuntimeArray* RhpNewArray(EEType* pArrayEEType, int numElements)
        {
            var size = pArrayEEType->BaseSize + (numElements * pArrayEEType->ComponentSize);
            size = AlignUp(size, IntPtr.Size);
            var array = (RuntimeArray*)Memory.Alloc(size);
            array->SetEEType(pArrayEEType);
            array->InitArrayLength((uint)numElements);

            return array;
        }

        [RuntimeExport("RhNewString")]
        internal static unsafe RuntimeArray* RhNewString(EEType* pArrayEEType, int numElements)
        {
            return RhpNewArray(pArrayEEType, numElements);
        }

        private static long AlignUp(long val, long alignment)
        {
            return (val + (alignment - 1)) & ~(alignment - 1);
        }

        //private const int GC_ALLOC_FINALIZE = 0x1;
        //private const int RH_LARGE_OBJECT_SIZE = 85000;

        [RuntimeExport("RhpNewFinalizable")]
        internal static void* RhpNewFinalizable(EEType* pEEType)
        {
            Debug.Assert(!pEEType->RequiresAlign8);
            Debug.Assert(pEEType->IsFinalizable);

            var size = pEEType->BaseSize;
//            var obj = (RuntimeObject*)RhpGcAlloc(pEEType, GC_ALLOC_FINALIZE, size, NULL);
            var obj = (RuntimeObject*)Memory.Alloc(size);
            obj->SetEEType(pEEType);
//
//            if (size >= RH_LARGE_OBJECT_SIZE)
//                RhpPublishObject(pObject, size);



            return obj;
        }

        [RuntimeExport("RhpHandleAlloc")]
        internal static unsafe ObjectHandle* RhpHandleAlloc(RuntimeObject* obj, int type)
        {
            var handle = Memory.Alloc<ObjectHandle>();
            handle->_handle = obj;
            return handle;
        }
    }
}