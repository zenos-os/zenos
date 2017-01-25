global __fail_fast
global __not_yet_implemented
global _ecvt_s
global CloseHandle
global CoCreateGuid
global CoGetApartmentType
global CompareStringEx
global CompareStringOrdinal
global CreateEventExW
global EnumCalendarInfoExEx
global EnumTimeFormatsEx
global floor
global fmod
global GetCalendarInfoEx
global GetCurrentThreadId
global GetLastError
global GetLocaleInfoEx
global GetNativeSystemInfo
global GetProcessHeap
global GetTickCount64
global HeapAlloc
global IsDebuggerPresent
global LCMapStringEx
global memcpy
global memmove
global memset
global OutputDebugStringW
global PalGetTickCount64
global RaiseFailFastException
global ResolveLocaleName
global RhCompatibleReentrantWaitAny
global RhFindMethodStartAddress
global RhGetCodeTarget
global RhGetExceptionsForCurrentThread
global RhGetGenericInstantiation
global RhGetModuleFileName
global RhGetModuleFromEEType
global RhGetModuleFromPointer
global RhGetThreadLocalStorageForDynamicType
global RhHandleFree
global RhHandleGet
global RhHandleGetDependent
global RhHandleSet
global RhpAcquireCastCacheLock
global RhpArrayCopy
global RhpAssignRef
global RhpBox
global RhpByRefAssignRef
global RhpCallCatchFunclet
global RhpCallFilterFunclet
global RhpCallFinallyFunclet
global RhpCheckedAssignRef
global RhpCheckedLockCmpXchg
global RhpCheckedXchg
global RhpCollect
global RhpCopyContextFromExInfo
global RhpCopyObjectContents
global RhpCreateModuleManager
global RhpDbl2ULng
global RhpEHEnumInitFromStackFrameIterator
global RhpEHEnumNext
global RhpEtwExceptionThrown
global RhpFallbackFailFast
global RhpGetClasslibFunction
global RhpGetCurrentThreadStackTrace
global RhpGetDispatchCellInfo
global RhpGetDispatchMap
global RhpGetGcTotalMemory
global RhpGetModuleSection
global RhpGetNextFinalizableObject
global RhpGetNextFinalizerInitCallback
global RhpGetRequestedExceptionEvents
global RhpHandleAlloc
global RhpHandleAllocDependent
global RhpInitialDynamicInterfaceDispatch
global RhpPInvoke
global RhpPInvokeReturn
global RhpReleaseCastCacheLock
global RhpReversePInvoke2
global RhpReversePInvokeReturn2
global RhpSearchDispatchCellCache
global RhpSendExceptionEventToDebugger
global RhpSetThreadDoNotTriggerGC
global RhpSfiInit
global RhpSfiNext
global RhpSignalFinalizationComplete
global RhpThrowEx
global RhpUpdateDispatchCellCache
global RhpValidateExInfoStack
global RhpWaitForFinalizerRequest
global RhSetErrorInfoBuffer
global RhSpinWait
global RhSuppressFinalize
global RhUnbox
global SetEvent
global WaitForMultipleObjectsEx
global RhpGetCastableObjectDispatchHelper
global RhpGetCastableObjectDispatchHelper_TailCalled
global RhpSetTLSDispatchCell
global RhpGetTailCallTLSDispatchCell
global RhpGetThunkSize
global RhpCreateTypeManager
global RhpAcquireThunkPoolLock
global RhpReleaseThunkPoolLock
global RhpGetThunkStubsBlockAddress
global RhpGetCastableObjectDispatch_CommonStub
global RhpGetThunkDataBlockAddress
global RhpRegisterFrozenSegment
global RhpGetNumThunksPerBlock
global RhpGetNumThunkBlocksPerMapping
global RhAllocateThunksMapping
global RhpGetNextThunkStubsBlockAddress
global RhGetThreadStaticStorageForModule
global RhSetThreadStaticStorageForModule
global RhDebugBreak
global SetLastError
global RhReRegisterForFinalize
global pow
global FindNLSStringEx
global GetSystemTimeAsFileTime
global GetDynamicTimeZoneInformation
global RegQueryValueExW
global RegCloseKey
global RegEnumValueW
global RegEnumKeyExW
global RegQueryInfoKeyW
global cos
global sin
global GetSystemDirectoryW
global GetFileMUIPath
global LoadLibraryExW
global LoadStringW
global FormatMessageW
global tan
global FreeLibrary
global RhpGcAlloc
global RhpValidateExInfoPop
global RhpWaitForSuspend2
global RhpWaitForGC2
global RhpReversePInvokeAttachOrTrapThread2
global RhpPublishObject

section .data
console_row:  db 0
errors:  db 0

section .text
bits 64

set_cursor:
    mov rbx, [console_row]
    imul rbx, 160
    add rbx, 0xb8000
    ret

next_console_row_ignore:
    inc byte [console_row]
    ret

next_console_row:
    inc byte [console_row]
    inc byte [errors]
    cmp byte [errors], 3
    ja .quit
    ret
.quit:
    jmp .quit

__fail_fast:
    ; print `Err: __fail_fast` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f664f5f4f5f4f20 ;  __f
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f5f4f6c4f694f61 ; ail_
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f734f614f66 ; fast
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

__not_yet_implemented:
    ; print `Err: __not_yet_implemented  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6e4f5f4f5f4f20 ;  __n
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f794f5f4f744f6f ; ot_y
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f5f4f744f65 ; et_i
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f6c4f704f6d ; mple
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f6e4f654f6d ; ment
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f644f65 ; ed  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

_ecvt_s:
    ; print `Err: _ecvt_s` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f634f654f5f4f20 ;  _ec
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f734f5f4f744f76 ; vt_s
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

CloseHandle:
    ; print `Err: CloseHandle` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6f4f6c4f434f20 ;  Clo
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f484f654f73 ; seHa
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f6c4f644f6e ; ndle
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

CoCreateGuid:
    ; print `Err: CoCreateGuid   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f434f6f4f434f20 ;  CoC
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f614f654f72 ; reat
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f754f474f65 ; eGui
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f64 ; d   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

CoGetApartmentType:
    ; print `Err: CoGetApartmentType ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f6f4f434f20 ;  CoG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f704f414f744f65 ; etAp
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6d4f744f724f61 ; artm
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f544f744f6e4f65 ; entT
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f654f704f79 ; ype 
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

CompareStringEx:
    ; print `Err: CompareStringEx` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6d4f6f4f434f20 ;  Com
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f724f614f70 ; pare
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f784f454f674f6e ; ngEx
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

CompareStringOrdinal:
    ; print `Err: CompareStringOrdinal   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6d4f6f4f434f20 ;  Com
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f724f614f70 ; pare
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f724f4f4f674f6e ; ngOr
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f614f6e4f694f64 ; dina
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f6c ; l   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

CreateEventExW:
    ; print `Err: CreateEventExW ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f654f724f434f20 ;  Cre
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f454f654f744f61 ; ateE
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f6e4f654f76 ; vent
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f574f784f45 ; ExW 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

EnumCalendarInfoExEx:
    ; print `Err: EnumCalendarInfoExEx   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f754f6e4f454f20 ;  Enu
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f614f434f6d ; mCal
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f644f6e4f65 ; enda
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f664f6e4f494f72 ; rInf
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f454f784f454f6f ; oExE
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f78 ; x   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

EnumTimeFormatsEx:
    ; print `Err: EnumTimeFormatsEx  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f754f6e4f454f20 ;  Enu
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6d4f694f544f6d ; mTim
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f724f6f4f464f65 ; eFor
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f734f744f614f6d ; mats
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f784f45 ; Ex  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

floor:
    ; print `Err: floor  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6f4f6c4f664f20 ;  flo
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f204f204f724f6f ; or  
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

fmod:
    ; print `Err: fmod   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6f4f6d4f664f20 ;  fmo
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f204f204f204f64 ; d   
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

GetCalendarInfoEx:
    ; print `Err: GetCalendarInfoEx  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f6c4f614f43 ; Cale
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f724f614f644f6e ; ndar
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6f4f664f6e4f49 ; Info
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f784f45 ; Ex  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

GetCurrentThreadId:
    ; print `Err: GetCurrentThreadId ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f724f754f43 ; Curr
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f544f744f6e4f65 ; entT
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f614f654f724f68 ; hrea
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f644f494f64 ; dId 
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

GetLastError:
    ; print `Err: GetLastError   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f734f614f4c ; Last
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6f4f724f724f45 ; Erro
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f72 ; r   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

GetLocaleInfoEx:
    ; print `Err: GetLocaleInfoEx` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f634f6f4f4c ; Loca
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6e4f494f654f6c ; leIn
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f784f454f6f4f66 ; foEx
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

GetNativeSystemInfo:
    ; print `Err: GetNativeSystemInfo` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f694f744f614f4e ; Nati
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f794f534f654f76 ; veSy
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6d4f654f744f73 ; stem
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6f4f664f6e4f49 ; Info
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

GetProcessHeap:
    ; print `Err: GetProcessHeap ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f634f6f4f724f50 ; Proc
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f484f734f734f65 ; essH
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f704f614f65 ; eap 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

GetTickCount64:
    ; print `Err: GetTickCount64 ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6b4f634f694f54 ; Tick
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6e4f754f6f4f43 ; Coun
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f344f364f74 ; t64 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

HeapAlloc:
    ; print `Err: HeapAlloc  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f614f654f484f20 ;  Hea
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f6c4f414f70 ; pAll
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f204f634f6f ; oc  
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

IsDebuggerPresent:
    ; print `Err: IsDebuggerPresent  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f444f734f494f20 ;  IsD
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f674f754f624f65 ; ebug
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f504f724f654f67 ; gerP
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f734f654f72 ; rese
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f744f6e ; nt  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

LCMapStringEx:
    ; print `Err: LCMapStringEx  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f4d4f434f4c4f20 ;  LCM
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f534f704f61 ; apSt
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f674f6e4f694f72 ; ring
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f784f45 ; Ex  
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

memcpy:
    ; print `Err: memcpy ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6d4f654f6d4f20 ;  mem
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f204f794f704f63 ; cpy 
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

memmove:
    ; print `Err: memmove` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6d4f654f6d4f20 ;  mem
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f764f6f4f6d ; move
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

memset:
    ; print `Err: memset ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6d4f654f6d4f20 ;  mem
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f204f744f654f73 ; set 
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

OutputDebugStringW:
    ; print `Err: OutputDebugStringW ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f754f4f4f20 ;  Out
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f444f744f754f70 ; putD
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f674f754f624f65 ; ebug
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f574f674f6e ; ngW 
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

PalGetTickCount64:
    ; print `Err: PalGetTickCount64  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6c4f614f504f20 ;  Pal
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f47 ; GetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f434f6b4f634f69 ; ickC
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f6e4f754f6f ; ount
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f344f36 ; 64  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RaiseFailFastException:
    ; print `Err: RaiseFailFastException ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f694f614f524f20 ;  Rai
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f464f654f73 ; seFa
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f464f6c4f69 ; ilFa
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f784f454f744f73 ; stEx
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f704f654f63 ; cept
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f6e4f6f4f69 ; ion 
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

ResolveLocaleName:
    ; print `Err: ResolveLocaleName  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f734f654f524f20 ;  Res
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f764f6c4f6f ; olve
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f634f6f4f4c ; Loca
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f614f4e4f654f6c ; leNa
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f654f6d ; me  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhCompatibleReentrantWaitAny:
    ; print `Err: RhCompatibleReentrantWaitAny   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f434f684f524f20 ;  RhC
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f704f6d4f6f ; ompa
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6c4f624f694f74 ; tibl
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f654f524f65 ; eRee
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f614f724f744f6e ; ntra
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f614f574f744f6e ; ntWa
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f6e4f414f744f69 ; itAn
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f204f204f79 ; y   
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhFindMethodStartAddress:
    ; print `Err: RhFindMethodStartAddress   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f464f684f524f20 ;  RhF
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4d4f644f6e4f69 ; indM
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6f4f684f744f65 ; etho
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f614f744f534f64 ; dSta
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f644f414f744f72 ; rtAd
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f734f654f724f64 ; dres
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f204f204f73 ; s   
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhGetCodeTarget:
    ; print `Err: RhGetCodeTarget` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6f4f434f744f65 ; etCo
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f544f654f64 ; deTa
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f654f674f72 ; rget
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhGetExceptionsForCurrentThread:
    ; print `Err: RhGetExceptionsForCurrentThread` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f784f454f744f65 ; etEx
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f704f654f63 ; cept
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f734f6e4f6f4f69 ; ions
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f434f724f6f4f46 ; ForC
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f654f724f724f75 ; urre
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f684f544f744f6e ; ntTh
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhGetGenericInstantiation:
    ; print `Err: RhGetGenericInstantiation  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f474f744f65 ; etGe
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f724f654f6e ; neri
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f734f6e4f494f63 ; cIns
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f6e4f614f74 ; tant
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f694f744f614f69 ; iati
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f204f6e4f6f ; on  
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhGetModuleFileName:
    ; print `Err: RhGetModuleFileName` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6f4f4d4f744f65 ; etMo
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f6c4f694f46 ; File
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f6d4f614f4e ; Name
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhGetModuleFromEEType:
    ; print `Err: RhGetModuleFromEEType  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6f4f4d4f744f65 ; etMo
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6d4f6f4f724f46 ; From
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f794f544f454f45 ; EETy
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f654f70 ; pe  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhGetModuleFromPointer:
    ; print `Err: RhGetModuleFromPointer ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6f4f4d4f744f65 ; etMo
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6d4f6f4f724f46 ; From
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6e4f694f6f4f50 ; Poin
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f724f654f74 ; ter 
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhGetThreadLocalStorageForDynamicType:
    ; print `Err: RhGetThreadLocalStorageForDynamicType  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f684f544f744f65 ; etTh
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f614f634f6f4f4c ; Loca
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6f4f744f534f6c ; lSto
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f654f674f614f72 ; rage
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f444f724f6f4f46 ; ForD
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f6d4f614f6e4f79 ; ynam
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f794f544f634f69 ; icTy
    mov qword[rbx + 0x0048], rax
    mov rax, 0x4f204f204f654f70 ; pe  
    mov qword[rbx + 0x0050], rax
    call next_console_row
    ret

RhHandleFree:
    ; print `Err: RhHandleFree   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f724f464f65 ; eFre
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f65 ; e   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhHandleGet:
    ; print `Err: RhHandleGet` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f654f474f65 ; eGet
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhHandleGetDependent:
    ; print `Err: RhHandleGetDependent   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f654f474f65 ; eGet
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f704f654f44 ; Depe
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6e4f654f644f6e ; nden
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhHandleSet:
    ; print `Err: RhHandleSet` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f484f684f524f20 ;  RhH
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f644f6e4f61 ; andl
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f654f534f65 ; eSet
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpAcquireCastCacheLock:
    ; print `Err: RhpAcquireCastCacheLock` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f754f714f634f41 ; Acqu
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f434f654f724f69 ; ireC
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f434f744f734f61 ; astC
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f684f634f61 ; ache
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6b4f634f6f4f4c ; Lock
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpArrayCopy:
    ; print `Err: RhpArrayCopy   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f724f724f41 ; Arra
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f704f6f4f434f79 ; yCop
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f79 ; y   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpAssignRef:
    ; print `Err: RhpAssignRef   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f694f734f734f41 ; Assi
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f524f6e4f67 ; gnRe
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f66 ; f   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpBox:
    ; print `Err: RhpBox ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f204f784f6f4f42 ; Box 
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

RhpByRefAssignRef:
    ; print `Err: RhpByRefAssignRef  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f524f794f42 ; ByRe
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f734f734f414f66 ; fAss
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f524f6e4f674f69 ; ignR
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f664f65 ; ef  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpCallCatchFunclet:
    ; print `Err: RhpCallCatchFunclet` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f634f744f614f43 ; Catc
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6e4f754f464f68 ; hFun
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f654f6c4f63 ; clet
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpCallFilterFunclet:
    ; print `Err: RhpCallFilterFunclet   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f6c4f694f46 ; Filt
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f754f464f724f65 ; erFu
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f6c4f634f6e ; ncle
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpCallFinallyFunclet:
    ; print `Err: RhpCallFinallyFunclet  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f6e4f694f46 ; Fina
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f464f794f6c4f6c ; llyF
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6c4f634f6e4f75 ; uncl
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f744f65 ; et  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpCheckedAssignRef:
    ; print `Err: RhpCheckedAssignRef` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f634f654f684f43 ; Chec
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f414f644f654f6b ; kedA
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f674f694f734f73 ; ssig
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f664f654f524f6e ; nRef
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpCheckedLockCmpXchg:
    ; print `Err: RhpCheckedLockCmpXchg  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f634f654f684f43 ; Chec
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f4c4f644f654f6b ; kedL
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f434f6b4f634f6f ; ockC
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f634f584f704f6d ; mpXc
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f674f68 ; hg  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpCheckedXchg:
    ; print `Err: RhpCheckedXchg ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f634f654f684f43 ; Chec
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f584f644f654f6b ; kedX
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f674f684f63 ; chg 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpCollect:
    ; print `Err: RhpCollect ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f6c4f6f4f43 ; Coll
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f744f634f65 ; ect 
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpCopyContextFromExInfo:
    ; print `Err: RhpCopyContextFromExInfo   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f794f704f6f4f43 ; Copy
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f6e4f6f4f43 ; Cont
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f464f744f784f65 ; extF
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f454f6d4f6f4f72 ; romE
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f664f6e4f494f78 ; xInf
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f204f204f6f ; o   
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpCopyObjectContents:
    ; print `Err: RhpCopyObjectContents  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f794f704f6f4f43 ; Copy
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f6a4f624f4f ; Obje
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6f4f434f744f63 ; ctCo
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6e4f654f744f6e ; nten
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f734f74 ; ts  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpCreateModuleManager:
    ; print `Err: RhpCreateModuleManager ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f654f724f43 ; Crea
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6f4f4d4f654f74 ; teMo
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f6c4f754f64 ; dule
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f614f6e4f614f4d ; Mana
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f724f654f67 ; ger 
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpDbl2ULng:
    ; print `Err: RhpDbl2ULng` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f324f6c4f624f44 ; Dbl2
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f674f6e4f4c4f55 ; ULng
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpEHEnumInitFromStackFrameIterator:
    ; print `Err: RhpEHEnumInitFromStackFrameIterator` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6e4f454f484f45 ; EHEn
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6e4f494f6d4f75 ; umIn
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f724f464f744f69 ; itFr
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f534f6d4f6f ; omSt
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f464f6b4f634f61 ; ackF
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f654f6d4f614f72 ; rame
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f724f654f744f49 ; Iter
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f724f6f4f744f61 ; ator
    mov qword[rbx + 0x0048], rax
    call next_console_row
    ret

RhpEHEnumNext:
    ; print `Err: RhpEHEnumNext  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6e4f454f484f45 ; EHEn
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f4e4f6d4f75 ; umNe
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f744f78 ; xt  
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpEtwExceptionThrown:
    ; print `Err: RhpEtwExceptionThrown  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f454f774f744f45 ; EtwE
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f704f654f634f78 ; xcep
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6e4f6f4f694f74 ; tion
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6f4f724f684f54 ; Thro
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f6e4f77 ; wn  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpFallbackFailFast:
    ; print `Err: RhpFallbackFailFast` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f6c4f614f46 ; Fall
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6b4f634f614f62 ; back
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6c4f694f614f46 ; Fail
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f734f614f46 ; Fast
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpGetClasslibFunction:
    ; print `Err: RhpGetClasslibFunction ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f734f734f614f6c ; lass
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f464f624f694f6c ; libF
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f634f6e4f75 ; unct
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f6e4f6f4f69 ; ion 
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpGetCurrentThreadStackTrace:
    ; print `Err: RhpGetCurrentThreadStackTrace  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f724f724f75 ; urre
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f684f544f744f6e ; ntTh
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f634f614f744f53 ; Stac
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f614f724f544f6b ; kTra
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f204f654f63 ; ce  
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpGetDispatchCellInfo:
    ; print `Err: RhpGetDispatchCellInfo ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f444f744f654f47 ; GetD
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f704f734f69 ; ispa
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f434f684f634f74 ; tchC
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f494f6c4f6c4f65 ; ellI
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f6f4f664f6e ; nfo 
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpGetDispatchMap:
    ; print `Err: RhpGetDispatchMap  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f444f744f654f47 ; GetD
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f704f734f69 ; ispa
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f4d4f684f634f74 ; tchM
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f704f61 ; ap  
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpGetGcTotalMemory:
    ; print `Err: RhpGetGcTotalMemory` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f474f744f654f47 ; GetG
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f6f4f544f63 ; cTot
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f4d4f6c4f61 ; alMe
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f794f724f6f4f6d ; mory
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpGetModuleSection:
    ; print `Err: RhpGetModuleSection` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4d4f744f654f47 ; GetM
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6c4f754f644f6f ; odul
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f634f654f534f65 ; eSec
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6e4f6f4f694f74 ; tion
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpGetNextFinalizableObject:
    ; print `Err: RhpGetNextFinalizableObject` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f464f744f784f65 ; extF
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f624f614f7a4f69 ; izab
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f624f4f4f654f6c ; leOb
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f744f634f654f6a ; ject
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpGetNextFinalizerInitCallback:
    ; print `Err: RhpGetNextFinalizerInitCallback` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f464f744f784f65 ; extF
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f724f654f7a4f69 ; izer
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f744f694f6e4f49 ; Init
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f6b4f634f614f62 ; back
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpGetRequestedExceptionEvents:
    ; print `Err: RhpGetRequestedExceptionEvents ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f524f744f654f47 ; GetR
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f754f714f65 ; eque
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f644f654f744f73 ; sted
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f634f784f45 ; Exce
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6f4f694f744f70 ; ptio
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f654f764f454f6e ; nEve
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f734f744f6e ; nts 
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpHandleAlloc:
    ; print `Err: RhpHandleAlloc ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f644f6e4f614f48 ; Hand
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6c4f414f654f6c ; leAl
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f634f6f4f6c ; loc 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpHandleAllocDependent:
    ; print `Err: RhpHandleAllocDependent` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f644f6e4f614f48 ; Hand
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6c4f414f654f6c ; leAl
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f444f634f6f4f6c ; locD
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6e4f654f704f65 ; epen
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f744f6e4f654f64 ; dent
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpInitialDynamicInterfaceDispatch:
    ; print `Err: RhpInitialDynamicInterfaceDispatch ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f694f6e4f49 ; Init
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f444f6c4f614f69 ; ialD
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6d4f614f6e4f79 ; ynam
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6e4f494f634f69 ; icIn
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f664f724f654f74 ; terf
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f444f654f634f61 ; aceD
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f614f704f734f69 ; ispa
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f204f684f634f74 ; tch 
    mov qword[rbx + 0x0048], rax
    call next_console_row
    ret

RhpPInvoke:
    ; print `Err: RhpPInvoke ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f764f6e4f494f50 ; PInv
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f654f6b4f6f ; oke 
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpPInvokeReturn:
    ; print `Err: RhpPInvokeReturn   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f764f6e4f494f50 ; PInv
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f524f654f6b4f6f ; okeR
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f724f754f744f65 ; etur
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f204f6e ; n   
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpReleaseCastCacheLock:
    ; print `Err: RhpReleaseCastCacheLock` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f6c4f654f52 ; Rele
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f434f654f734f61 ; aseC
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f434f744f734f61 ; astC
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f684f634f61 ; ache
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6b4f634f6f4f4c ; Lock
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpReversePInvoke2:
    ; print `Err: RhpReversePInvoke2 ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f764f654f52 ; Reve
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f504f654f734f72 ; rseP
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6f4f764f6e4f49 ; Invo
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f324f654f6b ; ke2
    mov qword[rbx + 0x0028], rax
    call next_console_row_ignore
    ret

RhpReversePInvokeReturn2:
    ; print `Err: RhpReversePInvokeReturn2   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f764f654f52 ; Reve
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f504f654f734f72 ; rseP
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6f4f764f6e4f49 ; Invo
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f524f654f6b ; keRe
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6e4f724f754f74 ; turn
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f204f204f32 ; 2   
    mov qword[rbx + 0x0038], rax
    call next_console_row_ignore
    ret

RhpSearchDispatchCellCache:
    ; print `Err: RhpSearchDispatchCellCache ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f614f654f53 ; Sear
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f444f684f63 ; chDi
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f614f704f73 ; spat
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f434f684f63 ; chCe
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f614f434f6c4f6c ; llCa
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f654f684f63 ; che 
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpSendExceptionEventToDebugger:
    ; print `Err: RhpSendExceptionEventToDebugger` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f644f6e4f654f53 ; Send
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f634f784f45 ; Exce
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6f4f694f744f70 ; ptio
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f764f454f6e ; nEve
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6f4f544f744f6e ; ntTo
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f754f624f654f44 ; Debu
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f724f654f674f67 ; gger
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpSetThreadDoNotTriggerGC:
    ; print `Err: RhpSetThreadDoNotTriggerGC ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f53 ; SetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f654f724f68 ; hrea
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f4e4f6f4f444f64 ; dDoN
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f724f544f744f6f ; otTr
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f654f674f674f69 ; igge
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f434f474f72 ; rGC 
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpSfiInit:
    ; print `Err: RhpSfiInit ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f494f694f664f53 ; SfiI
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f744f694f6e ; nit 
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpSfiNext:
    ; print `Err: RhpSfiNext ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4e4f694f664f53 ; SfiN
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f744f784f65 ; ext 
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpSignalFinalizationComplete:
    ; print `Err: RhpSignalFinalizationComplete  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6e4f674f694f53 ; Sign
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f464f6c4f61 ; alFi
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f694f6c4f614f6e ; nali
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f694f744f614f7a ; zati
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6f4f434f6e4f6f ; onCo
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f654f6c4f704f6d ; mple
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f204f654f74 ; te  
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpThrowEx:
    ; print `Err: RhpThrowEx ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6f4f724f684f54 ; Thro
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f784f454f77 ; wEx 
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpUpdateDispatchCellCache:
    ; print `Err: RhpUpdateDispatchCellCache ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f644f704f55 ; Upda
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f444f654f74 ; teDi
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f614f704f73 ; spat
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f434f684f63 ; chCe
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f614f434f6c4f6c ; llCa
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f654f684f63 ; che 
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpValidateExInfoStack:
    ; print `Err: RhpValidateExInfoStack ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f694f6c4f614f56 ; Vali
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f744f614f64 ; date
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6e4f494f784f45 ; ExIn
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f534f6f4f66 ; foSt
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f6b4f634f61 ; ack
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpWaitForFinalizerRequest:
    ; print `Err: RhpWaitForFinalizerRequest ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f694f614f57 ; Wait
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f464f724f6f4f46 ; ForF
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f724f654f7a4f69 ; izer
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f754f714f654f52 ; Requ
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f744f734f65 ; est 
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhSetErrorInfoBuffer:
    ; print `Err: RhSetErrorInfoBuffer   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f454f744f65 ; etEr
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f494f724f6f4f72 ; rorI
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f424f6f4f664f6e ; nfoB
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f664f664f75 ; uffe
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f72 ; r   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhSpinWait:
    ; print `Err: RhSpinWait ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f574f6e4f694f70 ; pinW
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f744f694f61 ; ait 
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhSuppressFinalize:
    ; print `Err: RhSuppressFinalize ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f704f704f75 ; uppr
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f464f734f734f65 ; essF
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6c4f614f6e4f69 ; inal
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f654f7a4f69 ; ize 
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhUnbox:
    ; print `Err: RhUnbox` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f554f684f524f20 ;  RhU
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f784f6f4f624f6e ; nbox
    mov qword[rbx + 0x0010], rax
    call next_console_row
    ret

SetEvent:
    ; print `Err: SetEvent   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f534f20 ;  Set
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6e4f654f764f45 ; Even
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

WaitForMultipleObjectsEx:
    ; print `Err: WaitForMultipleObjectsEx   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f694f614f574f20 ;  Wai
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f6f4f464f74 ; tFor
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f744f6c4f754f4d ; Mult
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f6c4f704f69 ; iple
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f6a4f624f4f ; Obje
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f454f734f744f63 ; ctsE
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f204f204f78 ; x   
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpGetCastableObjectDispatchHelper:
    ; print `Err: RhpGetCastableObjectDispatchHelper ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f744f734f61 ; asta
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f4f4f654f6c4f62 ; bleO
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f634f654f6a4f62 ; bjec
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f734f694f444f74 ; tDis
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f634f744f614f70 ; patc
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f6c4f654f484f68 ; hHel
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f204f724f654f70 ; per 
    mov qword[rbx + 0x0048], rax
    call next_console_row
    ret

RhpGetCastableObjectDispatchHelper_TailCalled:
    ; print `Err: RhpGetCastableObjectDispatchHelper_TailCalled  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f744f734f61 ; asta
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f4f4f654f6c4f62 ; bleO
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f634f654f6a4f62 ; bjec
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f734f694f444f74 ; tDis
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f634f744f614f70 ; patc
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f6c4f654f484f68 ; hHel
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f5f4f724f654f70 ; per_
    mov qword[rbx + 0x0048], rax
    mov rax, 0x4f6c4f694f614f54 ; Tail
    mov qword[rbx + 0x0050], rax
    mov rax, 0x4f6c4f6c4f614f43 ; Call
    mov qword[rbx + 0x0058], rax
    mov rax, 0x4f204f204f644f65 ; ed  
    mov qword[rbx + 0x0060], rax
    call next_console_row
    ret

RhpSetTLSDispatchCell:
    ; print `Err: RhpSetTLSDispatchCell  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f53 ; SetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f444f534f4c ; LSDi
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f614f704f73 ; spat
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f434f684f63 ; chCe
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f6c4f6c ; ll  
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpGetTailCallTLSDispatchCell:
    ; print `Err: RhpGetTailCallTLSDispatchCell  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f47 ; GetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f434f6c4f694f61 ; ailC
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f544f6c4f6c4f61 ; allT
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f694f444f534f4c ; LSDi
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f744f614f704f73 ; spat
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f654f434f684f63 ; chCe
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f204f6c4f6c ; ll  
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpGetThunkSize:
    ; print `Err: RhpGetThunkSize` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f47 ; GetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f7a4f694f53 ; Size
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpCreateTypeManager:
    ; print `Err: RhpCreateTypeManager   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f654f724f43 ; Crea
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f794f544f654f74 ; teTy
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f614f4d4f654f70 ; peMa
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f674f614f6e ; nage
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f72 ; r   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpAcquireThunkPoolLock:
    ; print `Err: RhpAcquireThunkPoolLock` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f754f714f634f41 ; Acqu
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f544f654f724f69 ; ireT
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6c4f6f4f6f4f50 ; Pool
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6b4f634f6f4f4c ; Lock
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpReleaseThunkPoolLock:
    ; print `Err: RhpReleaseThunkPoolLock` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f6c4f654f52 ; Rele
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f544f654f734f61 ; aseT
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6c4f6f4f6f4f50 ; Pool
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6b4f634f6f4f4c ; Lock
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpGetThunkStubsBlockAddress:
    ; print `Err: RhpGetThunkStubsBlockAddress   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f47 ; GetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f624f754f744f53 ; Stub
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6f4f6c4f424f73 ; sBlo
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f644f414f6b4f63 ; ckAd
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f734f654f724f64 ; dres
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f204f204f73 ; s   
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhpGetCastableObjectDispatch_CommonStub:
    ; print `Err: RhpGetCastableObjectDispatch_CommonStub` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f434f744f654f47 ; GetC
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f744f734f61 ; asta
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f4f4f654f6c4f62 ; bleO
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f634f654f6a4f62 ; bjec
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f734f694f444f74 ; tDis
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f634f744f614f70 ; patc
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f6f4f434f5f4f68 ; h_Co
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f6e4f6f4f6d4f6d ; mmon
    mov qword[rbx + 0x0048], rax
    mov rax, 0x4f624f754f744f53 ; Stub
    mov qword[rbx + 0x0050], rax
    call next_console_row
    ret

RhpGetThunkDataBlockAddress:
    ; print `Err: RhpGetThunkDataBlockAddress` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f544f744f654f47 ; GetT
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f614f744f614f44 ; Data
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f634f6f4f6c4f42 ; Bloc
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f644f644f414f6b ; kAdd
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f734f734f654f72 ; ress
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpRegisterFrozenSegment:
    ; print `Err: RhpRegisterFrozenSegment   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f694f674f654f52 ; Regi
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f724f654f744f73 ; ster
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f7a4f6f4f724f46 ; Froz
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f534f6e4f65 ; enSe
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6e4f654f6d4f67 ; gmen
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[rbx + 0x0038], rax
    call next_console_row
    ret

RhpGetNumThunksPerBlock:
    ; print `Err: RhpGetNumThunksPerBlock` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f684f544f6d4f75 ; umTh
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f734f6b4f6e4f75 ; unks
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f424f724f654f50 ; PerB
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6b4f634f6f4f6c ; lock
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpGetNumThunkBlocksPerMapping:
    ; print `Err: RhpGetNumThunkBlocksPerMapping ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f684f544f6d4f75 ; umTh
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f424f6b4f6e4f75 ; unkB
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6b4f634f6f4f6c ; lock
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f724f654f504f73 ; sPer
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f704f704f614f4d ; Mapp
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f674f6e4f69 ; ing 
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RhAllocateThunksMapping:
    ; print `Err: RhAllocateThunksMapping` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f414f684f524f20 ;  RhA
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f634f6f4f6c4f6c ; lloc
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f544f654f744f61 ; ateT
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f704f614f4d4f73 ; sMap
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f674f6e4f694f70 ; ping
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpGetNextThunkStubsBlockAddress:
    ; print `Err: RhpGetNextThunkStubsBlockAddress   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4e4f744f654f47 ; GetN
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f544f744f784f65 ; extT
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6b4f6e4f754f68 ; hunk
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f624f754f744f53 ; Stub
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f6f4f6c4f424f73 ; sBlo
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f644f414f6b4f63 ; ckAd
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f734f654f724f64 ; dres
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f204f204f204f73 ; s   
    mov qword[rbx + 0x0048], rax
    call next_console_row
    ret

RhGetThreadStaticStorageForModule:
    ; print `Err: RhGetThreadStaticStorageForModule  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f474f684f524f20 ;  RhG
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f684f544f744f65 ; etTh
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f614f744f53 ; Stat
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f534f634f69 ; icSt
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f674f614f724f6f ; orag
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f724f6f4f464f65 ; eFor
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f754f644f6f4f4d ; Modu
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f204f204f654f6c ; le  
    mov qword[rbx + 0x0048], rax
    call next_console_row
    ret

RhSetThreadStaticStorageForModule:
    ; print `Err: RhSetThreadStaticStorageForModule  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f534f684f524f20 ;  RhS
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f684f544f744f65 ; etTh
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f614f744f53 ; Stat
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f534f634f69 ; icSt
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f674f614f724f6f ; orag
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f724f6f4f464f65 ; eFor
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f754f644f6f4f4d ; Modu
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f204f204f654f6c ; le  
    mov qword[rbx + 0x0048], rax
    call next_console_row
    ret

RhDebugBreak:
    ; print `Err: RhDebugBreak   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f444f684f524f20 ;  RhD
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f674f754f624f65 ; ebug
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f654f724f42 ; Brea
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f6b ; k   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

SetLastError:
    ; print `Err: SetLastError   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f534f20 ;  Set
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f734f614f4c ; Last
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6f4f724f724f45 ; Erro
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f204f72 ; r   
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhReRegisterForFinalize:
    ; print `Err: RhReRegisterForFinalize` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f524f684f524f20 ;  RhR
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f674f654f524f65 ; eReg
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f744f734f69 ; iste
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f724f6f4f464f72 ; rFor
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f614f6e4f694f46 ; Fina
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f654f7a4f694f6c ; lize
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

pow:
    ; print `Err: pow` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f774f6f4f704f20 ;  pow
    mov qword[rbx + 0x0008], rax
    call next_console_row
    ret

FindNLSStringEx:
    ; print `Err: FindNLSStringEx` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6e4f694f464f20 ;  Fin
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f534f4c4f4e4f64 ; dNLS
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f724f744f53 ; Stri
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f784f454f674f6e ; ngEx
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

GetSystemTimeAsFileTime:
    ; print `Err: GetSystemTimeAsFileTime` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f734f794f53 ; Syst
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f544f6d4f65 ; emTi
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f734f414f654f6d ; meAs
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f654f6c4f694f46 ; File
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f654f6d4f694f54 ; Time
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

GetDynamicTimeZoneInformation:
    ; print `Err: GetDynamicTimeZoneInformation  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f614f6e4f794f44 ; Dyna
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f544f634f694f6d ; micT
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f5a4f654f6d4f69 ; imeZ
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f494f654f6e4f6f ; oneI
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f724f6f4f664f6e ; nfor
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f694f744f614f6d ; mati
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f204f204f6e4f6f ; on  
    mov qword[rbx + 0x0040], rax
    call next_console_row
    ret

RegQueryValueExW:
    ; print `Err: RegQueryValueExW   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f674f654f524f20 ;  Reg
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f654f754f51 ; Quer
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f6c4f614f564f79 ; yVal
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f784f454f654f75 ; ueEx
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f204f57 ; W   
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RegCloseKey:
    ; print `Err: RegCloseKey` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f674f654f524f20 ;  Reg
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f734f6f4f6c4f43 ; Clos
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f794f654f4b4f65 ; eKey
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RegEnumValueW:
    ; print `Err: RegEnumValueW  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f674f654f524f20 ;  Reg
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6d4f754f6e4f45 ; Enum
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f754f6c4f614f56 ; Valu
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f574f65 ; eW  
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RegEnumKeyExW:
    ; print `Err: RegEnumKeyExW  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f674f654f524f20 ;  Reg
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6d4f754f6e4f45 ; Enum
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f454f794f654f4b ; KeyE
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f574f78 ; xW  
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RegQueryInfoKeyW:
    ; print `Err: RegQueryInfoKeyW   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f674f654f524f20 ;  Reg
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f654f754f51 ; Quer
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f664f6e4f494f79 ; yInf
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f794f654f4b4f6f ; oKey
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f204f57 ; W   
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

cos:
    ; print `Err: cos` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f734f6f4f634f20 ;  cos
    mov qword[rbx + 0x0008], rax
    call next_console_row
    ret

sin:
    ; print `Err: sin` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6e4f694f734f20 ;  sin
    mov qword[rbx + 0x0008], rax
    call next_console_row
    ret

GetSystemDirectoryW:
    ; print `Err: GetSystemDirectoryW` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f734f794f53 ; Syst
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f694f444f6d4f65 ; emDi
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f744f634f654f72 ; rect
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f574f794f724f6f ; oryW
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

GetFileMUIPath:
    ; print `Err: GetFileMUIPath ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f744f654f474f20 ;  Get
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f6c4f694f46 ; File
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f504f494f554f4d ; MUIP
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f684f744f61 ; ath 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

LoadLibraryExW:
    ; print `Err: LoadLibraryExW ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f614f6f4f4c4f20 ;  Loa
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f624f694f4c4f64 ; dLib
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f794f724f614f72 ; rary
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f574f784f45 ; ExW 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

LoadStringW:
    ; print `Err: LoadStringW` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f614f6f4f4c4f20 ;  Loa
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f724f744f534f64 ; dStr
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f574f674f6e4f69 ; ingW
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

FormatMessageW:
    ; print `Err: FormatMessageW ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f724f6f4f464f20 ;  For
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f4d4f744f614f6d ; matM
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f614f734f734f65 ; essa
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f574f654f67 ; geW 
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

tan:
    ; print `Err: tan` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f6e4f614f744f20 ;  tan
    mov qword[rbx + 0x0008], rax
    call next_console_row
    ret

FreeLibrary:
    ; print `Err: FreeLibrary` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f654f724f464f20 ;  Fre
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f624f694f4c4f65 ; eLib
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f794f724f614f72 ; rary
    mov qword[rbx + 0x0018], rax
    call next_console_row
    ret

RhpValidateExInfoPop:
    ; print `Err: RhpValidateExInfoPop   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f694f6c4f614f56 ; Vali
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f654f744f614f64 ; date
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6e4f494f784f45 ; ExIn
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f6f4f504f6f4f66 ; foPo
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f204f204f204f70 ; p   
    mov qword[rbx + 0x0030], rax
    call next_console_row
    ret

RhpWaitForSuspend2:
    ; print `Err: RhpWaitForSuspend2 ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f694f614f57 ; Wait
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f534f724f6f4f46 ; ForS
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f654f704f734f75 ; uspe
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f324f644f6e ; nd2 
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

RhpWaitForGC2:
    ; print `Err: RhpWaitForGC2  ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f744f694f614f57 ; Wait
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f474f724f6f4f46 ; ForG
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f204f204f324f43 ; C2  
    mov qword[rbx + 0x0020], rax
    call next_console_row
    ret

RhpReversePInvokeAttachOrTrapThread2:
    ; print `Err: RhpReversePInvokeAttachOrTrapThread2   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f654f764f654f52 ; Reve
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f504f654f734f72 ; rseP
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f6f4f764f6e4f49 ; Invo
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f744f414f654f6b ; keAt
    mov qword[rbx + 0x0028], rax
    mov rax, 0x4f684f634f614f74 ; tach
    mov qword[rbx + 0x0030], rax
    mov rax, 0x4f724f544f724f4f ; OrTr
    mov qword[rbx + 0x0038], rax
    mov rax, 0x4f684f544f704f61 ; apTh
    mov qword[rbx + 0x0040], rax
    mov rax, 0x4f644f614f654f72 ; read
    mov qword[rbx + 0x0048], rax
    mov rax, 0x4f204f204f204f32 ; 2   
    mov qword[rbx + 0x0050], rax
    call next_console_row
    ret

RhpPublishObject:
    ; print `Err: RhpPublishObject   ` to screen
    call set_cursor
    mov rax, 0x4f3a4f724f724f45 ; Err:
    mov qword[rbx + 0x0000], rax
    mov rax, 0x4f704f684f524f20 ;  Rhp
    mov qword[rbx + 0x0008], rax
    mov rax, 0x4f6c4f624f754f50 ; Publ
    mov qword[rbx + 0x0010], rax
    mov rax, 0x4f4f4f684f734f69 ; ishO
    mov qword[rbx + 0x0018], rax
    mov rax, 0x4f634f654f6a4f62 ; bjec
    mov qword[rbx + 0x0020], rax
    mov rax, 0x4f204f204f204f74 ; t   
    mov qword[rbx + 0x0028], rax
    call next_console_row
    ret

