using Internal.Runtime.CompilerServices;

namespace Zenos.Runtime
{
    public static unsafe class Memory
    {
        private static long _heapBase;

        public static void Init(long heapBase)
        {
            _heapBase = heapBase;
        }

        public static T AllocObject<T>() where T : class
        {
            var size = Unsafe.SizeOf<T>();
            return AllocObject<T>(size);
        }

        public static T AllocObject<T>(int size) where T : class
        {
            var mem = Alloc(size);

            return Unsafe.AsRef<T>(mem);
        }

        public static ref T Alloc<T>() where T : unmanaged
        {
            return ref Unsafe.AsRef<T>(Alloc(sizeof(T)));
        }

        public static void* Alloc(long size)
        {
            var pos = (void*)_heapBase;
            _heapBase = _heapBase + size;
            return pos;
        }

        public static void* Alloc(uint size)
        {
            var pos = (void*)_heapBase;
            _heapBase += size;
            return pos;
        }
    }
}