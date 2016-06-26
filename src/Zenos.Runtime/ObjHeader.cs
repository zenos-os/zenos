namespace Zenos.Runtime
{
    // SEE E:\code\OsDev\zenos\vendor\corert\src\Native\Runtime\ObjectLayout.h
    // E:\code\OsDev\zenos\vendor\corert\src\Native\Runtime\ObjectLayout.cpp
    struct ObjHeader
    {
        private uint _alignpad;
        private uint _syncBlockValue;
    }
}
