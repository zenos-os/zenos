using System;
using System.Runtime;
using System.Runtime.InteropServices;

namespace Zenos.Runtime
{
    public unsafe class RuntimeInstance
    {
        static RuntimeInstance _instance;

        private OsModuleEntry _osModuleList;
        private TypeManagerEntry _typeManagerList;

        public static bool Initialize()
        {
            var pRuntimeInstance = Memory.AllocObject<RuntimeInstance>();
            if (pRuntimeInstance == null)
                return false;

            pRuntimeInstance._osModuleList = null;
            pRuntimeInstance._typeManagerList = null;
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
            _instance = pRuntimeInstance;

            return true;
        }

        [RuntimeExport("RhpCreateTypeManager")]
        public static TypeManagerHandle CreateTypeManager(IntPtr osModule, IntPtr moduleHeader, IntPtr* classLibFunctions, uint numClassLibFunctions)
        {
            var typeManager = TypeManager.Create(osModule, moduleHeader, classLibFunctions, numClassLibFunctions);

            GetRuntimeInstance().RegisterTypeManager(typeManager);

            return new TypeManagerHandle(typeManager);
        }

        public bool RegisterTypeManager(in TypeManager typeManager)
        {
            var entry = TypeManagerEntry.Create(typeManager);
            if (entry == null)
            {
                return false;
            }

            TypeManagerEntry.PushHead(ref _typeManagerList, entry);

            return true;
        }

        internal OsModuleEntry GetOsModuleList()
        {
            return _osModuleList;
        }

        class TypeManagerEntry
        {
            public TypeManagerEntry _next;
            public TypeManager _typeManager;

            public static TypeManagerEntry Create(in TypeManager typeManager)
            {
                var pEntry = Memory.AllocObject<TypeManagerEntry>();
                if (pEntry == null)
                    return null;

                pEntry._typeManager = typeManager;

                return pEntry;
            }

            public static void PushHead(ref TypeManagerEntry current, TypeManagerEntry entry)
            {
                if (current == null)
                {
                    current = entry;
                    return;
                }

                entry._next = current;
                current = entry;
            }
        }

        internal class OsModuleEntry
        {
            public OsModuleEntry _next;
            public IntPtr _osModule;

            public static OsModuleEntry Create(IntPtr osModule)
            {
                var pEntry = Memory.AllocObject<OsModuleEntry>();
                if (pEntry == null)
                    return null;

                pEntry._osModule = osModule;

                return pEntry;
            }

            public static void PushHead(ref OsModuleEntry current, OsModuleEntry entry)
            {
                if (current == null)
                {
                    current = entry;
                    return;
                }

                entry._next = current;
                current = entry;
            }
        }

        public static RuntimeInstance GetRuntimeInstance()
        {
            return _instance;
        }

        [RuntimeExport("RhpRegisterOsModule")]
        public static unsafe IntPtr RhpRegisterOsModule(IntPtr osModule)
        {
            // TODO: register os module

            var pEntry = Memory.AllocObject<OsModuleEntry>();
            if (pEntry == null)
                return IntPtr.Zero;

            pEntry._osModule = osModule;

            {
                RuntimeInstance pRuntimeInstance = GetRuntimeInstance();
                //                ReaderWriterLock::WriteHolder write(&pRuntimeInstance->GetTypeManagerLock());

                OsModuleEntry.PushHead(ref pRuntimeInstance._osModuleList, pEntry);
            }

            return osModule; // Return non-null on success
        }


    }
}