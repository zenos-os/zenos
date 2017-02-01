namespace System.Runtime
{
    //Runtime exports are very sensitive and do not use RhpReversePInvoke2 and RhpReversePInvokeReturn2

    [AttributeUsage(AttributeTargets.Method, Inherited = false)]
    internal sealed class RuntimeExportAttribute : Attribute
    {
        public string EntryPoint;

        public RuntimeExportAttribute(string entry)
        {
            EntryPoint = entry;
        }
    }
}