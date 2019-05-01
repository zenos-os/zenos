using System;
using System.Runtime;
using System.Runtime.InteropServices;
using Internal.Runtime.CompilerServices;

namespace Zenos.Runtime
{
    public unsafe class RuntimeInstance
    {
        private static /* OsModuleEntry*/ void* _osModuleList;
        private static /* TypeManagerEntry */ void* _typeManagerList;

        public static bool Initialize()
        {
            _osModuleList = null;
            _typeManagerList = null;
            //
            //            CreateHolder<ThreadStore> pThreadStore = ThreadStore::Create(pRuntimeInstance);
            //            if (NULL == pThreadStore)
            //                return false;
            //
            //            pThreadStore.SuppressRelease();
            //            pRuntimeInstance.SuppressRelease();
            //
            //            pRuntimeInstance->m_pThreadStore = pThreadStore;
            //            pRuntimeInstance->m_hPalInstance = hPalInstance;
            //
            //            ASSERT_MSG(g_pTheRuntimeInstance == NULL, "multi-instances are not supported");

            return true;
        }

        [RuntimeExport("RhpCreateTypeManager")]
        public static TypeManagerHandle CreateTypeManager(IntPtr osModule, IntPtr moduleHeader, IntPtr* classLibFunctions, uint numClassLibFunctions)
        {
            ref var typeManager = ref TypeManager.Create(osModule, moduleHeader, classLibFunctions, numClassLibFunctions);

            RuntimeInstance.RegisterTypeManager(ref typeManager);

            return new TypeManagerHandle(ref typeManager);
        }

        public static bool RegisterTypeManager(ref TypeManager typeManager)
        {
            ref var entry = ref TypeManagerEntry.Create(ref typeManager);

            if (_typeManagerList == null)
            {
                _typeManagerList = Unsafe.AsPointer(ref entry);
            }
            else
            {
                TypeManagerEntry.PushHead(ref Unsafe.AsRef<TypeManagerEntry>(_typeManagerList), ref entry);
            }

            return true;
        }

        internal ref OsModuleEntry GetOsModuleList()
        {
            return ref Unsafe.AsRef<OsModuleEntry>(_osModuleList);
        }

        struct TypeManagerEntry
        {
            /*TypeManagerEntry*/
            void* _next;
            /*TypeManager*/
            void* _typeManager;

            public ref TypeManagerEntry Entry => ref Unsafe.AsRef<TypeManagerEntry>(_next);
            public ref TypeManager TypeManager => ref Unsafe.AsRef<TypeManager>(_typeManager);


            public static ref TypeManagerEntry Create(ref TypeManager typeManager)
            {
                ref var pEntry = ref Memory.Alloc<TypeManagerEntry>();
                pEntry._typeManager = Unsafe.AsPointer(ref typeManager);
                pEntry._next = null;

                return ref pEntry;
            }

            public static void PushHead(ref TypeManagerEntry current, ref TypeManagerEntry entry)
            {
                entry._next = Unsafe.AsPointer(ref current);
                current = entry;
            }
        }

        internal struct OsModuleEntry
        {
            public /*OsModuleEntry*/void* _next;
            public IntPtr _osModule;

            public static ref OsModuleEntry Create(IntPtr osModule)
            {
                ref var pEntry = ref Memory.Alloc<OsModuleEntry>();

                pEntry._osModule = osModule;
                pEntry._next = null;

                return ref pEntry;
            }

            public static void PushHead(ref OsModuleEntry current, ref OsModuleEntry entry)
            {
                entry._next = Unsafe.AsPointer(ref current);
                current = entry;
            }
        }

        [RuntimeExport("RhpRegisterOsModule")]
        public static IntPtr RhpRegisterOsModule(IntPtr osModule)
        {
            // TODO: register os module
            if (osModule == IntPtr.Zero)
                return IntPtr.Zero;

            ref var pEntry = ref Memory.Alloc<OsModuleEntry>();
            pEntry._osModule = osModule;
            pEntry._next = null;

            {
                //  ReaderWriterLock::WriteHolder write(&pRuntimeInstance->GetTypeManagerLock());

                if (_osModuleList == null)
                {
                    _osModuleList = Unsafe.AsPointer(ref pEntry);
                }
                else
                {
                    OsModuleEntry.PushHead(ref Unsafe.AsRef<OsModuleEntry>(_osModuleList), ref pEntry);
                }
            }

            return osModule; // Return non-null on success
        }


    }
}