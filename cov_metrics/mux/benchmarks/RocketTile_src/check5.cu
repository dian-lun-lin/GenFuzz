#include <iostream>
#include "rtlflow.h"
#include "Top.h"
#include "../verilator/Top.h"
#include "../verilator/Top__Syms.h"
#ifdef NDEBUG
#define RF_ASSERT(condition, message) 0
#else
#define RF_ASSERT(condition, message)\
  (!(condition)) ?\
    (std::cerr << "Assertion failed: (" << #condition << "), "\
        << "function " << __FUNCTION__\
        << ", file "   << __FILE__\
        << ", line "   << __LINE__ << "."\
        << "\n"       << message  << "\n", 0) : 1
#endif
void check5(Top* vlTOPp) {
    Top__Syms* vlSymsp = vlTOPp->__VlSymsp;
    CData* _csignals = RF::Top::_rtlflow._csignals;
    SData* _ssignals = RF::Top::_rtlflow._ssignals;
    QData* _qsignals = RF::Top::_rtlflow._qsignals;
    IData* _isignals = RF::Top::_rtlflow._isignals;

}