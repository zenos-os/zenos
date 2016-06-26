using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.CompilerServices;

#if CORERT
using Internal.Runtime.CompilerServices;
#endif


namespace OS.Data
{

    class AnimalList : ILowLevelList<AnimalList>
    {
        private int height;

        public int Height => height;
        public AnimalList Next { get; set; }
        public AnimalList Previous { get; set; }
    }

    /// <summary>
    /// Interface that indicates a ListHead type is the first item in the struct T
    /// </summary>
    /// <typeparam name="T"></typeparam>
    interface ILowLevelList<T> where T : class
    {
        T Next { get; set; }
        T Previous { get; set; }
    }
}
