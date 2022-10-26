// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef RF_VERILATED_TOP_H_
#define RF_VERILATED_TOP_H_  // guard

#include "rf_verilated_heavy.h"
#include "rf_heavy.h"
// begin of namespace RF =====================================
namespace RF {

    //==========
    class RTLflow;
    class Top__Syms;
    __global__ void _last_assign(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
    __global__ void _eval_settle(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
    __global__ void _change_request(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change);
    __global__ void __Vmtask__1(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__3(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__4(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__5(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__6(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__7(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__8(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__9(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__10(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__16(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__17(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__18(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__20(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__22(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__23(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__24(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__25(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__26(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__31(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__19(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__28(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__30(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__32(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__33(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__34(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__35(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__36(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__37(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__38(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__2(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__21(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__27(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__29(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__39(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__40(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__41(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__42(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__43(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__44(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__45(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__46(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__47(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__48(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__49(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__50(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__51(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__52(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__53(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__54(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__55(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__56(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__57(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__58(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__59(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__60(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__61(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__62(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__63(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__64(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__65(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__66(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__11(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__12(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__13(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__14(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__15(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);

    //==========
    
    
    //----------
    
    VL_MODULE(Top) {
        friend class RTLflow;
      public:

        // PORTS
        // The application code writes and reads these signals to
        // propagate new values into/out from the Verilated model.
        // Begin mtask footprint all: 66 
        const RF_OUT8(io_coverage_bytes_93,7,0){1539 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_94,7,0){1540 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_125,7,0){1571 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_151,7,0){1597 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_176,7,0){1622 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 14 
        const RF_OUT8(io_coverage_bytes_131,7,0){1577 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_132,7,0){1578 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_155,7,0){1601 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_180,7,0){1626 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 15 
        const RF_OUT8(io_coverage_bytes_133,7,0){1579 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_134,7,0){1580 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_156,7,0){1602 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_181,7,0){1627 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 12 
        const RF_OUT8(io_coverage_bytes_127,7,0){1573 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_128,7,0){1574 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_153,7,0){1599 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_178,7,0){1624 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 13 
        const RF_OUT8(io_coverage_bytes_129,7,0){1575 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_130,7,0){1576 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_154,7,0){1600 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_179,7,0){1625 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 10 
        const RF_OUT8(io_coverage_bytes_64,7,0){1510 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_65,7,0){1511 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_66,7,0){1512 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_99,7,0){1545 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_104,7,0){1550 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_111,7,0){1557 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_112,7,0){1558 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 11 
        const RF_OUT8(io_coverage_bytes_126,7,0){1572 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_152,7,0){1598 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_177,7,0){1623 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 8 
        const RF_OUT8(io_coverage_bytes_52,7,0){1498 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_53,7,0){1499 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_54,7,0){1500 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_89,7,0){1535 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_92,7,0){1538 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_101,7,0){1547 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_105,7,0){1551 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_106,7,0){1552 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 9 
        const RF_OUT8(io_coverage_bytes_56,7,0){1502 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_57,7,0){1503 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_58,7,0){1504 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_60,7,0){1506 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_61,7,0){1507 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_62,7,0){1508 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_96,7,0){1542 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_98,7,0){1544 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_102,7,0){1548 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_103,7,0){1549 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_107,7,0){1553 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_108,7,0){1554 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_109,7,0){1555 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_110,7,0){1556 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 6 
        const RF_OUT8(io_coverage_bytes_43,7,0){1489 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_44,7,0){1490 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_45,7,0){1491 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 7 
        const RF_OUT8(io_coverage_bytes_51,7,0){1497 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 4 
        const RF_OUT8(io_coverage_bytes_27,7,0){1473 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_28,7,0){1474 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_29,7,0){1475 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 5 
        const RF_OUT8(io_coverage_bytes_35,7,0){1481 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_36,7,0){1482 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_37,7,0){1483 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 2 
        const RF_OUT8(io_coverage_bytes_3,7,0){1449 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_4,7,0){1450 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_5,7,0){1451 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_11,7,0){1457 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_12,7,0){1458 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_13,7,0){1459 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 3 
        const RF_OUT8(io_coverage_bytes_19,7,0){1465 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_20,7,0){1466 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_21,7,0){1467 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 
        const RF_OUT8(io_coverage_bytes_189,7,0){1635 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 64 
        const RF_OUT8(io_coverage_bytes_87,7,0){1533 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_88,7,0){1534 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_123,7,0){1569 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_149,7,0){1595 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_174,7,0){1620 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 65 
        const RF_OUT8(io_coverage_bytes_90,7,0){1536 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_91,7,0){1537 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_124,7,0){1570 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_150,7,0){1596 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_175,7,0){1621 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 62 
        const RF_OUT8(io_coverage_bytes_83,7,0){1529 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_84,7,0){1530 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_121,7,0){1567 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_147,7,0){1593 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_172,7,0){1618 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 63 
        const RF_OUT8(io_coverage_bytes_85,7,0){1531 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_86,7,0){1532 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_122,7,0){1568 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_148,7,0){1594 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_173,7,0){1619 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 60 
        const RF_OUT8(io_coverage_bytes_79,7,0){1525 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_80,7,0){1526 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_119,7,0){1565 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_145,7,0){1591 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_170,7,0){1616 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 61 
        const RF_OUT8(io_coverage_bytes_81,7,0){1527 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_82,7,0){1528 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_120,7,0){1566 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_146,7,0){1592 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_171,7,0){1617 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 58 
        const RF_OUT8(io_coverage_bytes_75,7,0){1521 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_76,7,0){1522 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_117,7,0){1563 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_143,7,0){1589 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_168,7,0){1614 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 59 
        const RF_OUT8(io_coverage_bytes_77,7,0){1523 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_78,7,0){1524 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_118,7,0){1564 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_144,7,0){1590 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_169,7,0){1615 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 56 
        const RF_OUT8(io_coverage_bytes_71,7,0){1517 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_72,7,0){1518 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_115,7,0){1561 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_141,7,0){1587 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_166,7,0){1612 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 57 
        const RF_OUT8(io_coverage_bytes_73,7,0){1519 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_74,7,0){1520 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_116,7,0){1562 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_142,7,0){1588 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_167,7,0){1613 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 54 
        const RF_OUT8(io_coverage_bytes_67,7,0){1513 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_68,7,0){1514 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_113,7,0){1559 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_139,7,0){1585 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_164,7,0){1610 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 55 
        const RF_OUT8(io_coverage_bytes_69,7,0){1515 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_70,7,0){1516 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_114,7,0){1560 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_140,7,0){1586 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_165,7,0){1611 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 52 
        const RF_OUT8(io_coverage_bytes_63,7,0){1509 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_159,7,0){1605 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_184,7,0){1630 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 53 
        const RF_OUT8(io_coverage_bytes_100,7,0){1546 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_138,7,0){1584 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_163,7,0){1609 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_188,7,0){1634 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 50 
        const RF_OUT8(io_coverage_bytes_59,7,0){1505 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_158,7,0){1604 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_183,7,0){1629 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 51 
        const RF_OUT8(io_coverage_bytes_97,7,0){1543 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_137,7,0){1583 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_162,7,0){1608 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_187,7,0){1633 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 48 
        const RF_OUT8(io_coverage_bytes_55,7,0){1501 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_157,7,0){1603 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_182,7,0){1628 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 49 
        const RF_OUT8(io_coverage_bytes_95,7,0){1541 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_136,7,0){1582 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_161,7,0){1607 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_186,7,0){1632 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 46 
        const RF_OUT8(io_coverage_bytes_42,7,0){1488 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_46,7,0){1492 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_47,7,0){1493 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_48,7,0){1494 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_49,7,0){1495 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 47 
        const RF_OUT8(io_coverage_bytes_135,7,0){1581 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_160,7,0){1606 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_185,7,0){1631 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 44 
        const RF_OUT8(io_coverage_bytes_26,7,0){1472 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_30,7,0){1476 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_31,7,0){1477 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_32,7,0){1478 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_33,7,0){1479 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 45 
        const RF_OUT8(io_coverage_bytes_34,7,0){1480 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_38,7,0){1484 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_39,7,0){1485 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_40,7,0){1486 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_41,7,0){1487 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 42 
        const RF_OUT8(io_coverage_bytes_10,7,0){1456 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_14,7,0){1460 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_15,7,0){1461 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_16,7,0){1462 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_17,7,0){1463 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 43 
        const RF_OUT8(io_coverage_bytes_18,7,0){1464 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_22,7,0){1468 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_23,7,0){1469 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_24,7,0){1470 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_25,7,0){1471 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 40 
        const RF_OUT8(io_coverage_bytes_0,7,0){1446 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_1,7,0){1447 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_50,7,0){1496 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 41 
        const RF_OUT8(io_coverage_bytes_2,7,0){1448 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_6,7,0){1452 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_7,7,0){1453 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_8,7,0){1454 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_9,7,0){1455 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 28 
        const RF_IN8(io_input_bytes_0,7,0){1422 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_1,7,0){1423 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_2,7,0){1424 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_3,7,0){1425 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_4,7,0){1426 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_5,7,0){1427 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_6,7,0){1428 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_7,7,0){1429 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_8,7,0){1430 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_9,7,0){1431 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_10,7,0){1432 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_11,7,0){1433 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_12,7,0){1434 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_13,7,0){1435 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_14,7,0){1436 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_15,7,0){1437 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_16,7,0){1438 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_17,7,0){1439 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_18,7,0){1440 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_19,7,0){1441 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_20,7,0){1442 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_21,7,0){1443 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_22,7,0){1444 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_23,7,0){1445 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 1 16 17 18 19 20 22 23 24 25 26 28 31 34 
        const RF_IN8(io_meta_reset,0,0){1636 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 22 23 24 25 26 28 31 34 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 
        const RF_IN8(clock,0,0){1420 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 22 23 24 25 26 28 31 34 35 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 
        const RF_IN8(reset,0,0){1421 * BATCH_SIZE/*CData*/};

        // LOCAL SIGNALS
        // Internals; generally not touched by application code
        // Anonymous structures to workaround compiler member-count bugs
        struct {
            // Begin mtask footprint all: 11 12 13 14 15 39 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 
            // Begin mtask footprint all: 11 
            // Begin mtask footprint all: 7 11 
            // Begin mtask footprint all: 7 
            // Begin mtask footprint all: 7 47 
            // Begin mtask footprint all: 47 
            // Begin mtask footprint all: 8 47 
        };
        struct {
            // Begin mtask footprint all: 8 
            // Begin mtask footprint all: 8 48 
            // Begin mtask footprint all: 48 
            // Begin mtask footprint all: 9 48 
            // Begin mtask footprint all: 9 
        };
        struct {
            // Begin mtask footprint all: 9 49 
            // Begin mtask footprint all: 49 
            // Begin mtask footprint all: 50 
        };
        struct {
            // Begin mtask footprint all: 9 50 
            // Begin mtask footprint all: 9 51 
            // Begin mtask footprint all: 51 
            // Begin mtask footprint all: 52 
        };
        struct {
            // Begin mtask footprint all: 9 52 
            // Begin mtask footprint all: 2 42 
            // Begin mtask footprint all: 42 
            // Begin mtask footprint all: 40 
            // Begin mtask footprint all: 3 
            // Begin mtask footprint all: 3 43 
            // Begin mtask footprint all: 43 
        };
        struct {
            // Begin mtask footprint all: 44 
            // Begin mtask footprint all: 4 44 
            // Begin mtask footprint all: 4 
            // Begin mtask footprint all: 5 
            // Begin mtask footprint all: 5 45 
            // Begin mtask footprint all: 45 
            // Begin mtask footprint all: 46 
        };
        struct {
            // Begin mtask footprint all: 6 46 
            // Begin mtask footprint all: 6 
            // Begin mtask footprint all: 12 
            // Begin mtask footprint all: 10 11 
            // Begin mtask footprint all: 10 
        };
        struct {
            // Begin mtask footprint all: 10 52 
            // Begin mtask footprint all: 10 53 
            // Begin mtask footprint all: 53 
            // Begin mtask footprint all: 54 
        };
        struct {
            // Begin mtask footprint all: 13 
            // Begin mtask footprint all: 14 
            // Begin mtask footprint all: 55 
        };
        struct {
            // Begin mtask footprint all: 56 
            // Begin mtask footprint all: 57 
        };
        struct {
            // Begin mtask footprint all: 58 
            // Begin mtask footprint all: 59 
        };
        struct {
            // Begin mtask footprint all: 60 
            // Begin mtask footprint all: 61 
        };
        struct {
            // Begin mtask footprint all: 62 
            // Begin mtask footprint all: 63 
        };
        struct {
            // Begin mtask footprint all: 64 
            // Begin mtask footprint all: 65 
        };
        struct {
            // Begin mtask footprint all: 66 
            // Begin mtask footprint all: 21 39 
            // Begin mtask footprint all: 39 
            // Begin mtask footprint all: 19 39 
            // Begin mtask footprint all: 19 28 39 
            // Begin mtask footprint all: 19 38 39 
            // Begin mtask footprint all: 24 38 39 
            // Begin mtask footprint all: 25 38 39 
            // Begin mtask footprint all: 19 38 
            // Begin mtask footprint all: 38 
            // Begin mtask footprint all: 31 38 39 
        };
        struct {
            // Begin mtask footprint all: 19 37 39 
            // Begin mtask footprint all: 37 39 
            // Begin mtask footprint all: 24 37 39 
            // Begin mtask footprint all: 25 37 39 
            // Begin mtask footprint all: 31 37 39 
            // Begin mtask footprint all: 37 
            // Begin mtask footprint all: 36 
            // Begin mtask footprint all: 36 39 
            // Begin mtask footprint all: 26 39 
            // Begin mtask footprint all: 26 32 39 
            // Begin mtask footprint all: 26 32 
            // Begin mtask footprint all: 26 31 32 
            // Begin mtask footprint all: 31 32 
            // Begin mtask footprint all: 26 28 31 
            // Begin mtask footprint all: 19 24 26 27 31 39 
            // Begin mtask footprint all: 19 23 24 26 27 31 39 
            // Begin mtask footprint all: 19 23 24 26 27 31 33 39 
            // Begin mtask footprint all: 23 27 33 39 
            // Begin mtask footprint all: 23 27 29 33 39 
            // Begin mtask footprint all: 23 25 27 29 33 39 
            // Begin mtask footprint all: 23 25 33 
            // Begin mtask footprint all: 23 33 
            // Begin mtask footprint all: 23 27 33 
            // Begin mtask footprint all: 27 33 
            // Begin mtask footprint all: 23 27 28 29 39 
            // Begin mtask footprint all: 23 27 29 33 
            // Begin mtask footprint all: 23 27 
        };
        struct {
            // Begin mtask footprint all: 25 27 
            // Begin mtask footprint all: 27 39 
            // Begin mtask footprint all: 1 20 27 39 
            // Begin mtask footprint all: 27 32 39 
            // Begin mtask footprint all: 32 39 
            // Begin mtask footprint all: 26 29 33 39 
            // Begin mtask footprint all: 33 39 
            // Begin mtask footprint all: 29 39 
            // Begin mtask footprint all: 29 30 39 
            // Begin mtask footprint all: 17 19 29 
            // Begin mtask footprint all: 17 29 
            // Begin mtask footprint all: 29 
            // Begin mtask footprint all: 24 29 39 
            // Begin mtask footprint all: 24 29 
            // Begin mtask footprint all: 24 
            // Begin mtask footprint all: 1 24 
            // Begin mtask footprint all: 1 24 30 
            // Begin mtask footprint all: 24 30 
            // Begin mtask footprint all: 24 28 30 39 
            // Begin mtask footprint all: 1 24 30 33 39 
            // Begin mtask footprint all: 1 30 
            // Begin mtask footprint all: 30 
            // Begin mtask footprint all: 26 30 
            // Begin mtask footprint all: 20 30 
            // Begin mtask footprint all: 20 28 30 
            // Begin mtask footprint all: 28 30 
            // Begin mtask footprint all: 19 28 29 30 
            // Begin mtask footprint all: 28 29 
            // Begin mtask footprint all: 1 28 29 
            // Begin mtask footprint all: 1 29 
            // Begin mtask footprint all: 24 26 29 
            // Begin mtask footprint all: 22 26 
            // Begin mtask footprint all: 22 32 
        };
        struct {
            // Begin mtask footprint all: 22 32 39 
            // Begin mtask footprint all: 19 32 
            // Begin mtask footprint all: 1 19 
            // Begin mtask footprint all: 1 21 
            // Begin mtask footprint all: 21 
            // Begin mtask footprint all: 16 21 
            // Begin mtask footprint all: 16 20 21 
            // Begin mtask footprint all: 20 21 
            // Begin mtask footprint all: 16 20 21 28 
            // Begin mtask footprint all: 20 21 28 
            // Begin mtask footprint all: 20 21 28 39 
            // Begin mtask footprint all: 21 28 
            // Begin mtask footprint all: 21 28 37 38 
            // Begin mtask footprint all: 21 28 29 37 38 
            // Begin mtask footprint all: 2 18 19 21 24 25 28 29 31 34 35 36 37 38 39 
            // Begin mtask footprint all: 18 34 35 39 
            // Begin mtask footprint all: 18 35 39 
            // Begin mtask footprint all: 18 35 
            // Begin mtask footprint all: 18 
            // Begin mtask footprint all: 2 18 
            // Begin mtask footprint all: 2 18 34 
            // Begin mtask footprint all: 2 34 
        };
        struct {
            // Begin mtask footprint all: 2 
            // Begin mtask footprint all: 2 35 
            // Begin mtask footprint all: 2 35 39 
            // Begin mtask footprint all: 35 
            // Begin mtask footprint all: 15 
            // Begin mtask footprint all: 2 41 
            // Begin mtask footprint all: 41 
        };
        struct {
            // Begin mtask footprint all: 2 40 41 42 43 44 45 46 
        };

        // LOCAL VARIABLES
        // Internals; generally not touched by application code
        // Begin mtask footprint all: 23 33 
        // Begin mtask footprint all: 

        // INTERNAL VARIABLES
        // Internals; generally not touched by application code
        Top__Syms* __VlSymsp;  // Symbol table
      private:
      public:

        // CONSTRUCTORS
      private:
        VL_UNCOPYABLE(Top);  ///< Copying not allowed
      public:
        /// Construct the model; called by application code
        /// If contextp is null, then the model will use the default global context
        /// If name is "", then makes a wrapper with a
        /// single model invisible with respect to DPI scope names.
        Top(VerilatedContext* contextp, const char* name = "TOP");
        Top(const char* name = "TOP")
          : Top(nullptr, name) {}
        /// Destroy the model; called (often implicitly) by application code
        ~Top();

        // API METHODS
        /// Return current simulation context for this model.
        /// Used to get to e.g. simulation time via contextp()->time()
        VerilatedContext* contextp();
        /// Evaluate the model.  Application must call when inputs change.
        void eval() { eval_step(); }
        /// Evaluate when calling multiple units/models per time step.
        void eval_step();
        /// Evaluate at end of a timestep for tracing, when using eval_step().
        /// Application must call after all eval() and before time changes.
        void eval_end_step() {}
        /// Simulation complete, run final blocks.  Application must call on completion.
        void final();

        // INTERNAL METHODS
        void __Vconfigure(Top__Syms* symsp, bool first);
        static void _initial__TOP__1(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals) VL_ATTR_COLD;
        __device__
        static void _settle__TOP__2(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals) VL_ATTR_COLD;
        __device__
        static void _sequent__TOP__3(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__4(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__5(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__6(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__7(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__8(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__9(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__10(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__11(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__12(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__13(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__14(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__15(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__16(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__17(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__18(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__19(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__20(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__21(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__22(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__23(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__24(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__25(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__26(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__27(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__28(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__29(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__30(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__31(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__32(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__34(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__35(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__36(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__37(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__38(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__39(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__40(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__41(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__42(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__43(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__44(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__45(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__46(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__47(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__48(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__49(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__50(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__51(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__52(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__53(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__54(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__55(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__56(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__57(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__58(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__59(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__60(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__61(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__62(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__63(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__64(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__65(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__66(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__67(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__68(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__69(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__70(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__71(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__72(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__73(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__74(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__75(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__76(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__77(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__78(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__79(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__80(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__81(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__82(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__83(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__84(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__85(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__86(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__87(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__88(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__89(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__90(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__91(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__92(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__93(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__94(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__95(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__96(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__97(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__98(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__99(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__100(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__101(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__102(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__103(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__104(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__105(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__106(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        static void _eval_initial(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals) VL_ATTR_COLD;
      private:
        __device__
        static IData _change_request_1(CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
#ifdef VL_DEBUG
        void _eval_debug_assertions();
#endif  // VL_DEBUG
        static void _ctor_var_reset(CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals) VL_ATTR_COLD;
        friend __global__ void _last_assign(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        friend __global__ void _eval_settle(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        friend __global__ void _change_request(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change);
        friend __global__ void __Vmtask__1(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__3(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__4(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__5(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__6(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__7(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__8(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__9(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__10(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__16(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__17(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__18(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__20(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__22(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__23(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__24(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__25(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__26(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__31(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__19(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__28(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__30(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__32(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__33(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__34(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__35(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__36(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__37(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__38(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__2(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__21(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__27(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__29(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__39(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__40(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__41(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__42(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__43(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__44(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__45(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__46(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__47(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__48(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__49(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__50(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__51(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__52(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__53(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__54(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__55(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__56(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__57(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__58(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__59(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__60(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__61(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__62(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__63(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__64(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__65(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__66(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__11(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__12(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__13(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__14(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__15(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    } VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

    //----------
    
} // end of namespace RF ========================================

#endif  // guard
