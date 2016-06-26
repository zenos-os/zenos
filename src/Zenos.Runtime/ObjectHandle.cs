using System.Runtime.InteropServices;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Sequential)]
    unsafe struct ObjectHandle
    {
        internal RuntimeObject* _handle;
    }
}