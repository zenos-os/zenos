using System;
using System.Runtime;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using OS.Runtime;

namespace OS
{
    class Kernel
    {
        [RuntimeImport("InitializeModules"), MethodImpl(MethodImplOptions.InternalCall)]
        static extern void InitializeModules(IntPtr modules, int count);


        [RuntimeImport("LoadIDT"), MethodImpl(MethodImplOptions.InternalCall)]
        static extern void LoadIDT(IntPtr idt);

        [RuntimeExport("HandleInterrupt")]
        static unsafe void HandleInterrupt(CPUState* state)
        {
        }


        [StructLayout(LayoutKind.Sequential)]
        struct InterruptDescriptorTable
        {
            public InterruptDescriptorTableEntry Entry00;
            public InterruptDescriptorTableEntry Entry01;
            public InterruptDescriptorTableEntry Entry02;
            public InterruptDescriptorTableEntry Entry03;
            public InterruptDescriptorTableEntry Entry04;

            public InterruptDescriptorTableEntry Entry05;

            public InterruptDescriptorTableEntry Entry06;

            public InterruptDescriptorTableEntry Entry07;

            public InterruptDescriptorTableEntry Entry08;

            public InterruptDescriptorTableEntry Entry09;

            public InterruptDescriptorTableEntry Entry0A;

            public InterruptDescriptorTableEntry Entry0B;

            public InterruptDescriptorTableEntry Entry0C;

            public InterruptDescriptorTableEntry Entry0D;

            public InterruptDescriptorTableEntry Entry0E;

            public InterruptDescriptorTableEntry Entry0F;
        }


        [StructLayout(LayoutKind.Sequential)]
        struct InterruptDescriptorTableEntry
        {
            public ushort offset_1; // offset bits 0..15
            public ushort selector; // a code segment selector in GDT or LDT
            public byte ist; // bits 0..2 holds Interrupt Stack Table offset, rest of bits zero.
            public byte type_attr; // type and attributes
            public ushort offset_2; // offset bits 16..31
            public uint offset_3; // offset bits 32..63
            public uint zero; // reserved
        };

        [StructLayout(LayoutKind.Sequential)]
        struct CPUState
        {
            private ulong _errorCode;
            private ulong _interrupt;

            private ulong _rax;
            private ulong _rbx;
            private ulong _rcx;
            private ulong _rdx;

            private ulong _rdi;
            private ulong _rsi;
            private ulong _rsp;
            private ulong _rbp;

            private ulong _rip;
            private ulong _rflags;

            public ulong Rax => _rax;
            public ulong Rbx => _rbx;
            public ulong Rcx => _rcx;
            public ulong Rdx => _rdx;

            public ulong Rdi => _rdi;
            public ulong Rsi => _rsi;
            public ulong Rsp => _rsp;
            public ulong Rbp => _rbp;

            public ulong Rip => _rip;
            public ulong RFlags => _rflags;
            public ulong ErrorCode => _errorCode;
        }

        public static void Start(IntPtr modules, int count, long heapBase)
        {
            Memory.Init(heapBase);

            InitializeModules(modules, count);

            RedHawk.Init();
            Screen.Init();
            Screen.Clear();
        }
    }
}