using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Win32.SafeHandles;

namespace System.IO
{
    partial class FileStream
    {
        public override bool CanSeek => throw new NotImplementedException();

        public override long Seek(long offset, SeekOrigin origin)
        {
            throw new NotImplementedException();
        }

        private ValueTask WriteAsyncInternal(ReadOnlyMemory<byte> source, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        private void WriteSpan(ReadOnlySpan<byte> source)
        {
            throw new NotImplementedException();
        }

        private Task<int> ReadAsyncInternal(Memory<byte> destination, CancellationToken cancellationToken,
            out int synchronousResult)
        {
            throw new NotImplementedException();
        }

        private int ReadSpan(Span<byte> destination)
        {
            throw new NotImplementedException();
        }
        private Task FlushAsyncInternal(CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        private void FlushOSBuffer()
        {
            throw new NotImplementedException();
        }

        private void SetLengthInternal(long value)
        {
            throw new NotImplementedException();
        }
        private long GetLengthInternal()
        {
            throw new NotImplementedException();
        }
        private long SeekCore(SafeFileHandle fileHandle, long offset, SeekOrigin origin)
        {
            throw new NotImplementedException();
        }

        private void FlushWriteBuffer()
        {
            throw new NotImplementedException();
        }
        private int FillReadBufferForReadByte()
        {
            throw new NotImplementedException();
        }

        private void FlushWriteBufferForWriteByte()
        {
            throw new NotImplementedException();
        }

        private SafeFileHandle OpenHandle(FileMode mode, FileShare share, FileOptions options)
        {
            throw new NotImplementedException();
        }

        private void Init(FileMode mode, FileShare share, string originalPath)
        {
            throw new NotImplementedException();
        }
        private void InitFromHandle(SafeFileHandle handle, FileAccess access, bool useAsyncIO)
        {
            throw new NotImplementedException();
        }

        private static bool GetDefaultIsAsync(SafeFileHandle handle) => handle.IsAsync ?? DefaultIsAsync;


        /// <summary>Prevents other processes from reading from or writing to the FileStream.</summary>
        /// <param name="position">The beginning of the range to lock.</param>
        /// <param name="length">The range to be locked.</param>
        private void LockInternal(long position, long length)
        {
            throw new NotImplementedException();
        }

        /// <summary>Allows access by other processes to all or part of a file that was previously locked.</summary>
        /// <param name="position">The beginning of the range to unlock.</param>
        /// <param name="length">The range to be unlocked.</param>
        private void UnlockInternal(long position, long length)
        {
            throw new NotImplementedException();
        }
    }
}
