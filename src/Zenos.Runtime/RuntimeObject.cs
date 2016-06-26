using System.Runtime.InteropServices;
using Internal.Runtime;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Explicit)]
    unsafe struct RuntimeObject
    {
        [FieldOffset(AsmOffsets.OFFSETOF__Object__m_pEEType)]
        private EEType* _object;

        internal void SetEEType(EEType* obj)
        {
            _object = obj;
        }
    }
}