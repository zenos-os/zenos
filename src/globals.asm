global RhpTrapThreads

global g_ephemeral_low
global g_ephemeral_high

global g_lowest_address
global g_highest_address
global g_card_table

global tls_CurrentThread
global _tls_index

SECTION .data
  ; see src/Native/Runtime/threadstore.inl
  RhpTrapThreads:    dd   0   ; UInt32

  ; see src/Native/gc/gccommon.cpp
  g_ephemeral_low:   dq   1   ; uint8_t*
  g_ephemeral_high:  dq   -1  ; uint8_t*

  ; see src/Native/Runtime/GCMemoryHelpers.inl
  g_lowest_address:  dq   0   ; uint8_t*
  g_highest_address: dq   0   ; uint8_t*
  g_card_table:      dq   0   ; uint32_t*



  ; see src/Native/Runtime/threadstore.cpp
  _tls_index:         dd   0
  tls_CurrentThread:

  ;struct ThreadBuffer
  ;{
  ;    UInt8                   m_rgbAllocContextBuffer[SIZEOF_ALLOC_CONTEXT];
      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

  ;    UInt32 volatile         m_ThreadStateFlags;                     // see Thread::ThreadStateFlags enum
      dd 0
  ;    PTR_VOID                m_pTransitionFrame;
      dq -1
  ;    PTR_VOID                m_pHackPInvokeTunnel;                   // see Thread::EnablePreemptiveMode
      dq -1
  ;    PTR_VOID                m_pCachedTransitionFrame;
      dq 0
  ;    PTR_Thread              m_pNext;                                // used by ThreadStore's SList<Thread>
      dq 0
  ;    HANDLE                  m_hPalThread;                           // WARNING: this may legitimately be INVALID_HANDLE_VALUE
      dq -1
  ;    void **                 m_ppvHijackedReturnAddressLocation;
      dq 0
  ;    void *                  m_pvHijackedReturnAddress;
      dq 0
  ;    PTR_ExInfo              m_pExInfoStackHead;
      dq 0
  ;    PTR_VOID                m_pStackLow;
      dq 0
  ;    PTR_VOID                m_pStackHigh;
      dq 0
  ;    PTR_UInt8               m_pTEB;                                 // Pointer to OS TEB structure for this thread
      dq 0
  ;    UInt64                  m_uPalThreadIdForLogging;               // @TODO: likely debug-only
      dq 0
  ;    EEThreadId              m_threadId;
      dq 0
  ;    PTR_VOID                m_pThreadStressLog;                     // pointer to head of thread's StressLogChunks
      dq 0

  ;    // Thread Statics Storage for dynamic types
  ;    UInt32          m_numDynamicTypesTlsCells;
      dd 0
  ;    PTR_UInt8*      m_pDynamicTypesTlsCells;
      dq 0
  ;}