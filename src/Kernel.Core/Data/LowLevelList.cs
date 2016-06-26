using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
#if CORERT
using Internal.Runtime.CompilerServices;
#endif


namespace OS.Data
{
    static class LowLevelList
    {

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static bool IsFirstOf<T>(this T list, T head) where T : class, ILowLevelList<T>
        {
            return list.Previous == head;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static bool IsLastOf<T>(this T self, T list) where T : class, ILowLevelList<T>
        {
            return self.Next == list;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static bool IsEmpty<T>(this T self) where T : class, ILowLevelList<T>
        {
            return self.Next == self;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Add<T>(this T self, T newItem) where T : class, ILowLevelList<T>
        {
            Add(newItem, self, self.Next);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void Add<T>(T newItem, T prev, T next) where T : class, ILowLevelList<T>
        {
            next.Previous = newItem;
            newItem.Next = next;
            newItem.Previous = prev;
            prev.Next = newItem;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void AddTail<T>(this T self, T newItem) where T : class, ILowLevelList<T>
        {
            Add(newItem, self.Previous, self);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Init<T>(this T self) where T : class, ILowLevelList<T>
        {
            self.Next = self;
            self.Previous = self;
        }

        /// <summary>
        /// Remove the item from the list and reinitialize it
        /// </summary>
        /// <param name="self"></param>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Reset<T>(this T self) where T : class, ILowLevelList<T>
        {
            DeleteEntry(self);
            Init(self);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void DeleteEntry<T>(this T self) where T : class, ILowLevelList<T>
        {
            DeleteEntry(self.Previous, self.Next);
        }
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void DeleteEntry<T>(T prev, T next) where T : class, ILowLevelList<T>
        {
            next.Previous = prev;
            prev.Next = next;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Delete<T>(this T self) where T : class, ILowLevelList<T>
        {
            DeleteEntry(self);
            self.Next = null;
            self.Previous = null;
        }
    }
}