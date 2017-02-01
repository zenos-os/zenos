using System.Runtime;
using System.Runtime.InteropServices;
using Internal.Runtime;

namespace OS.Runtime
{
    public static partial class RedHawk
    {
        private static int ErrorCount;
        public static void Init()
        {
            ErrorCount = 0;
        }

        public static void SetError() {
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
    }

    [StructLayout(LayoutKind.Sequential)]
    unsafe struct RuntimeObject
    {
        internal EEType* _EEType;
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