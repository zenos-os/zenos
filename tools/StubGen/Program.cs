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
            "__fail_fast",
            "__not_yet_implemented",
            "_ecvt_s",
            "CloseHandle",
            "CoCreateGuid",
            "CoGetApartmentType",
            "CompareStringEx",
            "CompareStringOrdinal",
            "CreateEventExW",
            "EnumCalendarInfoExEx",
            "EnumTimeFormatsEx",
            "floor",
            "fmod",
            "GetCalendarInfoEx",
            "GetCurrentThreadId",
            "GetLastError",
            "GetLocaleInfoEx",
            "GetNativeSystemInfo",
            "GetProcessHeap",
            "GetTickCount64",
            "HeapAlloc",
            "IsDebuggerPresent",
            "LCMapStringEx",
            "memcpy",
            "memmove",
            "memset",
            "OutputDebugStringW",
            "PalGetTickCount64",
            "RaiseFailFastException",
            "ResolveLocaleName",
            "RhCompatibleReentrantWaitAny",
            "RhFindMethodStartAddress",
            "RhGetCodeTarget",
            "RhGetExceptionsForCurrentThread",
            "RhGetGenericInstantiation",
            "RhGetModuleFileName",
            "RhGetModuleFromEEType",
            "RhGetModuleFromPointer",
            "RhGetThreadLocalStorageForDynamicType",
            "RhHandleFree",
            "RhHandleGet",
            "RhHandleGetDependent",
            "RhHandleSet",
            "RhpAcquireCastCacheLock",
            "RhpArrayCopy",
            "RhpAssignRef",
            "RhpBox",
            "RhpByRefAssignRef",
            "RhpCallCatchFunclet",
            "RhpCallFilterFunclet",
            "RhpCallFinallyFunclet",
            "RhpCheckedAssignRef",
            "RhpCheckedLockCmpXchg",
            "RhpCheckedXchg",
            "RhpCollect",
            "RhpCopyContextFromExInfo",
            "RhpCopyObjectContents",
            "RhpCreateModuleManager",
            "RhpDbl2ULng",
            "RhpEHEnumInitFromStackFrameIterator",
            "RhpEHEnumNext",
            "RhpEtwExceptionThrown",
            "RhpFallbackFailFast",
            "RhpGetClasslibFunction",
            "RhpGetCurrentThreadStackTrace",
            "RhpGetDispatchCellInfo",
            "RhpGetDispatchMap",
            "RhpGetGcTotalMemory",
            "RhpGetModuleSection",
            "RhpGetNextFinalizableObject",
            "RhpGetNextFinalizerInitCallback",
            "RhpGetRequestedExceptionEvents",
            "RhpHandleAlloc",
            "RhpHandleAllocDependent",
            "RhpInitialDynamicInterfaceDispatch",
            "RhpNewArray",
            "RhpNewFast",
            "RhpNewFinalizable",
            "RhpPInvoke",
            "RhpPInvokeReturn",
            "RhpReleaseCastCacheLock",
            "RhpReversePInvoke2",
            "RhpReversePInvokeReturn2",
            "RhpSearchDispatchCellCache",
            "RhpSendExceptionEventToDebugger",
            "RhpSetThreadDoNotTriggerGC",
            "RhpSfiInit",
            "RhpSfiNext",
            "RhpSignalFinalizationComplete",
            "RhpThrowEx",
            "RhpUpdateDispatchCellCache",
            "RhpValidateExInfoStack",
            "RhpWaitForFinalizerRequest",
            "RhSetErrorInfoBuffer",
            "RhSpinWait",
            "RhSuppressFinalize",
            "RhUnbox",
            "SetEvent",
            "WaitForMultipleObjectsEx",
        };


        static void Main(string[] args)
        {
            var filePath = Path.Combine("..", "..", "..", "..", "src", "red_hawk.asm");
            using (var asm = new StreamWriter(filePath))
            {
                foreach (var link in UnresolvedLinks)
                    asm.WriteLine($"global {link}");

                asm.WriteLine();

                asm.WriteLine("section .data");
                asm.WriteLine("console_row:  db 0");
                asm.WriteLine();

                asm.WriteLine("section .text");
                asm.WriteLine("bits 64");
                asm.WriteLine();

                asm.WriteLine("set_cursor:");
                asm.WriteLine("    mov rbx, [console_row]");
                asm.WriteLine("    imul rbx, 160");
                asm.WriteLine("    add rbx, 0xb8000");
                asm.WriteLine("    ret");
                asm.WriteLine();

                asm.WriteLine("next_console_row:");
                asm.WriteLine("    inc byte [console_row]");
                asm.WriteLine("    cmp byte [console_row], 3");
                asm.WriteLine("    ja .quit");
                asm.WriteLine("    ret");
                asm.WriteLine(".quit:");
                asm.WriteLine("    hlt");
                asm.WriteLine();

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
                        let pos = (g.Key*8).ToString("X4")
                        let draw = $"    mov qword[rbx + 0x{pos}], rax"
                        select new {mov, draw};

                    asm.WriteLine($"{link}:");
                    asm.WriteLine($"    ; print `{errorMessage}` to screen");
                    asm.WriteLine($"    call set_cursor");

                    foreach (var write in writes)
                    {
                        asm.WriteLine(write.mov);
                        asm.WriteLine(write.draw);
                    }
                    asm.WriteLine("    call next_console_row"); // increment row number
                    asm.WriteLine("    ret");
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
