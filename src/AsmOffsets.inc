









































RH_LARGE_OBJECT_SIZE equ 014c08h
CLUMP_SIZE equ 0800h
LOG2_CLUMP_SIZE equ 0bh


OFFSETOF__Object__m_pEEType equ 00h

OFFSETOF__Array__m_Length equ 08h

OFFSETOF__EEType__m_usComponentSize equ 00h
OFFSETOF__EEType__m_usFlags equ 02h
OFFSETOF__EEType__m_uBaseSize equ 04h



OFFSETOF__EEType__m_VTable equ 020h




OFFSETOF__Thread__m_rgbAllocContextBuffer equ 00h
OFFSETOF__Thread__m_ThreadStateFlags equ 038h
OFFSETOF__Thread__m_pTransitionFrame equ 040h
OFFSETOF__Thread__m_pHackPInvokeTunnel equ 048h
OFFSETOF__Thread__m_ppvHijackedReturnAddressLocation equ 068h
OFFSETOF__Thread__m_pvHijackedReturnAddress equ 070h
OFFSETOF__Thread__m_pExInfoStackHead equ 078h

SIZEOF__EHEnum equ 020h

OFFSETOF__alloc_context__alloc_ptr equ 00h
OFFSETOF__alloc_context__alloc_limit equ 08h

OFFSETOF__RuntimeInstance__m_pThreadStore equ 08h


OFFSETOF__InterfaceDispatchCell__m_pCache equ 08h



OFFSETOF__InterfaceDispatchCache__m_rgEntries equ 020h
SIZEOF__InterfaceDispatchCacheEntry equ 010h


OFFSETOF__StaticClassConstructionContext__m_initialized equ 08h


OFFSETOF__CallDescrData__pSrc equ 00h
OFFSETOF__CallDescrData__numStackSlots equ 08h
OFFSETOF__CallDescrData__fpReturnSize equ 0Ch
OFFSETOF__CallDescrData__pArgumentRegisters equ 010h
OFFSETOF__CallDescrData__pFloatArgumentRegisters equ 018h
OFFSETOF__CallDescrData__pTarget equ 020h
OFFSETOF__CallDescrData__pReturnBuffer equ 028h




















SIZEOF__ExInfo equ 0250h
OFFSETOF__ExInfo__m_pPrevExInfo equ 00h
OFFSETOF__ExInfo__m_pExContext equ 08h
OFFSETOF__ExInfo__m_exception equ 010h
OFFSETOF__ExInfo__m_kind equ 018h
OFFSETOF__ExInfo__m_passNumber equ 019h
OFFSETOF__ExInfo__m_idxCurClause equ 01ch
OFFSETOF__ExInfo__m_frameIter equ 020h
OFFSETOF__ExInfo__m_notifyDebuggerSP equ 0240h

OFFSETOF__PInvokeTransitionFrame__m_RIP equ 00h
OFFSETOF__PInvokeTransitionFrame__m_FramePointer equ 08h
OFFSETOF__PInvokeTransitionFrame__m_pThread equ 010h
OFFSETOF__PInvokeTransitionFrame__m_dwFlags equ 018h
OFFSETOF__PInvokeTransitionFrame__m_PreservedRegs equ 020h

SIZEOF__StackFrameIterator equ 0220h
OFFSETOF__StackFrameIterator__m_FramePointer equ 010h
OFFSETOF__StackFrameIterator__m_ControlPC equ 018h
OFFSETOF__StackFrameIterator__m_RegDisplay equ 020h

SIZEOF__PAL_LIMITED_CONTEXT equ 0100h
OFFSETOF__PAL_LIMITED_CONTEXT__IP equ 00h

OFFSETOF__PAL_LIMITED_CONTEXT__Rsp equ 08h
OFFSETOF__PAL_LIMITED_CONTEXT__Rbp equ 010h
OFFSETOF__PAL_LIMITED_CONTEXT__Rdi equ 018h
OFFSETOF__PAL_LIMITED_CONTEXT__Rsi equ 020h
OFFSETOF__PAL_LIMITED_CONTEXT__Rax equ 028h
OFFSETOF__PAL_LIMITED_CONTEXT__Rbx equ 030h

OFFSETOF__PAL_LIMITED_CONTEXT__R12 equ 038h
OFFSETOF__PAL_LIMITED_CONTEXT__R13 equ 040h
OFFSETOF__PAL_LIMITED_CONTEXT__R14 equ 048h
OFFSETOF__PAL_LIMITED_CONTEXT__R15 equ 050h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm6 equ 060h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm7 equ 070h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm8 equ 080h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm9 equ 090h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm10 equ 00a0h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm11 equ 00b0h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm12 equ 00c0h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm13 equ 00d0h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm14 equ 00e0h
OFFSETOF__PAL_LIMITED_CONTEXT__Xmm15 equ 00f0h

SIZEOF__REGDISPLAY equ 0130h
OFFSETOF__REGDISPLAY__SP equ 078h

OFFSETOF__REGDISPLAY__pRbx equ 018h
OFFSETOF__REGDISPLAY__pRbp equ 020h
OFFSETOF__REGDISPLAY__pRsi equ 028h
OFFSETOF__REGDISPLAY__pRdi equ 030h
OFFSETOF__REGDISPLAY__pR12 equ 058h
OFFSETOF__REGDISPLAY__pR13 equ 060h
OFFSETOF__REGDISPLAY__pR14 equ 068h
OFFSETOF__REGDISPLAY__pR15 equ 070h
OFFSETOF__REGDISPLAY__Xmm equ 090h



















































































