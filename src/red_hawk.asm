global RhpReversePInvoke2
global RhpReversePInvokeReturn2
global RhpAssignRef
global RhpDbl2ULng
global RhpEtwExceptionThrown
global RhGetThreadLocalStorageForDynamicType
global RhpThrowEx
global RhpCheckedAssignRef
global RhpGetDispatchCellInfo
global RhpUpdateDispatchCellCache
global RhpFallbackFailFast
global RhpSearchDispatchCellCache
global RhpPInvoke
global RhpWaitForFinalizerRequest
global RhpPInvokeReturn
global RhpSignalFinalizationComplete
global RhpValidateExInfoStack
global RhpCollect
global RhpGetGcTotalMemory
global RhpNewFinalizable
global RhpNewFast
global RhpNewArray
global RhpBox
global RhUnbox
global RhpCopyObjectContents
global RhpGetCurrentThreadStackTrace
global memset
global RhpSfiInit
global RhpSfiNext
global __not_yet_implemented
global RhpGetClasslibFunction
global RhpSetThreadDoNotTriggerGC
global RhpCallCatchFunclet
global RhpGetNextFinalizerInitCallback
global RhpGetNextFinalizableObject
global RhpCheckedLockCmpXchg
global RhGetModuleFromEEType
global RhpCreateModuleManager
global RhpGetModuleSection
global RhpArrayCopy
global IsDebuggerPresent
global RaiseFailFastException
global RhHandleGet
global RhpGetRequestedExceptionEvents
global RhpSendExceptionEventToDebugger
global RhpEHEnumInitFromStackFrameIterator
global RhpCallFilterFunclet
global RhpEHEnumNext
global RhpCopyContextFromExInfo
global __fail_fast
global RhpCallFinallyFunclet
global RhpAcquireCastCacheLock
global PalGetTickCount64
global RhpInitialDynamicInterfaceDispatch
global RhHandleSet
global RhpHandleAlloc
global RhpReleaseCastCacheLock
global RhGetGenericInstantiation
global GetTickCount64
global RhSpinWait
global RhGetExceptionsForCurrentThread
global GetCurrentThreadId
global RhSetErrorInfoBuffer
global memmove
global RhpGetDispatchMap
global SetEvent
global GetLastError
global GetNativeSystemInfo
global GetProcessHeap
global HeapAlloc
global memcpy
global RhpByRefAssignRef
global OutputDebugStringW
global RhHandleGetDependent
global RhHandleFree
global RhFindMethodStartAddress
global RhGetModuleFromPointer
global LCMapStringEx
global CompareStringEx
global RhpCheckedXchg
global RhGetModuleFileName
global CreateEventExW
global RhSuppressFinalize
global CloseHandle
global GetLocaleInfoEx
global ResolveLocaleName
global RhGetCodeTarget
global RhpHandleAllocDependent
global floor
global fmod
global _ecvt_s
global EnumCalendarInfoExEx
global CompareStringOrdinal
global RhCompatibleReentrantWaitAny
global WaitForMultipleObjectsEx
global EnumTimeFormatsEx
global CoGetApartmentType
global GetCalendarInfoEx
global CoCreateGuid

section .text
bits 64
RhpReversePInvoke2:
    ; print `Err: RhpReversePInvoke2 ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f764f654f52 ; Reve
    mov qword[0x000b8008], rax
    mov rax, 0x4f504f654f734f72 ; rseP
    mov qword[0x000b800c], rax
    mov rax, 0x4f6f4f764f6e4f49 ; Invo
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f324f654f6b ; ke2 
    mov qword[0x000b8014], rax
    hlt

RhpReversePInvokeReturn2:
    ; print `Err: RhpReversePInvokeReturn2   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f764f654f52 ; Reve
    mov qword[0x000b8008], rax
    mov rax, 0x4f504f654f734f72 ; rseP
    mov qword[0x000b800c], rax
    mov rax, 0x4f6f4f764f6e4f49 ; Invo
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f524f654f6b ; keRe
    mov qword[0x000b8014], rax
    mov rax, 0x4f6e4f724f754f74 ; turn
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f204f204f32 ; 2   
    mov qword[0x000b801c], rax
    hlt

RhpAssignRef:
    ; print `Err: RhpAssignRef   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f694f734f734f41 ; Assi
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f524f6e4f67 ; gnRe
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f204f66 ; f   
    mov qword[0x000b8010], rax
    hlt

RhpDbl2ULng:
    ; print `Err: RhpDbl2ULng` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f324f6c4f624f44 ; Dbl2
    mov qword[0x000b8008], rax
    mov rax, 0x4f674f6e4f4c4f55 ; ULng
    mov qword[0x000b800c], rax
    hlt

RhpEtwExceptionThrown:
    ; print `Err: RhpEtwExceptionThrown  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f454f774f744f45 ; EtwE
    mov qword[0x000b8008], rax
    mov rax, 0x4f704f654f634f78 ; xcep
    mov qword[0x000b800c], rax
    mov rax, 0x4f6e4f6f4f694f74 ; tion
    mov qword[0x000b8010], rax
    mov rax, 0x4f6f4f724f684f54 ; Thro
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f6e4f77 ; wn  
    mov qword[0x000b8018], rax
    hlt

RhGetThreadLocalStorageForDynamicType:
    ; print `Err: RhGetThreadLocalStorageForDynamicType  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f684f544f744f65 ; etTh
    mov qword[0x000b8008], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[0x000b800c], rax
    mov rax, 0x4f614f634f6f4f4c ; Loca
    mov qword[0x000b8010], rax
    mov rax, 0x4f6f4f744f534f6c ; lSto
    mov qword[0x000b8014], rax
    mov rax, 0x4f654f674f614f72 ; rage
    mov qword[0x000b8018], rax
    mov rax, 0x4f444f724f6f4f46 ; ForD
    mov qword[0x000b801c], rax
    mov rax, 0x4f6d4f614f6e4f79 ; ynam
    mov qword[0x000b8020], rax
    mov rax, 0x4f794f544f634f69 ; icTy
    mov qword[0x000b8024], rax
    mov rax, 0x4f204f204f654f70 ; pe  
    mov qword[0x000b8028], rax
    hlt

RhpThrowEx:
    ; print `Err: RhpThrowEx ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6f4f724f684f54 ; Thro
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f784f454f77 ; wEx 
    mov qword[0x000b800c], rax
    hlt

RhpCheckedAssignRef:
    ; print `Err: RhpCheckedAssignRef` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f634f654f684f43 ; Chec
    mov qword[0x000b8008], rax
    mov rax, 0x4f414f644f654f6b ; kedA
    mov qword[0x000b800c], rax
    mov rax, 0x4f674f694f734f73 ; ssig
    mov qword[0x000b8010], rax
    mov rax, 0x4f664f654f524f6e ; nRef
    mov qword[0x000b8014], rax
    hlt

RhpGetDispatchCellInfo:
    ; print `Err: RhpGetDispatchCellInfo ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f444f744f654f47 ; GetD
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f704f734f69 ; ispa
    mov qword[0x000b800c], rax
    mov rax, 0x4f434f684f634f74 ; tchC
    mov qword[0x000b8010], rax
    mov rax, 0x4f494f6c4f6c4f65 ; ellI
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f6f4f664f6e ; nfo 
    mov qword[0x000b8018], rax
    hlt

RhpUpdateDispatchCellCache:
    ; print `Err: RhpUpdateDispatchCellCache ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f644f704f55 ; Upda
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f444f654f74 ; teDi
    mov qword[0x000b800c], rax
    mov rax, 0x4f744f614f704f73 ; spat
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f434f684f63 ; chCe
    mov qword[0x000b8014], rax
    mov rax, 0x4f614f434f6c4f6c ; llCa
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f654f684f63 ; che 
    mov qword[0x000b801c], rax
    hlt

RhpFallbackFailFast:
    ; print `Err: RhpFallbackFailFast` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f6c4f614f46 ; Fall
    mov qword[0x000b8008], rax
    mov rax, 0x4f6b4f634f614f62 ; back
    mov qword[0x000b800c], rax
    mov rax, 0x4f6c4f694f614f46 ; Fail
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f734f614f46 ; Fast
    mov qword[0x000b8014], rax
    hlt

RhpSearchDispatchCellCache:
    ; print `Err: RhpSearchDispatchCellCache ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f724f614f654f53 ; Sear
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f444f684f63 ; chDi
    mov qword[0x000b800c], rax
    mov rax, 0x4f744f614f704f73 ; spat
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f434f684f63 ; chCe
    mov qword[0x000b8014], rax
    mov rax, 0x4f614f434f6c4f6c ; llCa
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f654f684f63 ; che 
    mov qword[0x000b801c], rax
    hlt

RhpPInvoke:
    ; print `Err: RhpPInvoke ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f764f6e4f494f50 ; PInv
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f654f6b4f6f ; oke 
    mov qword[0x000b800c], rax
    hlt

RhpWaitForFinalizerRequest:
    ; print `Err: RhpWaitForFinalizerRequest ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f744f694f614f57 ; Wait
    mov qword[0x000b8008], rax
    mov rax, 0x4f464f724f6f4f46 ; ForF
    mov qword[0x000b800c], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[0x000b8010], rax
    mov rax, 0x4f724f654f7a4f69 ; izer
    mov qword[0x000b8014], rax
    mov rax, 0x4f754f714f654f52 ; Requ
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f744f734f65 ; est 
    mov qword[0x000b801c], rax
    hlt

RhpPInvokeReturn:
    ; print `Err: RhpPInvokeReturn   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f764f6e4f494f50 ; PInv
    mov qword[0x000b8008], rax
    mov rax, 0x4f524f654f6b4f6f ; okeR
    mov qword[0x000b800c], rax
    mov rax, 0x4f724f754f744f65 ; etur
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f204f6e ; n   
    mov qword[0x000b8014], rax
    hlt

RhpSignalFinalizationComplete:
    ; print `Err: RhpSignalFinalizationComplete  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6e4f674f694f53 ; Sign
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f464f6c4f61 ; alFi
    mov qword[0x000b800c], rax
    mov rax, 0x4f694f6c4f614f6e ; nali
    mov qword[0x000b8010], rax
    mov rax, 0x4f694f744f614f7a ; zati
    mov qword[0x000b8014], rax
    mov rax, 0x4f6f4f434f6e4f6f ; onCo
    mov qword[0x000b8018], rax
    mov rax, 0x4f654f6c4f704f6d ; mple
    mov qword[0x000b801c], rax
    mov rax, 0x4f204f204f654f74 ; te  
    mov qword[0x000b8020], rax
    hlt

RhpValidateExInfoStack:
    ; print `Err: RhpValidateExInfoStack ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f694f6c4f614f56 ; Vali
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f744f614f64 ; date
    mov qword[0x000b800c], rax
    mov rax, 0x4f6e4f494f784f45 ; ExIn
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f534f6f4f66 ; foSt
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f6b4f634f61 ; ack 
    mov qword[0x000b8018], rax
    hlt

RhpCollect:
    ; print `Err: RhpCollect ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f6c4f6f4f43 ; Coll
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f744f634f65 ; ect 
    mov qword[0x000b800c], rax
    hlt

RhpGetGcTotalMemory:
    ; print `Err: RhpGetGcTotalMemory` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f474f744f654f47 ; GetG
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f6f4f544f63 ; cTot
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f4d4f6c4f61 ; alMe
    mov qword[0x000b8010], rax
    mov rax, 0x4f794f724f6f4f6d ; mory
    mov qword[0x000b8014], rax
    hlt

RhpNewFinalizable:
    ; print `Err: RhpNewFinalizable  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f464f774f654f4e ; NewF
    mov qword[0x000b8008], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[0x000b800c], rax
    mov rax, 0x4f624f614f7a4f69 ; izab
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f654f6c ; le  
    mov qword[0x000b8014], rax
    hlt

RhpNewFast:
    ; print `Err: RhpNewFast ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f464f774f654f4e ; NewF
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f744f734f61 ; ast 
    mov qword[0x000b800c], rax
    hlt

RhpNewArray:
    ; print `Err: RhpNewArray` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f414f774f654f4e ; NewA
    mov qword[0x000b8008], rax
    mov rax, 0x4f794f614f724f72 ; rray
    mov qword[0x000b800c], rax
    hlt

RhpBox:
    ; print `Err: RhpBox ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f204f784f6f4f42 ; Box 
    mov qword[0x000b8008], rax
    hlt

RhUnbox:
    ; print `Err: RhUnbox` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f554f684f524f20 ;  RhU
    mov qword[0x000b8004], rax
    mov rax, 0x4f784f6f4f624f6e ; nbox
    mov qword[0x000b8008], rax
    hlt

RhpCopyObjectContents:
    ; print `Err: RhpCopyObjectContents  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f794f704f6f4f43 ; Copy
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f6a4f624f4f ; Obje
    mov qword[0x000b800c], rax
    mov rax, 0x4f6f4f434f744f63 ; ctCo
    mov qword[0x000b8010], rax
    mov rax, 0x4f6e4f654f744f6e ; nten
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f734f74 ; ts  
    mov qword[0x000b8018], rax
    hlt

RhpGetCurrentThreadStackTrace:
    ; print `Err: RhpGetCurrentThreadStackTrace  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f724f724f75 ; urre
    mov qword[0x000b800c], rax
    mov rax, 0x4f684f544f744f6e ; ntTh
    mov qword[0x000b8010], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[0x000b8014], rax
    mov rax, 0x4f634f614f744f53 ; Stac
    mov qword[0x000b8018], rax
    mov rax, 0x4f614f724f544f6b ; kTra
    mov qword[0x000b801c], rax
    mov rax, 0x4f204f204f654f63 ; ce  
    mov qword[0x000b8020], rax
    hlt

memset:
    ; print `Err: memset ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6d4f654f6d4f20 ;  mem
    mov qword[0x000b8004], rax
    mov rax, 0x4f204f744f654f73 ; set 
    mov qword[0x000b8008], rax
    hlt

RhpSfiInit:
    ; print `Err: RhpSfiInit ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f494f694f664f53 ; SfiI
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f744f694f6e ; nit 
    mov qword[0x000b800c], rax
    hlt

RhpSfiNext:
    ; print `Err: RhpSfiNext ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f4e4f694f664f53 ; SfiN
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f744f784f65 ; ext 
    mov qword[0x000b800c], rax
    hlt

__not_yet_implemented:
    ; print `Err: __not_yet_implemented  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6e4f5f4f5f4f20 ;  __n
    mov qword[0x000b8004], rax
    mov rax, 0x4f794f5f4f744f6f ; ot_y
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f5f4f744f65 ; et_i
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f6c4f704f6d ; mple
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f6e4f654f6d ; ment
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f644f65 ; ed  
    mov qword[0x000b8018], rax
    hlt

RhpGetClasslibFunction:
    ; print `Err: RhpGetClasslibFunction ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[0x000b8008], rax
    mov rax, 0x4f734f734f614f6c ; lass
    mov qword[0x000b800c], rax
    mov rax, 0x4f464f624f694f6c ; libF
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f634f6e4f75 ; unct
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f6e4f6f4f69 ; ion 
    mov qword[0x000b8018], rax
    hlt

RhpSetThreadDoNotTriggerGC:
    ; print `Err: RhpSetThreadDoNotTriggerGC ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f544f744f654f53 ; SetT
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f654f724f68 ; hrea
    mov qword[0x000b800c], rax
    mov rax, 0x4f4e4f6f4f444f64 ; dDoN
    mov qword[0x000b8010], rax
    mov rax, 0x4f724f544f744f6f ; otTr
    mov qword[0x000b8014], rax
    mov rax, 0x4f654f674f674f69 ; igge
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f434f474f72 ; rGC 
    mov qword[0x000b801c], rax
    hlt

RhpCallCatchFunclet:
    ; print `Err: RhpCallCatchFunclet` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[0x000b8008], rax
    mov rax, 0x4f634f744f614f43 ; Catc
    mov qword[0x000b800c], rax
    mov rax, 0x4f6e4f754f464f68 ; hFun
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f654f6c4f63 ; clet
    mov qword[0x000b8014], rax
    hlt

RhpGetNextFinalizerInitCallback:
    ; print `Err: RhpGetNextFinalizerInitCallback` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[0x000b8008], rax
    mov rax, 0x4f464f744f784f65 ; extF
    mov qword[0x000b800c], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[0x000b8010], rax
    mov rax, 0x4f724f654f7a4f69 ; izer
    mov qword[0x000b8014], rax
    mov rax, 0x4f744f694f6e4f49 ; Init
    mov qword[0x000b8018], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[0x000b801c], rax
    mov rax, 0x4f6b4f634f614f62 ; back
    mov qword[0x000b8020], rax
    hlt

RhpGetNextFinalizableObject:
    ; print `Err: RhpGetNextFinalizableObject` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[0x000b8008], rax
    mov rax, 0x4f464f744f784f65 ; extF
    mov qword[0x000b800c], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[0x000b8010], rax
    mov rax, 0x4f624f614f7a4f69 ; izab
    mov qword[0x000b8014], rax
    mov rax, 0x4f624f4f4f654f6c ; leOb
    mov qword[0x000b8018], rax
    mov rax, 0x4f744f634f654f6a ; ject
    mov qword[0x000b801c], rax
    hlt

RhpCheckedLockCmpXchg:
    ; print `Err: RhpCheckedLockCmpXchg  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f634f654f684f43 ; Chec
    mov qword[0x000b8008], rax
    mov rax, 0x4f4c4f644f654f6b ; kedL
    mov qword[0x000b800c], rax
    mov rax, 0x4f434f6b4f634f6f ; ockC
    mov qword[0x000b8010], rax
    mov rax, 0x4f634f584f704f6d ; mpXc
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f674f68 ; hg  
    mov qword[0x000b8018], rax
    hlt

RhGetModuleFromEEType:
    ; print `Err: RhGetModuleFromEEType  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f6f4f4d4f744f65 ; etMo
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[0x000b800c], rax
    mov rax, 0x4f6d4f6f4f724f46 ; From
    mov qword[0x000b8010], rax
    mov rax, 0x4f794f544f454f45 ; EETy
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f654f70 ; pe  
    mov qword[0x000b8018], rax
    hlt

RhpCreateModuleManager:
    ; print `Err: RhpCreateModuleManager ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f654f724f43 ; Crea
    mov qword[0x000b8008], rax
    mov rax, 0x4f6f4f4d4f654f74 ; teMo
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[0x000b8010], rax
    mov rax, 0x4f614f6e4f614f4d ; Mana
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f724f654f67 ; ger 
    mov qword[0x000b8018], rax
    hlt

RhpGetModuleSection:
    ; print `Err: RhpGetModuleSection` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f4d4f744f654f47 ; GetM
    mov qword[0x000b8008], rax
    mov rax, 0x4f6c4f754f644f6f ; odul
    mov qword[0x000b800c], rax
    mov rax, 0x4f634f654f534f65 ; eSec
    mov qword[0x000b8010], rax
    mov rax, 0x4f6e4f6f4f694f74 ; tion
    mov qword[0x000b8014], rax
    hlt

RhpArrayCopy:
    ; print `Err: RhpArrayCopy   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f724f724f41 ; Arra
    mov qword[0x000b8008], rax
    mov rax, 0x4f704f6f4f434f79 ; yCop
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f204f79 ; y   
    mov qword[0x000b8010], rax
    hlt

IsDebuggerPresent:
    ; print `Err: IsDebuggerPresent  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f444f734f494f20 ;  IsD
    mov qword[0x000b8004], rax
    mov rax, 0x4f674f754f624f65 ; ebug
    mov qword[0x000b8008], rax
    mov rax, 0x4f504f724f654f67 ; gerP
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f734f654f72 ; rese
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f744f6e ; nt  
    mov qword[0x000b8014], rax
    hlt

RaiseFailFastException:
    ; print `Err: RaiseFailFastException ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f694f614f524f20 ;  Rai
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f464f654f73 ; seFa
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f464f6c4f69 ; ilFa
    mov qword[0x000b800c], rax
    mov rax, 0x4f784f454f744f73 ; stEx
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f704f654f63 ; cept
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f6e4f6f4f69 ; ion 
    mov qword[0x000b8018], rax
    hlt

RhHandleGet:
    ; print `Err: RhHandleGet` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f654f474f65 ; eGet
    mov qword[0x000b800c], rax
    hlt

RhpGetRequestedExceptionEvents:
    ; print `Err: RhpGetRequestedExceptionEvents ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f524f744f654f47 ; GetR
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f754f714f65 ; eque
    mov qword[0x000b800c], rax
    mov rax, 0x4f644f654f744f73 ; sted
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f634f784f45 ; Exce
    mov qword[0x000b8014], rax
    mov rax, 0x4f6f4f694f744f70 ; ptio
    mov qword[0x000b8018], rax
    mov rax, 0x4f654f764f454f6e ; nEve
    mov qword[0x000b801c], rax
    mov rax, 0x4f204f734f744f6e ; nts 
    mov qword[0x000b8020], rax
    hlt

RhpSendExceptionEventToDebugger:
    ; print `Err: RhpSendExceptionEventToDebugger` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f644f6e4f654f53 ; Send
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f634f784f45 ; Exce
    mov qword[0x000b800c], rax
    mov rax, 0x4f6f4f694f744f70 ; ptio
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f764f454f6e ; nEve
    mov qword[0x000b8014], rax
    mov rax, 0x4f6f4f544f744f6e ; ntTo
    mov qword[0x000b8018], rax
    mov rax, 0x4f754f624f654f44 ; Debu
    mov qword[0x000b801c], rax
    mov rax, 0x4f724f654f674f67 ; gger
    mov qword[0x000b8020], rax
    hlt

RhpEHEnumInitFromStackFrameIterator:
    ; print `Err: RhpEHEnumInitFromStackFrameIterator` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6e4f454f484f45 ; EHEn
    mov qword[0x000b8008], rax
    mov rax, 0x4f6e4f494f6d4f75 ; umIn
    mov qword[0x000b800c], rax
    mov rax, 0x4f724f464f744f69 ; itFr
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f534f6d4f6f ; omSt
    mov qword[0x000b8014], rax
    mov rax, 0x4f464f6b4f634f61 ; ackF
    mov qword[0x000b8018], rax
    mov rax, 0x4f654f6d4f614f72 ; rame
    mov qword[0x000b801c], rax
    mov rax, 0x4f724f654f744f49 ; Iter
    mov qword[0x000b8020], rax
    mov rax, 0x4f724f6f4f744f61 ; ator
    mov qword[0x000b8024], rax
    hlt

RhpCallFilterFunclet:
    ; print `Err: RhpCallFilterFunclet   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f6c4f694f46 ; Filt
    mov qword[0x000b800c], rax
    mov rax, 0x4f754f464f724f65 ; erFu
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f6c4f634f6e ; ncle
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[0x000b8018], rax
    hlt

RhpEHEnumNext:
    ; print `Err: RhpEHEnumNext  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6e4f454f484f45 ; EHEn
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f4e4f6d4f75 ; umNe
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f744f78 ; xt  
    mov qword[0x000b8010], rax
    hlt

RhpCopyContextFromExInfo:
    ; print `Err: RhpCopyContextFromExInfo   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f794f704f6f4f43 ; Copy
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f6e4f6f4f43 ; Cont
    mov qword[0x000b800c], rax
    mov rax, 0x4f464f744f784f65 ; extF
    mov qword[0x000b8010], rax
    mov rax, 0x4f454f6d4f6f4f72 ; romE
    mov qword[0x000b8014], rax
    mov rax, 0x4f664f6e4f494f78 ; xInf
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f204f204f6f ; o   
    mov qword[0x000b801c], rax
    hlt

__fail_fast:
    ; print `Err: __fail_fast` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f664f5f4f5f4f20 ;  __f
    mov qword[0x000b8004], rax
    mov rax, 0x4f5f4f6c4f694f61 ; ail_
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f734f614f66 ; fast
    mov qword[0x000b800c], rax
    hlt

RhpCallFinallyFunclet:
    ; print `Err: RhpCallFinallyFunclet  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f6e4f694f46 ; Fina
    mov qword[0x000b800c], rax
    mov rax, 0x4f464f794f6c4f6c ; llyF
    mov qword[0x000b8010], rax
    mov rax, 0x4f6c4f634f6e4f75 ; uncl
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f744f65 ; et  
    mov qword[0x000b8018], rax
    hlt

RhpAcquireCastCacheLock:
    ; print `Err: RhpAcquireCastCacheLock` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f754f714f634f41 ; Acqu
    mov qword[0x000b8008], rax
    mov rax, 0x4f434f654f724f69 ; ireC
    mov qword[0x000b800c], rax
    mov rax, 0x4f434f744f734f61 ; astC
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f684f634f61 ; ache
    mov qword[0x000b8014], rax
    mov rax, 0x4f6b4f634f6f4f4c ; Lock
    mov qword[0x000b8018], rax
    hlt

PalGetTickCount64:
    ; print `Err: PalGetTickCount64  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6c4f614f504f20 ;  Pal
    mov qword[0x000b8004], rax
    mov rax, 0x4f544f744f654f47 ; GetT
    mov qword[0x000b8008], rax
    mov rax, 0x4f434f6b4f634f69 ; ickC
    mov qword[0x000b800c], rax
    mov rax, 0x4f744f6e4f754f6f ; ount
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f344f36 ; 64  
    mov qword[0x000b8014], rax
    hlt

RhpInitialDynamicInterfaceDispatch:
    ; print `Err: RhpInitialDynamicInterfaceDispatch ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f744f694f6e4f49 ; Init
    mov qword[0x000b8008], rax
    mov rax, 0x4f444f6c4f614f69 ; ialD
    mov qword[0x000b800c], rax
    mov rax, 0x4f6d4f614f6e4f79 ; ynam
    mov qword[0x000b8010], rax
    mov rax, 0x4f6e4f494f634f69 ; icIn
    mov qword[0x000b8014], rax
    mov rax, 0x4f664f724f654f74 ; terf
    mov qword[0x000b8018], rax
    mov rax, 0x4f444f654f634f61 ; aceD
    mov qword[0x000b801c], rax
    mov rax, 0x4f614f704f734f69 ; ispa
    mov qword[0x000b8020], rax
    mov rax, 0x4f204f684f634f74 ; tch 
    mov qword[0x000b8024], rax
    hlt

RhHandleSet:
    ; print `Err: RhHandleSet` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f654f534f65 ; eSet
    mov qword[0x000b800c], rax
    hlt

RhpHandleAlloc:
    ; print `Err: RhpHandleAlloc ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f644f6e4f614f48 ; Hand
    mov qword[0x000b8008], rax
    mov rax, 0x4f6c4f414f654f6c ; leAl
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f634f6f4f6c ; loc 
    mov qword[0x000b8010], rax
    hlt

RhpReleaseCastCacheLock:
    ; print `Err: RhpReleaseCastCacheLock` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f6c4f654f52 ; Rele
    mov qword[0x000b8008], rax
    mov rax, 0x4f434f654f734f61 ; aseC
    mov qword[0x000b800c], rax
    mov rax, 0x4f434f744f734f61 ; astC
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f684f634f61 ; ache
    mov qword[0x000b8014], rax
    mov rax, 0x4f6b4f634f6f4f4c ; Lock
    mov qword[0x000b8018], rax
    hlt

RhGetGenericInstantiation:
    ; print `Err: RhGetGenericInstantiation  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f474f744f65 ; etGe
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f724f654f6e ; neri
    mov qword[0x000b800c], rax
    mov rax, 0x4f734f6e4f494f63 ; cIns
    mov qword[0x000b8010], rax
    mov rax, 0x4f744f6e4f614f74 ; tant
    mov qword[0x000b8014], rax
    mov rax, 0x4f694f744f614f69 ; iati
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f204f6e4f6f ; on  
    mov qword[0x000b801c], rax
    hlt

GetTickCount64:
    ; print `Err: GetTickCount64 ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f6b4f634f694f54 ; Tick
    mov qword[0x000b8008], rax
    mov rax, 0x4f6e4f754f6f4f43 ; Coun
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f344f364f74 ; t64 
    mov qword[0x000b8010], rax
    hlt

RhSpinWait:
    ; print `Err: RhSpinWait ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[0x000b8004], rax
    mov rax, 0x4f574f6e4f694f70 ; pinW
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f744f694f61 ; ait 
    mov qword[0x000b800c], rax
    hlt

RhGetExceptionsForCurrentThread:
    ; print `Err: RhGetExceptionsForCurrentThread` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f784f454f744f65 ; etEx
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f704f654f63 ; cept
    mov qword[0x000b800c], rax
    mov rax, 0x4f734f6e4f6f4f69 ; ions
    mov qword[0x000b8010], rax
    mov rax, 0x4f434f724f6f4f46 ; ForC
    mov qword[0x000b8014], rax
    mov rax, 0x4f654f724f724f75 ; urre
    mov qword[0x000b8018], rax
    mov rax, 0x4f684f544f744f6e ; ntTh
    mov qword[0x000b801c], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[0x000b8020], rax
    hlt

GetCurrentThreadId:
    ; print `Err: GetCurrentThreadId ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f724f724f754f43 ; Curr
    mov qword[0x000b8008], rax
    mov rax, 0x4f544f744f6e4f65 ; entT
    mov qword[0x000b800c], rax
    mov rax, 0x4f614f654f724f68 ; hrea
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f644f494f64 ; dId 
    mov qword[0x000b8014], rax
    hlt

RhSetErrorInfoBuffer:
    ; print `Err: RhSetErrorInfoBuffer   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[0x000b8004], rax
    mov rax, 0x4f724f454f744f65 ; etEr
    mov qword[0x000b8008], rax
    mov rax, 0x4f494f724f6f4f72 ; rorI
    mov qword[0x000b800c], rax
    mov rax, 0x4f424f6f4f664f6e ; nfoB
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f664f664f75 ; uffe
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f204f72 ; r   
    mov qword[0x000b8018], rax
    hlt

memmove:
    ; print `Err: memmove` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6d4f654f6d4f20 ;  mem
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f764f6f4f6d ; move
    mov qword[0x000b8008], rax
    hlt

RhpGetDispatchMap:
    ; print `Err: RhpGetDispatchMap  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f444f744f654f47 ; GetD
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f704f734f69 ; ispa
    mov qword[0x000b800c], rax
    mov rax, 0x4f4d4f684f634f74 ; tchM
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f704f61 ; ap  
    mov qword[0x000b8014], rax
    hlt

SetEvent:
    ; print `Err: SetEvent   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f534f20 ;  Set
    mov qword[0x000b8004], rax
    mov rax, 0x4f6e4f654f764f45 ; Even
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[0x000b800c], rax
    hlt

GetLastError:
    ; print `Err: GetLastError   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f744f734f614f4c ; Last
    mov qword[0x000b8008], rax
    mov rax, 0x4f6f4f724f724f45 ; Erro
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f204f72 ; r   
    mov qword[0x000b8010], rax
    hlt

GetNativeSystemInfo:
    ; print `Err: GetNativeSystemInfo` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f694f744f614f4e ; Nati
    mov qword[0x000b8008], rax
    mov rax, 0x4f794f534f654f76 ; veSy
    mov qword[0x000b800c], rax
    mov rax, 0x4f6d4f654f744f73 ; stem
    mov qword[0x000b8010], rax
    mov rax, 0x4f6f4f664f6e4f49 ; Info
    mov qword[0x000b8014], rax
    hlt

GetProcessHeap:
    ; print `Err: GetProcessHeap ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f634f6f4f724f50 ; Proc
    mov qword[0x000b8008], rax
    mov rax, 0x4f484f734f734f65 ; essH
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f704f614f65 ; eap 
    mov qword[0x000b8010], rax
    hlt

HeapAlloc:
    ; print `Err: HeapAlloc  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f614f654f484f20 ;  Hea
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f6c4f414f70 ; pAll
    mov qword[0x000b8008], rax
    mov rax, 0x4f204f204f634f6f ; oc  
    mov qword[0x000b800c], rax
    hlt

memcpy:
    ; print `Err: memcpy ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6d4f654f6d4f20 ;  mem
    mov qword[0x000b8004], rax
    mov rax, 0x4f204f794f704f63 ; cpy 
    mov qword[0x000b8008], rax
    hlt

RhpByRefAssignRef:
    ; print `Err: RhpByRefAssignRef  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f524f794f42 ; ByRe
    mov qword[0x000b8008], rax
    mov rax, 0x4f734f734f414f66 ; fAss
    mov qword[0x000b800c], rax
    mov rax, 0x4f524f6e4f674f69 ; ignR
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f664f65 ; ef  
    mov qword[0x000b8014], rax
    hlt

OutputDebugStringW:
    ; print `Err: OutputDebugStringW ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f754f4f4f20 ;  Out
    mov qword[0x000b8004], rax
    mov rax, 0x4f444f744f754f70 ; putD
    mov qword[0x000b8008], rax
    mov rax, 0x4f674f754f624f65 ; ebug
    mov qword[0x000b800c], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f574f674f6e ; ngW 
    mov qword[0x000b8014], rax
    hlt

RhHandleGetDependent:
    ; print `Err: RhHandleGetDependent   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f654f474f65 ; eGet
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f704f654f44 ; Depe
    mov qword[0x000b8010], rax
    mov rax, 0x4f6e4f654f644f6e ; nden
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[0x000b8018], rax
    hlt

RhHandleFree:
    ; print `Err: RhHandleFree   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f724f464f65 ; eFre
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f204f65 ; e   
    mov qword[0x000b8010], rax
    hlt

RhFindMethodStartAddress:
    ; print `Err: RhFindMethodStartAddress   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f464f684f524f20 ;  RhF
    mov qword[0x000b8004], rax
    mov rax, 0x4f4d4f644f6e4f69 ; indM
    mov qword[0x000b8008], rax
    mov rax, 0x4f6f4f684f744f65 ; etho
    mov qword[0x000b800c], rax
    mov rax, 0x4f614f744f534f64 ; dSta
    mov qword[0x000b8010], rax
    mov rax, 0x4f644f414f744f72 ; rtAd
    mov qword[0x000b8014], rax
    mov rax, 0x4f734f654f724f64 ; dres
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f204f204f73 ; s   
    mov qword[0x000b801c], rax
    hlt

RhGetModuleFromPointer:
    ; print `Err: RhGetModuleFromPointer ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f6f4f4d4f744f65 ; etMo
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[0x000b800c], rax
    mov rax, 0x4f6d4f6f4f724f46 ; From
    mov qword[0x000b8010], rax
    mov rax, 0x4f6e4f694f6f4f50 ; Poin
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f724f654f74 ; ter 
    mov qword[0x000b8018], rax
    hlt

LCMapStringEx:
    ; print `Err: LCMapStringEx  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f4d4f434f4c4f20 ;  LCM
    mov qword[0x000b8004], rax
    mov rax, 0x4f744f534f704f61 ; apSt
    mov qword[0x000b8008], rax
    mov rax, 0x4f674f6e4f694f72 ; ring
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f784f45 ; Ex  
    mov qword[0x000b8010], rax
    hlt

CompareStringEx:
    ; print `Err: CompareStringEx` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6d4f6f4f434f20 ;  Com
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f724f614f70 ; pare
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[0x000b800c], rax
    mov rax, 0x4f784f454f674f6e ; ngEx
    mov qword[0x000b8010], rax
    hlt

RhpCheckedXchg:
    ; print `Err: RhpCheckedXchg ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f634f654f684f43 ; Chec
    mov qword[0x000b8008], rax
    mov rax, 0x4f584f644f654f6b ; kedX
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f674f684f63 ; chg 
    mov qword[0x000b8010], rax
    hlt

RhGetModuleFileName:
    ; print `Err: RhGetModuleFileName` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f6f4f4d4f744f65 ; etMo
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f6c4f694f46 ; File
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f6d4f614f4e ; Name
    mov qword[0x000b8014], rax
    hlt

CreateEventExW:
    ; print `Err: CreateEventExW ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f654f724f434f20 ;  Cre
    mov qword[0x000b8004], rax
    mov rax, 0x4f454f654f744f61 ; ateE
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f6e4f654f76 ; vent
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f574f784f45 ; ExW 
    mov qword[0x000b8010], rax
    hlt

RhSuppressFinalize:
    ; print `Err: RhSuppressFinalize ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[0x000b8004], rax
    mov rax, 0x4f724f704f704f75 ; uppr
    mov qword[0x000b8008], rax
    mov rax, 0x4f464f734f734f65 ; essF
    mov qword[0x000b800c], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f654f7a4f69 ; ize 
    mov qword[0x000b8014], rax
    hlt

CloseHandle:
    ; print `Err: CloseHandle` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6f4f6c4f434f20 ;  Clo
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f484f654f73 ; seHa
    mov qword[0x000b8008], rax
    mov rax, 0x4f654f6c4f644f6e ; ndle
    mov qword[0x000b800c], rax
    hlt

GetLocaleInfoEx:
    ; print `Err: GetLocaleInfoEx` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f634f6f4f4c ; Loca
    mov qword[0x000b8008], rax
    mov rax, 0x4f6e4f494f654f6c ; leIn
    mov qword[0x000b800c], rax
    mov rax, 0x4f784f454f6f4f66 ; foEx
    mov qword[0x000b8010], rax
    hlt

ResolveLocaleName:
    ; print `Err: ResolveLocaleName  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f734f654f524f20 ;  Res
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f764f6c4f6f ; olve
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f634f6f4f4c ; Loca
    mov qword[0x000b800c], rax
    mov rax, 0x4f614f4e4f654f6c ; leNa
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f654f6d ; me  
    mov qword[0x000b8014], rax
    hlt

RhGetCodeTarget:
    ; print `Err: RhGetCodeTarget` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[0x000b8004], rax
    mov rax, 0x4f6f4f434f744f65 ; etCo
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f544f654f64 ; deTa
    mov qword[0x000b800c], rax
    mov rax, 0x4f744f654f674f72 ; rget
    mov qword[0x000b8010], rax
    hlt

RhpHandleAllocDependent:
    ; print `Err: RhpHandleAllocDependent` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[0x000b8004], rax
    mov rax, 0x4f644f6e4f614f48 ; Hand
    mov qword[0x000b8008], rax
    mov rax, 0x4f6c4f414f654f6c ; leAl
    mov qword[0x000b800c], rax
    mov rax, 0x4f444f634f6f4f6c ; locD
    mov qword[0x000b8010], rax
    mov rax, 0x4f6e4f654f704f65 ; epen
    mov qword[0x000b8014], rax
    mov rax, 0x4f744f6e4f654f64 ; dent
    mov qword[0x000b8018], rax
    hlt

floor:
    ; print `Err: floor  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6f4f6c4f664f20 ;  flo
    mov qword[0x000b8004], rax
    mov rax, 0x4f204f204f724f6f ; or  
    mov qword[0x000b8008], rax
    hlt

fmod:
    ; print `Err: fmod   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6f4f6d4f664f20 ;  fmo
    mov qword[0x000b8004], rax
    mov rax, 0x4f204f204f204f64 ; d   
    mov qword[0x000b8008], rax
    hlt

_ecvt_s:
    ; print `Err: _ecvt_s` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f634f654f5f4f20 ;  _ec
    mov qword[0x000b8004], rax
    mov rax, 0x4f734f5f4f744f76 ; vt_s
    mov qword[0x000b8008], rax
    hlt

EnumCalendarInfoExEx:
    ; print `Err: EnumCalendarInfoExEx   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f754f6e4f454f20 ;  Enu
    mov qword[0x000b8004], rax
    mov rax, 0x4f6c4f614f434f6d ; mCal
    mov qword[0x000b8008], rax
    mov rax, 0x4f614f644f6e4f65 ; enda
    mov qword[0x000b800c], rax
    mov rax, 0x4f664f6e4f494f72 ; rInf
    mov qword[0x000b8010], rax
    mov rax, 0x4f454f784f454f6f ; oExE
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f204f78 ; x   
    mov qword[0x000b8018], rax
    hlt

CompareStringOrdinal:
    ; print `Err: CompareStringOrdinal   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f6d4f6f4f434f20 ;  Com
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f724f614f70 ; pare
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[0x000b800c], rax
    mov rax, 0x4f724f4f4f674f6e ; ngOr
    mov qword[0x000b8010], rax
    mov rax, 0x4f614f6e4f694f64 ; dina
    mov qword[0x000b8014], rax
    mov rax, 0x4f204f204f204f6c ; l   
    mov qword[0x000b8018], rax
    hlt

RhCompatibleReentrantWaitAny:
    ; print `Err: RhCompatibleReentrantWaitAny   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f434f684f524f20 ;  RhC
    mov qword[0x000b8004], rax
    mov rax, 0x4f614f704f6d4f6f ; ompa
    mov qword[0x000b8008], rax
    mov rax, 0x4f6c4f624f694f74 ; tibl
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f654f524f65 ; eRee
    mov qword[0x000b8010], rax
    mov rax, 0x4f614f724f744f6e ; ntra
    mov qword[0x000b8014], rax
    mov rax, 0x4f614f574f744f6e ; ntWa
    mov qword[0x000b8018], rax
    mov rax, 0x4f6e4f414f744f69 ; itAn
    mov qword[0x000b801c], rax
    mov rax, 0x4f204f204f204f79 ; y   
    mov qword[0x000b8020], rax
    hlt

WaitForMultipleObjectsEx:
    ; print `Err: WaitForMultipleObjectsEx   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f694f614f574f20 ;  Wai
    mov qword[0x000b8004], rax
    mov rax, 0x4f724f6f4f464f74 ; tFor
    mov qword[0x000b8008], rax
    mov rax, 0x4f744f6c4f754f4d ; Mult
    mov qword[0x000b800c], rax
    mov rax, 0x4f654f6c4f704f69 ; iple
    mov qword[0x000b8010], rax
    mov rax, 0x4f654f6a4f624f4f ; Obje
    mov qword[0x000b8014], rax
    mov rax, 0x4f454f734f744f63 ; ctsE
    mov qword[0x000b8018], rax
    mov rax, 0x4f204f204f204f78 ; x   
    mov qword[0x000b801c], rax
    hlt

EnumTimeFormatsEx:
    ; print `Err: EnumTimeFormatsEx  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f754f6e4f454f20 ;  Enu
    mov qword[0x000b8004], rax
    mov rax, 0x4f6d4f694f544f6d ; mTim
    mov qword[0x000b8008], rax
    mov rax, 0x4f724f6f4f464f65 ; eFor
    mov qword[0x000b800c], rax
    mov rax, 0x4f734f744f614f6d ; mats
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f784f45 ; Ex  
    mov qword[0x000b8014], rax
    hlt

CoGetApartmentType:
    ; print `Err: CoGetApartmentType ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f474f6f4f434f20 ;  CoG
    mov qword[0x000b8004], rax
    mov rax, 0x4f704f414f744f65 ; etAp
    mov qword[0x000b8008], rax
    mov rax, 0x4f6d4f744f724f61 ; artm
    mov qword[0x000b800c], rax
    mov rax, 0x4f544f744f6e4f65 ; entT
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f654f704f79 ; ype 
    mov qword[0x000b8014], rax
    hlt

GetCalendarInfoEx:
    ; print `Err: GetCalendarInfoEx  ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[0x000b8004], rax
    mov rax, 0x4f654f6c4f614f43 ; Cale
    mov qword[0x000b8008], rax
    mov rax, 0x4f724f614f644f6e ; ndar
    mov qword[0x000b800c], rax
    mov rax, 0x4f6f4f664f6e4f49 ; Info
    mov qword[0x000b8010], rax
    mov rax, 0x4f204f204f784f45 ; Ex  
    mov qword[0x000b8014], rax
    hlt

CoCreateGuid:
    ; print `Err: CoCreateGuid   ` to screen
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[0x000b8000], rax
    mov rax, 0x4f434f6f4f434f20 ;  CoC
    mov qword[0x000b8004], rax
    mov rax, 0x4f744f614f654f72 ; reat
    mov qword[0x000b8008], rax
    mov rax, 0x4f694f754f474f65 ; eGui
    mov qword[0x000b800c], rax
    mov rax, 0x4f204f204f204f64 ; d   
    mov qword[0x000b8010], rax
    hlt

