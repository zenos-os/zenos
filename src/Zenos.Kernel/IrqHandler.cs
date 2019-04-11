using System;

namespace Zenos.Kernel
{
    abstract class IrqHandler : IDisposable
    {
        private readonly byte _irq;

        protected IrqHandler(byte irq)
        {
            _irq = irq;
            I386.RegisterIrqHandler(_irq, this);
        }

        public void Enable()
        {
            PIC.Enable(_irq);
        }

        public void Disable()
        {
            PIC.Disable(_irq);
        }

        public void Dispose()
        {
            I386.UnregisterIrqHandler(_irq, this);
        }
    }

    static class I386
    {
        public static void RegisterIrqHandler(byte irq, IrqHandler handler)
        {
            // TODO
        }
        public static void UnregisterIrqHandler(byte irq, IrqHandler handler)
        {
            // TODO
        }
    }

    struct DescriptorTablePointer
    {
        public ushort Limit;
        public IntPtr BaseAddress;
    }

    [Flags]
    enum IdtFlags : byte
    {
        Present = 1 << 7,
        Ring0 = 0 << 5,
        Ring1 = 1 << 5,
        Ring2 = 2 << 5,
        Ring3 = 3 << 5,
        SS = 1 << 4,
        Interrupt = 0xE,
        Trap = 0xF,
    }

    //[StructLayout(LayoutKind.Sequential)]
    //struct InterruptDescriptorTableEntry
    //{
    //    private ushort offsetl; // offset bits 0..15
    //    private ushort selector; // a code segment selector in GDT or LDT
    //    private byte zero; // bits 0..2 holds Interrupt Stack Table offset, rest of bits zero.
    //    private IdtFlags attribute; // type and attributes
    //    private ushort offsetm; // offset bits 16..31
    //    private uint offseth; // offset bits 32..63
    //    private uint zero2; // reserved

    //    // ReSharper disable once ConvertToAutoProperty
    //    public ushort Selector
    //    {
    //        get => this.selector;
    //        set { this.selector = value; }
    //    }

    //    // ReSharper disable once ConvertToAutoProperty
    //    public IdtFlags Flags
    //    {
    //        get => this.attribute;
    //        set { this.attribute = value; }
    //    }

    //    public ulong Offset
    //    {
    //        set
    //        {
    //            this.offsetl = (ushort)value;
    //            this.offsetm = (ushort)(value >> 16);
    //            this.offseth = (uint)(value >> 32);
    //        }
    //        get { return offsetl | ((ulong)offsetm << 16) | ((ulong)offseth << 32); }
    //    }

    //    public void SetFunc(IntPtr func)
    //    {
    //        this.Flags = IdtFlags.Present | IdtFlags.Ring0 | IdtFlags.Interrupt;
    //        this.Selector = 8;
    //        this.Offset = (ulong)func.ToInt64();
    //    }
    //}
}

