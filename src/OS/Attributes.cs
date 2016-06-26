namespace System.Runtime
{
    namespace InteropServices
    {
        // From https://github.com/dotnet/corert/blob/master/src/System.Private.Interop/src/InteropExtensions/NativeCallableAttribute.cs
        //BARTOK expects
        [AttributeUsage(AttributeTargets.Method)]
        public sealed class NativeCallableAttribute : Attribute
        {
            // Optional. If omitted, then the method is native callable, but no EAT is emitted.
            public string EntryPoint;
            // Optional. If omitted a default will be chosen by the compiler.
            public CallingConvention CallingConvention;
            public NativeCallableAttribute()
            {
            }
        }
    }
}