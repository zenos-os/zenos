using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StubGen
{
    class Program
    {
        private static readonly string[] UnresolvedLinks = new[]
        {
            "RhpReversePInvoke2",
            "RhpReversePInvokeReturn2",
            "RhpAssignRef",
            "RhpDbl2ULng",
            "RhpEtwExceptionThrown",
            "RhGetThreadLocalStorageForDynamicType",
            "RhpThrowEx",
            "RhpCheckedAssignRef",
            "RhpGetDispatchCellInfo",
            "RhpUpdateDispatchCellCache",
            "RhpFallbackFailFast",
            "RhpSearchDispatchCellCache",
            "RhpPInvoke",
            "RhpWaitForFinalizerRequest",
            "RhpPInvokeReturn",
            "RhpSignalFinalizationComplete",
            "RhpValidateExInfoStack",
            "RhpCollect",
            "RhpGetGcTotalMemory",
            "RhpNewFinalizable",
            "RhpNewFast",
            "RhpNewArray",
            "RhpBox",
            "RhUnbox",
            "RhpCopyObjectContents",
            "RhpGetCurrentThreadStackTrace",
            "memset",
            "RhpSfiInit",
            "RhpSfiNext",
            "__not_yet_implemented",
            "RhpGetClasslibFunction",
            "RhpSetThreadDoNotTriggerGC",
            "RhpCallCatchFunclet",
            "RhpGetNextFinalizerInitCallback",
            "RhpGetNextFinalizableObject",
            "RhpCheckedLockCmpXchg",
            "RhGetModuleFromEEType",
            "RhpCreateModuleManager",
            "RhpGetModuleSection",
            "RhpArrayCopy",
            "IsDebuggerPresent",
            "RaiseFailFastException",
            "RhHandleGet",
            "RhpGetRequestedExceptionEvents",
            "RhpSendExceptionEventToDebugger",
            "RhpEHEnumInitFromStackFrameIterator",
            "RhpCallFilterFunclet",
            "RhpEHEnumNext",
            "RhpCopyContextFromExInfo",
            "__fail_fast",
            "RhpCallFinallyFunclet",
            "RhpAcquireCastCacheLock",
            "PalGetTickCount64",
            "RhpInitialDynamicInterfaceDispatch",
            "RhHandleSet",
            "RhpHandleAlloc",
            "RhpReleaseCastCacheLock",
            "RhGetGenericInstantiation",
            "GetTickCount64",
            "RhSpinWait",
            "RhGetExceptionsForCurrentThread",
            "GetCurrentThreadId",
            "RhSetErrorInfoBuffer",
            "memmove",
            "RhpGetDispatchMap",
            "SetEvent",
            "GetLastError",
            "GetNativeSystemInfo",
            "GetProcessHeap",
            "HeapAlloc",
            "memcpy",
            "RhpByRefAssignRef",
            "OutputDebugStringW",
            "RhHandleGetDependent",
            "RhHandleFree",
            "RhFindMethodStartAddress",
            "RhGetModuleFromPointer",
            "LCMapStringEx",
            "CompareStringEx",
            "RhpCheckedXchg",
            "RhGetModuleFileName",
            "CreateEventExW",
            "RhSuppressFinalize",
            "CloseHandle",
            "GetLocaleInfoEx",
            "ResolveLocaleName",
            "RhGetCodeTarget",
            "RhpHandleAllocDependent",
            "floor",
            "fmod",
            "_ecvt_s",
            "EnumCalendarInfoExEx",
            "CompareStringOrdinal",
            "RhCompatibleReentrantWaitAny",
            "WaitForMultipleObjectsEx",
            "EnumTimeFormatsEx",
            "CoGetApartmentType",
            "GetCalendarInfoEx",
            "CoCreateGuid",
        };


        static void Main(string[] args)
        {
            var filePath = Path.Combine("..", "..", "..", "..", "src", "red_hawk.asm");
            using (var asm = new StreamWriter(filePath))
            {
                foreach (var link in UnresolvedLinks)
                    asm.WriteLine($"global {link}");

                asm.WriteLine();
                asm.WriteLine("section .text");
                asm.WriteLine("bits 64");

                foreach (var link in UnresolvedLinks)
                {
                    var errorMessage = GetErrorMessage(link);

                    var writes =
                        from item in errorMessage.Select((c, index) => new {c, index})
                        group item.c by item.index/4
                        into g
                        let chars = string.Join("", g)
                        let qword =
                            from c in g.Reverse()
                            let b = (byte) c
                            select "4f" + b.ToString("x").PadLeft(2, '0')
                        let mov = $"    mov rax, 0x{string.Join("", qword)} ; {chars}"
                        let pos = (0xb8000 + g.Key*4).ToString("x8")
                        let draw = $"    mov qword[0x{pos}], rax"
                        select new {mov, draw};

                    asm.WriteLine($"{link}:");
                    asm.WriteLine($"    ; print `{errorMessage}` to screen");
                    foreach (var write in writes)
                    {
                        asm.WriteLine(write.mov);
                        asm.WriteLine(write.draw);
                    }
                    asm.WriteLine("    hlt");
                    asm.WriteLine();
                }
            }
        }

        private static string GetErrorMessage(string link)
        {
            var funcName = "Err: " + link;
            var mod = funcName.Length%4;
            var paddedFuncName = mod == 0
                ? funcName
                : funcName.PadRight(funcName.Length + (4 - mod));

            return paddedFuncName;
        }
    }
}
