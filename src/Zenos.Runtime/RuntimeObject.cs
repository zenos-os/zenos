using System.Runtime.InteropServices;
using Internal.Runtime;

namespace Zenos.Runtime
{
    [StructLayout(LayoutKind.Explicit)]
    class RuntimeObject
    {
        [FieldOffset(AsmOffsets.OFFSETOF__Object__m_pEEType)]
        private EEType _object;

        internal void SetEEType(in EEType obj)
        {
            _object = obj;
        }
    }
}