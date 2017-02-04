using System.Runtime;

namespace OS.Runtime
{
    public static partial class RedHawk
    {
        [RuntimeExport("__fail_fast")]
        public static void __fail_fast()
        {
            DisplayError("__fail_fast");
        }

        [RuntimeExport("__not_yet_implemented")]
        public static void __not_yet_implemented()
        {
            DisplayError("__not_yet_implemented");
        }

        [RuntimeExport("_ecvt_s")]
        public static void _ecvt_s()
        {
            DisplayError("_ecvt_s");
        }

        [RuntimeExport("CloseHandle")]
        public static void CloseHandle()
        {
            DisplayError("CloseHandle");
        }

        [RuntimeExport("CoCreateGuid")]
        public static void CoCreateGuid()
        {
            DisplayError("CoCreateGuid");
        }

        [RuntimeExport("CoGetApartmentType")]
        public static void CoGetApartmentType()
        {
            DisplayError("CoGetApartmentType");
        }

        [RuntimeExport("CompareStringEx")]
        public static void CompareStringEx()
        {
            DisplayError("CompareStringEx");
        }

        [RuntimeExport("CompareStringOrdinal")]
        public static void CompareStringOrdinal()
        {
            DisplayError("CompareStringOrdinal");
        }

        [RuntimeExport("CreateEventExW")]
        public static void CreateEventExW()
        {
            DisplayError("CreateEventExW");
        }

        [RuntimeExport("EnumCalendarInfoExEx")]
        public static void EnumCalendarInfoExEx()
        {
            DisplayError("EnumCalendarInfoExEx");
        }

        [RuntimeExport("EnumTimeFormatsEx")]
        public static void EnumTimeFormatsEx()
        {
            DisplayError("EnumTimeFormatsEx");
        }

        [RuntimeExport("floor")]
        public static void floor()
        {
            DisplayError("floor");
        }

        [RuntimeExport("fmod")]
        public static void fmod()
        {
            DisplayError("fmod");
        }

        [RuntimeExport("GetCalendarInfoEx")]
        public static void GetCalendarInfoEx()
        {
            DisplayError("GetCalendarInfoEx");
        }

        [RuntimeExport("GetCurrentThreadId")]
        public static void GetCurrentThreadId()
        {
            DisplayError("GetCurrentThreadId");
        }

        [RuntimeExport("GetLastError")]
        public static void GetLastError()
        {
            DisplayError("GetLastError");
        }

        [RuntimeExport("GetLocaleInfoEx")]
        public static void GetLocaleInfoEx()
        {
            DisplayError("GetLocaleInfoEx");
        }

        [RuntimeExport("GetNativeSystemInfo")]
        public static void GetNativeSystemInfo()
        {
            DisplayError("GetNativeSystemInfo");
        }

        [RuntimeExport("GetProcessHeap")]
        public static void GetProcessHeap()
        {
            DisplayError("GetProcessHeap");
        }

        [RuntimeExport("GetTickCount64")]
        public static void GetTickCount64()
        {
            DisplayError("GetTickCount64");
        }

        [RuntimeExport("HeapAlloc")]
        public static void HeapAlloc()
        {
            DisplayError("HeapAlloc");
        }

        [RuntimeExport("IsDebuggerPresent")]
        public static void IsDebuggerPresent()
        {
            DisplayError("IsDebuggerPresent");
        }

        [RuntimeExport("LCMapStringEx")]
        public static void LCMapStringEx()
        {
            DisplayError("LCMapStringEx");
        }

        [RuntimeExport("memcpy")]
        public static void memcpy()
        {
            DisplayError("memcpy");
        }

        [RuntimeExport("memmove")]
        public static void memmove()
        {
            DisplayError("memmove");
        }

        [RuntimeExport("memset")]
        public static unsafe void* memset(void* dest, int val, uint size)
        {
            DisplayError("memset");
            return null;
        }

        [RuntimeExport("OutputDebugStringW")]
        public static void OutputDebugStringW()
        {
            DisplayError("OutputDebugStringW");
        }

        [RuntimeExport("PalGetTickCount64")]
        public static void PalGetTickCount64()
        {
            DisplayError("PalGetTickCount64");
        }

        [RuntimeExport("RaiseFailFastException")]
        public static void RaiseFailFastException()
        {
            DisplayError("RaiseFailFastException");
        }

        [RuntimeExport("ResolveLocaleName")]
        public static void ResolveLocaleName()
        {
            DisplayError("ResolveLocaleName");
        }

        [RuntimeExport("RhCompatibleReentrantWaitAny")]
        public static void RhCompatibleReentrantWaitAny()
        {
            DisplayError("RhCompatibleReentrantWaitAny");
        }

        [RuntimeExport("RhFindMethodStartAddress")]
        public static void RhFindMethodStartAddress()
        {
            DisplayError("RhFindMethodStartAddress");
        }

        [RuntimeExport("RhGetCodeTarget")]
        public static void RhGetCodeTarget()
        {
            DisplayError("RhGetCodeTarget");
        }

        [RuntimeExport("RhGetExceptionsForCurrentThread")]
        public static void RhGetExceptionsForCurrentThread()
        {
            DisplayError("RhGetExceptionsForCurrentThread");
        }

        [RuntimeExport("RhGetGenericInstantiation")]
        public static void RhGetGenericInstantiation()
        {
            DisplayError("RhGetGenericInstantiation");
        }

        [RuntimeExport("RhGetModuleFileName")]
        public static void RhGetModuleFileName()
        {
            DisplayError("RhGetModuleFileName");
        }

        [RuntimeExport("RhGetModuleFromEEType")]
        public static void RhGetModuleFromEEType()
        {
            DisplayError("RhGetModuleFromEEType");
        }

        [RuntimeExport("RhGetModuleFromPointer")]
        public static void RhGetModuleFromPointer()
        {
            DisplayError("RhGetModuleFromPointer");
        }

        [RuntimeExport("RhGetThreadLocalStorageForDynamicType")]
        public static void RhGetThreadLocalStorageForDynamicType()
        {
            DisplayError("RhGetThreadLocalStorageForDynamicType");
        }

        [RuntimeExport("RhHandleFree")]
        public static void RhHandleFree()
        {
            DisplayError("RhHandleFree");
        }

        [RuntimeExport("RhHandleGet")]
        public static void RhHandleGet()
        {
            DisplayError("RhHandleGet");
        }

        [RuntimeExport("RhHandleGetDependent")]
        public static void RhHandleGetDependent()
        {
            DisplayError("RhHandleGetDependent");
        }

        [RuntimeExport("RhHandleSet")]
        public static void RhHandleSet()
        {
            DisplayError("RhHandleSet");
        }

        [RuntimeExport("RhpAcquireCastCacheLock")]
        public static void RhpAcquireCastCacheLock()
        {
            DisplayError("RhpAcquireCastCacheLock");
        }

        [RuntimeExport("RhpArrayCopy")]
        public static void RhpArrayCopy()
        {
            DisplayError("RhpArrayCopy");
        }

        [RuntimeExport("RhpBox")]
        public static void RhpBox()
        {
            DisplayError("RhpBox");
        }

        [RuntimeExport("RhpByRefAssignRef")]
        public static void RhpByRefAssignRef()
        {
            DisplayError("RhpByRefAssignRef");
        }

        [RuntimeExport("RhpCallCatchFunclet")]
        public static void RhpCallCatchFunclet()
        {
            DisplayError("RhpCallCatchFunclet");
        }

        [RuntimeExport("RhpCallFilterFunclet")]
        public static void RhpCallFilterFunclet()
        {
            DisplayError("RhpCallFilterFunclet");
        }

        [RuntimeExport("RhpCallFinallyFunclet")]
        public static void RhpCallFinallyFunclet()
        {
            DisplayError("RhpCallFinallyFunclet");
        }

        [RuntimeExport("RhpCheckedAssignRef")]
        public static void RhpCheckedAssignRef()
        {
            DisplayError("RhpCheckedAssignRef");
        }

        [RuntimeExport("RhpCheckedLockCmpXchg")]
        public static void RhpCheckedLockCmpXchg()
        {
            DisplayError("RhpCheckedLockCmpXchg");
        }

        [RuntimeExport("RhpCheckedXchg")]
        public static void RhpCheckedXchg()
        {
            DisplayError("RhpCheckedXchg");
        }

        [RuntimeExport("RhpCollect")]
        public static void RhpCollect()
        {
            DisplayError("RhpCollect");
        }

        [RuntimeExport("RhpCopyContextFromExInfo")]
        public static void RhpCopyContextFromExInfo()
        {
            DisplayError("RhpCopyContextFromExInfo");
        }

        [RuntimeExport("RhpCopyObjectContents")]
        public static void RhpCopyObjectContents()
        {
            DisplayError("RhpCopyObjectContents");
        }

        [RuntimeExport("RhpCreateModuleManager")]
        public static void RhpCreateModuleManager()
        {
            DisplayError("RhpCreateModuleManager");
        }

        [RuntimeExport("RhpDbl2ULng")]
        public static void RhpDbl2ULng()
        {
            DisplayError("RhpDbl2ULng");
        }

        [RuntimeExport("RhpEHEnumInitFromStackFrameIterator")]
        public static void RhpEHEnumInitFromStackFrameIterator()
        {
            DisplayError("RhpEHEnumInitFromStackFrameIterator");
        }

        [RuntimeExport("RhpEHEnumNext")]
        public static void RhpEHEnumNext()
        {
            DisplayError("RhpEHEnumNext");
        }

        [RuntimeExport("RhpEtwExceptionThrown")]
        public static void RhpEtwExceptionThrown()
        {
            DisplayError("RhpEtwExceptionThrown");
        }

        [RuntimeExport("RhpFallbackFailFast")]
        public static void RhpFallbackFailFast()
        {
            DisplayError("RhpFallbackFailFast");
        }

        [RuntimeExport("RhpGetClasslibFunction")]
        public static void RhpGetClasslibFunction()
        {
            DisplayError("RhpGetClasslibFunction");
        }

        [RuntimeExport("RhpGetCurrentThreadStackTrace")]
        public static void RhpGetCurrentThreadStackTrace()
        {
            DisplayError("RhpGetCurrentThreadStackTrace");
        }

        [RuntimeExport("RhpGetDispatchCellInfo")]
        public static void RhpGetDispatchCellInfo()
        {
            DisplayError("RhpGetDispatchCellInfo");
        }

        [RuntimeExport("RhpGetDispatchMap")]
        public static void RhpGetDispatchMap()
        {
            DisplayError("RhpGetDispatchMap");
        }

        [RuntimeExport("RhpGetGcTotalMemory")]
        public static void RhpGetGcTotalMemory()
        {
            DisplayError("RhpGetGcTotalMemory");
        }

        [RuntimeExport("RhpGetNextFinalizableObject")]
        public static void RhpGetNextFinalizableObject()
        {
            DisplayError("RhpGetNextFinalizableObject");
        }

        [RuntimeExport("RhpGetNextFinalizerInitCallback")]
        public static void RhpGetNextFinalizerInitCallback()
        {
            DisplayError("RhpGetNextFinalizerInitCallback");
        }

        [RuntimeExport("RhpGetRequestedExceptionEvents")]
        public static void RhpGetRequestedExceptionEvents()
        {
            DisplayError("RhpGetRequestedExceptionEvents");
        }

        [RuntimeExport("RhpHandleAllocDependent")]
        public static void RhpHandleAllocDependent()
        {
            DisplayError("RhpHandleAllocDependent");
        }

        [RuntimeExport("RhpInitialDynamicInterfaceDispatch")]
        public static void RhpInitialDynamicInterfaceDispatch()
        {
            DisplayError("RhpInitialDynamicInterfaceDispatch");
        }

        [RuntimeExport("RhpPInvoke")]
        public static void RhpPInvoke()
        {
            DisplayError("RhpPInvoke");
        }

        [RuntimeExport("RhpPInvokeReturn")]
        public static void RhpPInvokeReturn()
        {
            DisplayError("RhpPInvokeReturn");
        }

        [RuntimeExport("RhpReleaseCastCacheLock")]
        public static void RhpReleaseCastCacheLock()
        {
            DisplayError("RhpReleaseCastCacheLock");
        }

        [RuntimeExport("RhpSearchDispatchCellCache")]
        public static void RhpSearchDispatchCellCache()
        {
            DisplayError("RhpSearchDispatchCellCache");
        }

        [RuntimeExport("RhpSendExceptionEventToDebugger")]
        public static void RhpSendExceptionEventToDebugger()
        {
            DisplayError("RhpSendExceptionEventToDebugger");
        }

        [RuntimeExport("RhpSetThreadDoNotTriggerGC")]
        public static void RhpSetThreadDoNotTriggerGC()
        {
            DisplayError("RhpSetThreadDoNotTriggerGC");
        }

        [RuntimeExport("RhpSfiInit")]
        public static void RhpSfiInit()
        {
            DisplayError("RhpSfiInit");
        }

        [RuntimeExport("RhpSfiNext")]
        public static void RhpSfiNext()
        {
            DisplayError("RhpSfiNext");
        }

        [RuntimeExport("RhpSignalFinalizationComplete")]
        public static void RhpSignalFinalizationComplete()
        {
            DisplayError("RhpSignalFinalizationComplete");
        }

        [RuntimeExport("RhpThrowEx")]
        public static void RhpThrowEx()
        {
            DisplayError("RhpThrowEx");
        }

        [RuntimeExport("RhpUpdateDispatchCellCache")]
        public static void RhpUpdateDispatchCellCache()
        {
            DisplayError("RhpUpdateDispatchCellCache");
        }

        [RuntimeExport("RhpValidateExInfoStack")]
        public static void RhpValidateExInfoStack()
        {
            DisplayError("RhpValidateExInfoStack");
        }

        [RuntimeExport("RhpWaitForFinalizerRequest")]
        public static void RhpWaitForFinalizerRequest()
        {
            DisplayError("RhpWaitForFinalizerRequest");
        }

        [RuntimeExport("RhSetErrorInfoBuffer")]
        public static void RhSetErrorInfoBuffer()
        {
            DisplayError("RhSetErrorInfoBuffer");
        }

        [RuntimeExport("RhSpinWait")]
        public static void RhSpinWait()
        {
            DisplayError("RhSpinWait");
        }

        [RuntimeExport("RhSuppressFinalize")]
        public static void RhSuppressFinalize()
        {
            DisplayError("RhSuppressFinalize");
        }

        [RuntimeExport("RhUnbox")]
        public static void RhUnbox()
        {
            DisplayError("RhUnbox");
        }

        [RuntimeExport("SetEvent")]
        public static void SetEvent()
        {
            DisplayError("SetEvent");
        }

        [RuntimeExport("WaitForMultipleObjectsEx")]
        public static void WaitForMultipleObjectsEx()
        {
            DisplayError("WaitForMultipleObjectsEx");
        }

        [RuntimeExport("RhpGetCastableObjectDispatchHelper")]
        public static void RhpGetCastableObjectDispatchHelper()
        {
            DisplayError("RhpGetCastableObjectDispatchHelper");
        }

        [RuntimeExport("RhpGetCastableObjectDispatchHelper_TailCalled")]
        public static void RhpGetCastableObjectDispatchHelper_TailCalled()
        {
            DisplayError("RhpGetCastableObjectDispatchHelper_TailCalled");
        }

        [RuntimeExport("RhpSetTLSDispatchCell")]
        public static void RhpSetTLSDispatchCell()
        {
            DisplayError("RhpSetTLSDispatchCell");
        }

        [RuntimeExport("RhpGetTailCallTLSDispatchCell")]
        public static void RhpGetTailCallTLSDispatchCell()
        {
            DisplayError("RhpGetTailCallTLSDispatchCell");
        }

        [RuntimeExport("RhpGetThunkSize")]
        public static void RhpGetThunkSize()
        {
            DisplayError("RhpGetThunkSize");
        }

        [RuntimeExport("RhpAcquireThunkPoolLock")]
        public static void RhpAcquireThunkPoolLock()
        {
            DisplayError("RhpAcquireThunkPoolLock");
        }

        [RuntimeExport("RhpReleaseThunkPoolLock")]
        public static void RhpReleaseThunkPoolLock()
        {
            DisplayError("RhpReleaseThunkPoolLock");
        }

        [RuntimeExport("RhpGetThunkStubsBlockAddress")]
        public static void RhpGetThunkStubsBlockAddress()
        {
            DisplayError("RhpGetThunkStubsBlockAddress");
        }

        [RuntimeExport("RhpGetCastableObjectDispatch_CommonStub")]
        public static void RhpGetCastableObjectDispatch_CommonStub()
        {
            DisplayError("RhpGetCastableObjectDispatch_CommonStub");
        }

        [RuntimeExport("RhpGetThunkDataBlockAddress")]
        public static void RhpGetThunkDataBlockAddress()
        {
            DisplayError("RhpGetThunkDataBlockAddress");
        }

        [RuntimeExport("RhpGetNumThunksPerBlock")]
        public static void RhpGetNumThunksPerBlock()
        {
            DisplayError("RhpGetNumThunksPerBlock");
        }

        [RuntimeExport("RhpGetNumThunkBlocksPerMapping")]
        public static void RhpGetNumThunkBlocksPerMapping()
        {
            DisplayError("RhpGetNumThunkBlocksPerMapping");
        }

        [RuntimeExport("RhAllocateThunksMapping")]
        public static void RhAllocateThunksMapping()
        {
            DisplayError("RhAllocateThunksMapping");
        }

        [RuntimeExport("RhpGetNextThunkStubsBlockAddress")]
        public static void RhpGetNextThunkStubsBlockAddress()
        {
            DisplayError("RhpGetNextThunkStubsBlockAddress");
        }
        
        [RuntimeExport("RhDebugBreak")]
        public static void RhDebugBreak()
        {
            DisplayError("RhDebugBreak");
        }

        [RuntimeExport("SetLastError")]
        public static void SetLastError()
        {
            DisplayError("SetLastError");
        }

        [RuntimeExport("RhReRegisterForFinalize")]
        public static void RhReRegisterForFinalize()
        {
            DisplayError("RhReRegisterForFinalize");
        }

        [RuntimeExport("pow")]
        public static void pow()
        {
            DisplayError("pow");
        }

        [RuntimeExport("FindNLSStringEx")]
        public static void FindNLSStringEx()
        {
            DisplayError("FindNLSStringEx");
        }

        [RuntimeExport("GetSystemTimeAsFileTime")]
        public static void GetSystemTimeAsFileTime()
        {
            DisplayError("GetSystemTimeAsFileTime");
        }

        [RuntimeExport("GetDynamicTimeZoneInformation")]
        public static void GetDynamicTimeZoneInformation()
        {
            DisplayError("GetDynamicTimeZoneInformation");
        }

        [RuntimeExport("RegQueryValueExW")]
        public static void RegQueryValueExW()
        {
            DisplayError("RegQueryValueExW");
        }

        [RuntimeExport("RegCloseKey")]
        public static void RegCloseKey()
        {
            DisplayError("RegCloseKey");
        }

        [RuntimeExport("RegEnumValueW")]
        public static void RegEnumValueW()
        {
            DisplayError("RegEnumValueW");
        }

        [RuntimeExport("RegEnumKeyExW")]
        public static void RegEnumKeyExW()
        {
            DisplayError("RegEnumKeyExW");
        }

        [RuntimeExport("RegQueryInfoKeyW")]
        public static void RegQueryInfoKeyW()
        {
            DisplayError("RegQueryInfoKeyW");
        }

        [RuntimeExport("cos")]
        public static void cos()
        {
            DisplayError("cos");
        }

        [RuntimeExport("sin")]
        public static void sin()
        {
            DisplayError("sin");
        }

        [RuntimeExport("GetSystemDirectoryW")]
        public static void GetSystemDirectoryW()
        {
            DisplayError("GetSystemDirectoryW");
        }

        [RuntimeExport("GetFileMUIPath")]
        public static void GetFileMUIPath()
        {
            DisplayError("GetFileMUIPath");
        }

        [RuntimeExport("LoadLibraryExW")]
        public static void LoadLibraryExW()
        {
            DisplayError("LoadLibraryExW");
        }

        [RuntimeExport("LoadStringW")]
        public static void LoadStringW()
        {
            DisplayError("LoadStringW");
        }

        [RuntimeExport("FormatMessageW")]
        public static void FormatMessageW()
        {
            DisplayError("FormatMessageW");
        }

        [RuntimeExport("tan")]
        public static void tan()
        {
            DisplayError("tan");
        }

        [RuntimeExport("FreeLibrary")]
        public static void FreeLibrary()
        {
            DisplayError("FreeLibrary");
        }

        [RuntimeExport("RhpValidateExInfoPop")]
        public static void RhpValidateExInfoPop()
        {
            DisplayError("RhpValidateExInfoPop");
        }

        [RuntimeExport("RhpWaitForSuspend2")]
        public static void RhpWaitForSuspend2()
        {
            DisplayError("RhpWaitForSuspend2");
        }

        [RuntimeExport("RhpWaitForGC2")]
        public static void RhpWaitForGC2()
        {
            DisplayError("RhpWaitForGC2");
        }

        [RuntimeExport("RhpReversePInvokeAttachOrTrapThread2")]
        public static void RhpReversePInvokeAttachOrTrapThread2()
        {
            DisplayError("RhpReversePInvokeAttachOrTrapThread2");
        }

        [RuntimeExport("RhpPublishObject")]
        public static unsafe void RhpPublishObject(void* obj, uint size)
        {
            DisplayError("RhpPublishObject");
        }
    }
}
