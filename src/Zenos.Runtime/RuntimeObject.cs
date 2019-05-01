using System.Runtime.InteropServices;
using Internal.Runtime;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Explicit)]
    struct RuntimeObject
    {
        [FieldOffset(AsmOffsets.OFFSETOF__Object__m_pEEType)]
        private unsafe EEType* _object;

        internal unsafe void SetEEType(EEType* obj)
        {
            _object = obj;
        }
    }
}