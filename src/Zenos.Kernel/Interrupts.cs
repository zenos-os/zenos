using System;
using System.Runtime.InteropServices;

namespace Zenos.Kernel
{
    class Interrupts
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
        private ushort offsetl; // offset bits 0..15
        private ushort selector; // a code segment selector in GDT or LDT
        private byte ist; // bits 0..2 holds Interrupt Stack Table offset, rest of bits zero.
        private IdtFlags attribute; // type and attributes
        private ushort offsetm; // offset bits 16..31
        private uint offseth; // offset bits 32..63
        private uint zero; // reserved


        public ushort Selector
        {
            get => this.selector;
            set => this.selector = value;
        }

        public IdtFlags Flags
        {
            get => this.attribute;
            set => this.attribute = value;
        }

        public ulong Offset
        {
            set
            {
                this.offsetl = (ushort)value;
                this.offsetm = (ushort)(value >> 16);
                this.offseth = (uint)(value >> 32);
            }
            get => offsetl | ((ulong)offsetm << 16) | ((ulong)offseth << 32);
        }

        public void SetFunc(IntPtr func)
        {
            this.Flags = IdtFlags.Present | IdtFlags.Ring0 | IdtFlags.Interrupt;
            this.Selector = 8;
            this.Offset = (ulong)func.ToInt64();
        }
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
}
