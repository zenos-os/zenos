using System;
using System.Diagnostics;

namespace Zenos.Runtime
{
    public struct TypeManagerHandle
    {
        private readonly IntPtr _handleValue;

        internal TypeManagerHandle(IntPtr handleValue)
        {
            _handleValue = handleValue;
        }

        internal unsafe TypeManagerHandle(TypeManager* typeManager)
        {
            var p = (long)(typeManager) + 1;
            
            _handleValue = new IntPtr(p);
        }

        public bool IsNull => _handleValue == IntPtr.Zero;

        public bool IsTypeManager
        {
            get
            {
                unsafe
                {
                    return (((int)(byte*)_handleValue) & 0x1) == 0x1;
                }
            }
        }

        private IntPtr AsOsModuleIntPtr
        {
            get
            {
                Debug.Assert(!IsTypeManager);
                return _handleValue;
            }
        }

        internal unsafe TypeManager* AsTypeManagerPtr
        {
            get
            {
                Debug.Assert(IsTypeManager);
                unsafe
                {
                    return (TypeManager*)(((byte*)(void*)_handleValue) - 1);
                }
            }
        }

        public static  implicit operator TypeManagerHandle(System.Runtime.TypeManagerHandle handle) => 
            new TypeManagerHandle(handle.GetIntPtrUNSAFE());
    }
}