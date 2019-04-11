using Zenos.Runtime;

namespace Zenos.Kernel
{
    public static class PIC
    {
        private const int SLAVE_INDEX = 2;

        private const int PIC0_CTL = 0x20;
        private const int PIC0_CMD = 0x21;
        private const int PIC1_CTL = 0xA0;
        private const int PIC1_CMD = 0xA1;

        private const int IRQ_VECTOR_BASE = 0x50;

        public static void Initialize()
        {
            /* ICW1 (edge triggered mode, cascading controllers, expect ICW4) */
            IO.OutByte(PIC0_CTL, 0x11);
            IO.OutByte(PIC1_CTL, 0x11);

            /* ICW2 (upper 5 bits specify ISR indices, lower 3 idunno) */
            IO.OutByte(PIC0_CMD, IRQ_VECTOR_BASE);
            IO.OutByte(PIC1_CMD, IRQ_VECTOR_BASE + 0x08);

            /* ICW3 (configure master/slave relationship) */
            IO.OutByte(PIC0_CMD, 1 << SLAVE_INDEX);
            IO.OutByte(PIC1_CMD, SLAVE_INDEX);

            /* ICW4 (set x86 mode) */
            IO.OutByte(PIC0_CMD, 0x01);
            IO.OutByte(PIC1_CMD, 0x01);

            // Mask -- start out with all IRQs disabled.
            IO.OutByte(PIC0_CMD, 0xff);
            IO.OutByte(PIC1_CMD, 0xff);

            // ...except IRQ2, since that's needed for the master to let through slave interrupts.
            Enable(2);

            // use kernel print
            Screen.Write("PIC(i8259): cascading mode, vectors 0x");
            Screen.Write(IRQ_VECTOR_BASE, 16, 2);
            Screen.Write("-0x");
            Screen.Write(IRQ_VECTOR_BASE + 0x08, 16, 2);
            Screen.WriteLine();
        }

        public static void Enable(byte irq)
        {
            if ((irq & 8) > 0)
            {
                var imr = IO.InByte(PIC1_CMD);
                imr = (byte)(imr & ~(1 << (irq - 8)));
                IO.OutByte(PIC1_CMD, imr);
            }
            else
            {
                var imr = IO.InByte(PIC0_CMD);
                imr = (byte)(imr & ~(1 << irq));
                IO.OutByte(PIC0_CMD, imr);
            }
        }

        public static void Disable(byte irq)
        {
            if ((irq & 8) > 0)
            {
                var imr = IO.InByte(PIC1_CMD);
                imr = (byte)(imr | 1 << (irq - 8));
                IO.OutByte(PIC1_CMD, imr);
            }
            else
            {
                var imr = IO.InByte(PIC0_CMD);
                imr = (byte)(imr | 1 << irq);
                IO.OutByte(PIC0_CMD, imr);
            }
        }
    }
}