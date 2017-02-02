using System;
using System.Runtime;
using System.Runtime.InteropServices;
using Internal.Runtime;
using static OS.MinimalRuntime;

namespace OS.Runtime
{
    public static partial class RedHawk
    {
        private static int ErrorCount;

        public static void Init()
        {
            ErrorCount = 0;
        }

        public static void SetError()
        {
            Screen.ForegroundColor = ConsoleColor.White;
            Screen.BackgroundColor = ConsoleColor.Red;
        }

        [RuntimeExport("Panic")]
        public static void Panic(string message)
        {
            SetError();
            Screen.WriteLine(message);

            while (true) ;
        }

        private static void DisplayErrorInfo(string message)
        {
            SetError();

            Screen.Write("Err: ");
            Screen.WriteLine(message);
            Wait(500);
        }


        static void Wait(int ms)
        {
            for (int i = 0; i < ms; i++)
            {
                WaitOneMilli();
            }
        }

        static void WaitOneMilli()
        {
            var x = 0L;
            for (int i = 0; i < 715827; i++)
            {
                x += i;
            }
        }

        private static void DisplayError(string message)
        {
            DisplayErrorInfo(message);

            ErrorCount++;

            if (ErrorCount > 8)
            {
                Panic("Halted.");
            }
        }


        [RuntimeExport("RhpReversePInvoke2")]
        internal static unsafe void RhpReversePInvoke2(ReversePInvokeFrame* frame)
        {
            //TODO: set the frame's thread to the current thread
            //DisplayErrorInfo("RhpReversePInvoke2");
            //Screen.Write("m_savedPInvokeTransitionFrame: ");
            //Screen.Write((uint)frame->m_savedPInvokeTransitionFrame);
            //Screen.WriteLine();

            //Screen.Write("m_savedThread: ");
            //Screen.Write((uint)frame->m_savedThread);
            //Screen.WriteLine();
        }

        [RuntimeExport("RhpReversePInvokeReturn2")]
        public static void RhpReversePInvokeReturn2()
        {
            //DisplayError("RhpReversePInvokeReturn2");
        }

        [RuntimeExport("RhpAssignRef")]
        internal static unsafe void RhpAssignRef(RuntimeObject** dst, RuntimeObject* src)
        {
            *dst = src;
            //InlineWriteBarrier(dst, src);
        }

        [RuntimeExport("RhpNewArray")]
        internal static unsafe void* RhpNewArray(EEType* pArrayEEType, int numElements)
        {
            var size = pArrayEEType->BaseSize + (numElements*pArrayEEType->ComponentSize);
            size = AlignUp(size, IntPtr.Size);
            var array = (RuntimeArray*)Memory.Alloc(size);
            array->_object.SetEEType(pArrayEEType);
            array->_length = (uint)numElements;

            return array;
        }

        private const int GC_ALLOC_FINALIZE = 0x1;
        private const int RH_LARGE_OBJECT_SIZE = 85000;

        [RuntimeExport("RhpNewFinalizable")]
        internal static unsafe RuntimeObject* RhpNewFinalizable(EEType* pEEType)
        {
            var size = pEEType->BaseSize;

            var obj = (RuntimeObject*) RhpGcAlloc(pEEType, GC_ALLOC_FINALIZE, size, null);
            obj->SetEEType(pEEType);
            if (size >= RH_LARGE_OBJECT_SIZE)
                RhpPublishObject(obj, size);

            return obj;
        }

        private static long AlignUp(long val, long alignment)
        {
            return (val + (alignment - 1)) & ~(alignment - 1);
        }

    }

    [StructLayout(LayoutKind.Sequential)]
    unsafe struct RuntimeObject
    {
        private EEType* _EEType;

        public void SetEEType(EEType* type)
        {
            _EEType = type;
        }
    }

    [StructLayout(LayoutKind.Sequential)]
    unsafe struct RuntimeArray
    {
        internal RuntimeObject _object;
        internal uint _length;
    }

    [StructLayout(LayoutKind.Sequential)]
    unsafe struct ObjectHandle
    {
        internal void* _handle;
    }


    unsafe struct ReversePInvokeFrame
    {
        public void* m_savedPInvokeTransitionFrame;
        public Thread* m_savedThread;
    };

    struct Thread
    {
        public ThreadBuffer threadBuffer;
    }

    struct ThreadBuffer
    {
        
    }
}