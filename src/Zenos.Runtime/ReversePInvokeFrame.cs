namespace Zenos.Runtime
{
    unsafe struct ReversePInvokeFrame
    {
        public void* m_savedPInvokeTransitionFrame;
        public Thread* m_savedThread;
    };
}