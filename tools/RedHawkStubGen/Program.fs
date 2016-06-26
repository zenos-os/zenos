// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

let unresolvedLinks = [
    "RhpReversePInvoke2"
    "RhpReversePInvokeReturn2"
    "RhpAssignRef"
    "RhpDbl2ULng"
    "RhpEtwExceptionThrown"
    "RhGetThreadLocalStorageForDynamicType"
    "RhpThrowEx"
    "RhpCheckedAssignRef"
    "RhpGetDispatchCellInfo"
    "RhpUpdateDispatchCellCache"
    "RhpFallbackFailFast"
    "RhpSearchDispatchCellCache"
    "RhpPInvoke"
    "RhpWaitForFinalizerRequest"
    "RhpPInvokeReturn"
    "RhpSignalFinalizationComplete"
    "RhpValidateExInfoStack"
    "RhpCollect"
    "RhpGetGcTotalMemory"
    "RhpNewFinalizable"
    "RhpNewFast"
    "RhpNewArray"
    "RhpBox"
    "RhUnbox"
    "RhpCopyObjectContents"
    "RhpGetCurrentThreadStackTrace"
    "memset"
    "RhpSfiInit"
    "RhpSfiNext"
    "__not_yet_implemented"
    "RhpGetClasslibFunction"
    "RhpSetThreadDoNotTriggerGC"
    "RhpCallCatchFunclet"
    "RhpGetNextFinalizerInitCallback"
    "RhpGetNextFinalizableObject"
    "RhpCheckedLockCmpXchg"
    "RhGetModuleFromEEType"
    "RhpCreateModuleManager"
    "RhpGetModuleSection"
    "RhpArrayCopy"
    "IsDebuggerPresent"
    "RaiseFailFastException"
    "RhHandleGet"
    "RhpGetRequestedExceptionEvents"
    "RhpSendExceptionEventToDebugger"
    "RhpEHEnumInitFromStackFrameIterator"
    "RhpCallFilterFunclet"
    "RhpEHEnumNext"
    "RhpCopyContextFromExInfo"
    "__fail_fast"
    "RhpCallFinallyFunclet"
    "RhpAcquireCastCacheLock"
    "PalGetTickCount64"
    "RhpInitialDynamicInterfaceDispatch"
    "RhHandleSet"
    "RhpHandleAlloc"
    "RhpReleaseCastCacheLock"
    "RhGetGenericInstantiation"
    "GetTickCount64"
    "RhSpinWait"
    "RhGetExceptionsForCurrentThread"
    "GetCurrentThreadId"
    "RhSetErrorInfoBuffer"
    "memmove"
    "RhpGetDispatchMap"
    "SetEvent"
    "GetLastError"
    "GetNativeSystemInfo"
    "GetProcessHeap"
    "HeapAlloc"
    "memcpy"
    "RhpByRefAssignRef"
    "OutputDebugStringW"
    "RhHandleGetDependent"
    "RhHandleFree"
    "RhFindMethodStartAddress"
    "RhGetModuleFromPointer"
    "LCMapStringEx"
    "CompareStringEx"
    "RhpCheckedXchg"
    "RhGetModuleFileName"
    "CreateEventExW"
    "RhSuppressFinalize"
    "CloseHandle"
    "GetLocaleInfoEx"
    "ResolveLocaleName"
    "RhGetCodeTarget"
    "RhpHandleAllocDependent"
    "floor"
    "fmod"
    "_ecvt_s"
    "EnumCalendarInfoExEx"
    "CompareStringOrdinal"
    "RhCompatibleReentrantWaitAny"
    "WaitForMultipleObjectsEx"
    "EnumTimeFormatsEx"
    "CoGetApartmentType"
    "GetCalendarInfoEx"
    "CoCreateGuid"
    ]


[<EntryPoint>]
let main argv = 
    let (globals, methods) = 
        unresolvedLinks
        |> List.fold(fun (globals, methods) funcName -> 
            let newGlobals = 
                funcName
                |> sprintf "%sglobal %s\r\n" globals

            let paddedFuncName (funcName : string) = 
                let modulus = funcName.Length % 4
                if modulus = 0 then funcName
                else funcName.PadRight(funcName.Length + (4-modulus))
            
            let sections =
                funcName
                |> paddedFuncName
                |> Seq.rev
                |> Seq.mapi (fun i c -> (i/4, c))
                |> Seq.groupBy(fun (p, c) -> p)
                |> Seq.map snd
//                |> fun (p, cs) -> 
//                    cs
//                    |> Seq.fold(fun state (_, c) ->
//                        state + c) "")

            let parts = 
                funcName
                
            let newMethods =
                funcName
                |> sprintf "%s"
            (newGlobals, "")
           ) ("", "")
    printfn "%A" argv
    0 // return an integer exit code
