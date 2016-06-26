using System;
using System.Runtime;
using System.Runtime.InteropServices;
using static Zenos.Runtime.MinimalRuntime;

namespace Zenos.Runtime
{
    public static partial class ThreadStorage
    {
        private static unsafe ObjectHandle*[] m_pThreadLocalModuleStatics;
        private static uint m_numThreadLocalModuleStatics;

        [RuntimeExport("RhGetThreadStaticStorageForModule")]
        internal static unsafe RuntimeObject* RhGetThreadStaticStorageForModule(int moduleIndex)
        {
            // Return a pointer to the TLS storage if it has already been
            // allocated for the specified module.
            if (moduleIndex < m_numThreadLocalModuleStatics)
            {
                return m_pThreadLocalModuleStatics[moduleIndex]->_handle;
            }

            return null;
        }

        [RuntimeExport("RhSetThreadStaticStorageForModule")]
        internal static unsafe bool RhSetThreadStaticStorageForModule(RuntimeObject* pStorage, UInt32 moduleIndex)
        {
            // Grow thread local storage if needed.
            if (m_numThreadLocalModuleStatics <= moduleIndex)
            {
                UInt32 newSize = moduleIndex + 1;
                if (newSize < moduleIndex)
                {
                    return false;
                }

                var pThreadLocalModuleStatics = new ObjectHandle*[newSize];

                //TODO: memset(&pThreadLocalModuleStatics[m_numThreadLocalModuleStatics], 0, sizeof(RuntimeObject*) * (newSize - m_numThreadLocalModuleStatics));

                if (m_pThreadLocalModuleStatics != null)
                {
                    //TODO: memcpy(pThreadLocalModuleStatics, m_pThreadLocalModuleStatics, sizeof(void*) * m_numThreadLocalModuleStatics);
                    //delete[] m_pThreadLocalModuleStatics;
                }

                m_pThreadLocalModuleStatics = pThreadLocalModuleStatics;
                m_numThreadLocalModuleStatics = newSize;
            }

            var threadStaticsStorageHandle = RhpHandleAlloc(pStorage, 2 /* Normal */);
            if (threadStaticsStorageHandle == null)
            {
                return false;
            }

            // Free the existing storage before assigning a new one
            if (m_pThreadLocalModuleStatics[moduleIndex] != null)
            {
                //TODO: RhHandleFree(m_pThreadLocalModuleStatics[moduleIndex]);
            }

            m_pThreadLocalModuleStatics[moduleIndex] = threadStaticsStorageHandle;
            return true;
        }
    }
}