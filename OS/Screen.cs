namespace OS
{
    public static unsafe class Screen
    {
        /// <summary>
        ///
        /// </summary>
        public const uint Columns = 80;

        /// <summary>
        ///
        /// </summary>
        public const uint Rows = 40;

        public static int Row { get; set; }

        public static int Column { get; set; }

        public static ConsoleColor ForegroundColor { get; set; }

        public static ConsoleColor BackgroundColor { get; set; }

        private static ushort* buffer;
        private static bool _initialized;

        public static void Init()
        {
            if (_initialized)
                return;

            buffer = (ushort*)0xB8000;
            ForegroundColor = ConsoleColor.White;
            BackgroundColor = ConsoleColor.Black;
            _initialized = true;
        }

        public static void Write(char c)
        {
            if (c == '\r')
            {
                Column = 0;
                return;
            }

            if (c == '\n')
            {
                Row += 1;
                return;
            }

            Write(c, Column, Row);
            Column++;
            if (Column > Columns)
            {
                Column = 0;
                Row++;
            }
        }

        public static void Write(char c, int col, int row)
        {
            var s = (ushort)(GetColorCode() | (byte)c);

            buffer[row * Columns + col] = s;
        }

        /// <summary>
		/// Goto the specified row and column.
		/// </summary>
		/// <param name="row">The row.</param>
		/// <param name="col">The col.</param>
		public static void Goto(int row, int col)
        {
            Row = row;
            Column = col;
        }

        /// <summary>
        /// Goto the top.
        /// </summary>
        public static void GotoTop()
        {
            Goto(0, 0);
        }

        /// <summary>
        /// Clears this instance.
        /// </summary>
        public static void Clear()
        {
            GotoTop();

            var fg = ForegroundColor;
            var bg = BackgroundColor;

            ForegroundColor = ConsoleColor.White;
            BackgroundColor = ConsoleColor.Black;

            for (int i = 0; i < Columns * Rows; i++)
                Write(' ');

            ForegroundColor = fg;
            BackgroundColor = bg;

            GotoTop();
        }

        public static void Write(string str)
        {
            for (int i = 0; i < str.Length; i++)
            {
                Write(str[i]);
            }
        }

        public static void WriteLine(string str)
        {
            Write(str);
            Write("\r\n");
        }

        public static void Write(int value)
        {
            while (value > 10)
            {
                var c = (char)('0' + (value%10));
                Write(c);
                value = value/10;
            }
        }

        
        static ushort GetColorCode()
        {
            var fg = (byte)ForegroundColor;
            var bg = (byte)BackgroundColor;
            return (ushort)(bg << 12 | fg << 8);
        }
    }
}