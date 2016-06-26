using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace System.Globalization
{
    public partial class TextInfo
    {
        private Tristate _needsTurkishCasing = Tristate.NotInitialized;

        private void FinishInitialization() { }

        // -----------------------------
        // ---- PAL layer ends here ----
        // -----------------------------

        private bool NeedsTurkishCasing(string localeName)
        {
            Debug.Assert(localeName != null);

            return CultureInfo.GetCultureInfo(localeName).CompareInfo.Compare("\u0131", "I", CompareOptions.IgnoreCase) == 0;
        }

        private bool IsInvariant { get { return _cultureName.Length == 0; } }

        internal unsafe void ChangeCase(char* src, int srcLen, char* dstBuffer, int dstBufferCapacity, bool bToUpper)
        {
            throw new NotImplementedException();
//            Debug.Assert(!GlobalizationMode.Invariant);
//
//            if (IsInvariant)
//            {
//                Interop.Globalization.ChangeCaseInvariant(src, srcLen, dstBuffer, dstBufferCapacity, bToUpper);
//            }
//            else
//            {
//                if (_needsTurkishCasing == Tristate.NotInitialized)
//                {
//                    _needsTurkishCasing = NeedsTurkishCasing(_textInfoName) ? Tristate.True : Tristate.False;
//                }
//                if (_needsTurkishCasing == Tristate.True)
//                {
//                    Interop.Globalization.ChangeCaseTurkish(src, srcLen, dstBuffer, dstBufferCapacity, bToUpper);
//                }
//                else
//                {
//                    Interop.Globalization.ChangeCase(src, srcLen, dstBuffer, dstBufferCapacity, bToUpper);
//                }
//            }
        }
    }
}
