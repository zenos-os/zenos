using System.Runtime.InteropServices;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Sequential)]
    unsafe class ObjectHandle
    {
        internal RuntimeObject _handle;
    }
}