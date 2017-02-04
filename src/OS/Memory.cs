namespace OS
{
    public unsafe static class Memory
    {
        private static long _heapBase;

        public static void Init(long heapBase)
        {
            _heapBase = heapBase;
        }

        public static void* Alloc(long size)
        {
            var pos = (void*)_heapBase;
            _heapBase = _heapBase + size;
            return pos;
        }

        public static void* Alloc(int size)
        {
            var pos = (void*)_heapBase;
            _heapBase = _heapBase + size;
            return pos;
        }
    }
}