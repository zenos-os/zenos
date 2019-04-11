using System;
using System.Collections.Generic;
using System.Text;

namespace Microsoft.Win32.SafeHandles
{
    public sealed partial class SafeWaitHandle
    {
        protected override bool ReleaseHandle()
        {
            throw new NotImplementedException();
        }
    }
}
