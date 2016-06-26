namespace Zenos.Runtime
{
    public static unsafe class Memory
    {
        private static long _heapBase;

        public static void Init(long heapBase)
        {
            _heapBase = heapBase;
        }

        public static T* Alloc<T>() where T : unmanaged
        {
            return (T*) Alloc(sizeof(T));
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