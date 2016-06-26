namespace Zenos.Runtime
{
    public struct ReadyToRunHeader
    {
        public uint Signature;      // ReadyToRunHeaderConstants.Signature
        public ushort MajorVersion;
        public ushort MinorVersion;

        public uint Flags;

        public ushort NumberOfSections;
        public byte EntrySize;
        public byte EntryType;
    }
}