using static OS.Native;

namespace OS
{
    class Serial
    {
        private readonly int _port;

        public Serial(int port)
        {
            _port = port;

            Out(1, 0x00);    // Disable all interrupts
            Out(3, 0x80);    // Enable DLAB (set baud rate divisor)
            Out(0, 0x03);    // Set divisor to 3 (lo byte) 38400 baud
            Out(1, 0x00);    //                  (hi byte)
            Out(3, 0x03);    // 8 bits, no parity, one stop bit
            Out(2, 0xC7);    // Enable FIFO, clear them, with 14-byte threshold
            Out(4, 0x0B);    // IRQs enabled, RTS/DSR set
        }

        private void Out(int offset, byte value) =>
            OutByte((ushort) (_port + offset), value);

        private byte GetStatus() =>
            InByte((ushort)(_port + 5));

        public bool DataReceived => (GetStatus() & 0x1) != 0;
        public bool TransmitReady => (GetStatus() & 0x20) != 0;

        public void Write(char a)
        {
            while (!TransmitReady)
            {
                // wait until we are ready
            }

            Out(0, (byte)a);
        }

        public char Read()
        {
            while (!DataReceived)
            {
                // wait until data is available
            }

            return (char)InByte((ushort) _port);
        }
    }
}