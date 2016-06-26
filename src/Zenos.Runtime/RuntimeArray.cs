using System.Runtime.InteropServices;
using Internal.Runtime;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Explicit)]
    unsafe struct RuntimeArray
    {
        [FieldOffset(AsmOffsets.OFFSETOF__Object__m_pEEType)]
        private EEType* _object;

        [FieldOffset(AsmOffsets.OFFSETOF__Array__m_Length)]
        private uint _length;

        internal void SetEEType(EEType* eeType)
        {
            _object = eeType;
        }

        internal void InitArrayLength(uint length)
        {
            _length = length;
        }
    }
}