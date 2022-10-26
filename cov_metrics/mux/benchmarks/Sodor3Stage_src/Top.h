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
    __global__ void __Vmtask__4(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__6(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__7(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__8(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__9(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__10(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__16(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__17(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__18(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__19(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__20(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__21(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__22(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__23(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__25(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__26(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__27(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__29(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__30(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__31(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__32(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__1(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__2(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__24(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__28(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__36(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__37(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__38(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
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
    __global__ void __Vmtask__34(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__35(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__39(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__52(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__5(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__11(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__12(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__13(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__14(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__15(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__51(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
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
    __global__ void __Vmtask__67(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__68(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__69(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__70(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__71(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    __global__ void __Vmtask__72(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);

    //==========
    
    
    //----------
    
    VL_MODULE(Top) {
        friend class RTLflow;
      public:

        // PORTS
        // The application code writes and reads these signals to
        // propagate new values into/out from the Verilated model.
        // Begin mtask footprint all: 72 
        const RF_OUT8(io_coverage_bytes_43,7,0){1870 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_44,7,0){1871 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_75,7,0){1902 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_101,7,0){1928 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_126,7,0){1953 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_151,7,0){1978 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_176,7,0){2003 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 14 
        const RF_OUT8(io_coverage_bytes_81,7,0){1908 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_82,7,0){1909 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_105,7,0){1932 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_130,7,0){1957 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_155,7,0){1982 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_180,7,0){2007 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 15 
        const RF_OUT8(io_coverage_bytes_83,7,0){1910 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_84,7,0){1911 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_106,7,0){1933 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_131,7,0){1958 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_156,7,0){1983 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_181,7,0){2008 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 12 
        const RF_OUT8(io_coverage_bytes_77,7,0){1904 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_78,7,0){1905 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_103,7,0){1930 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_128,7,0){1955 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_153,7,0){1980 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_178,7,0){2005 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 13 
        const RF_OUT8(io_coverage_bytes_79,7,0){1906 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_80,7,0){1907 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_104,7,0){1931 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_129,7,0){1956 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_154,7,0){1981 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_179,7,0){2006 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 10 
        const RF_OUT8(io_coverage_bytes_22,7,0){1849 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_65,7,0){1892 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 11 
        const RF_OUT8(io_coverage_bytes_76,7,0){1903 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_102,7,0){1929 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_127,7,0){1954 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_152,7,0){1979 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_177,7,0){2004 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 8 
        const RF_OUT8(io_coverage_bytes_18,7,0){1845 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_63,7,0){1890 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 9 
        const RF_OUT8(io_coverage_bytes_20,7,0){1847 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_64,7,0){1891 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 6 
        const RF_OUT8(io_coverage_bytes_2,7,0){1829 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_3,7,0){1830 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_4,7,0){1831 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_39,7,0){1866 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_42,7,0){1869 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_51,7,0){1878 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_55,7,0){1882 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_56,7,0){1883 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 7 
        const RF_OUT8(io_coverage_bytes_6,7,0){1833 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_7,7,0){1834 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_8,7,0){1835 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_10,7,0){1837 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_11,7,0){1838 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_12,7,0){1839 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_14,7,0){1841 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_15,7,0){1842 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_16,7,0){1843 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_46,7,0){1873 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_48,7,0){1875 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_49,7,0){1876 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_52,7,0){1879 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_53,7,0){1880 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_54,7,0){1881 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_57,7,0){1884 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_58,7,0){1885 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_59,7,0){1886 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_60,7,0){1887 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_61,7,0){1888 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_62,7,0){1889 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 5 
        const RF_OUT8(io_coverage_bytes_1,7,0){1828 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 
        const RF_IN8(io_input_bytes_4,7,0){1823 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_5,7,0){1824 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_6,7,0){1825 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_7,7,0){1826 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_192,7,0){2019 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_193,7,0){2020 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_194,7,0){2021 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_195,7,0){2022 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_196,7,0){2023 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_197,7,0){2024 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 70 
        const RF_OUT8(io_coverage_bytes_37,7,0){1864 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_38,7,0){1865 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_73,7,0){1900 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_99,7,0){1926 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_124,7,0){1951 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_149,7,0){1976 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_174,7,0){2001 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 71 
        const RF_OUT8(io_coverage_bytes_40,7,0){1867 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_41,7,0){1868 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_74,7,0){1901 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_100,7,0){1927 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_125,7,0){1952 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_150,7,0){1977 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_175,7,0){2002 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 68 
        const RF_OUT8(io_coverage_bytes_33,7,0){1860 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_34,7,0){1861 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_71,7,0){1898 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_97,7,0){1924 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_122,7,0){1949 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_147,7,0){1974 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_172,7,0){1999 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 69 
        const RF_OUT8(io_coverage_bytes_35,7,0){1862 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_36,7,0){1863 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_72,7,0){1899 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_98,7,0){1925 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_123,7,0){1950 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_148,7,0){1975 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_173,7,0){2000 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 66 
        const RF_OUT8(io_coverage_bytes_29,7,0){1856 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_30,7,0){1857 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_69,7,0){1896 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_95,7,0){1922 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_120,7,0){1947 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_145,7,0){1972 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_170,7,0){1997 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 67 
        const RF_OUT8(io_coverage_bytes_31,7,0){1858 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_32,7,0){1859 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_70,7,0){1897 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_96,7,0){1923 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_121,7,0){1948 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_146,7,0){1973 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_171,7,0){1998 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 64 
        const RF_OUT8(io_coverage_bytes_25,7,0){1852 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_26,7,0){1853 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_67,7,0){1894 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_93,7,0){1920 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_118,7,0){1945 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_143,7,0){1970 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_168,7,0){1995 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 65 
        const RF_OUT8(io_coverage_bytes_27,7,0){1854 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_28,7,0){1855 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_68,7,0){1895 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_94,7,0){1921 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_119,7,0){1946 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_144,7,0){1971 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_169,7,0){1996 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 62 
        const RF_OUT8(io_coverage_bytes_21,7,0){1848 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_91,7,0){1918 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_116,7,0){1943 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_141,7,0){1968 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_166,7,0){1993 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_191,7,0){2018 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 63 
        const RF_OUT8(io_coverage_bytes_23,7,0){1850 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_24,7,0){1851 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_66,7,0){1893 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_92,7,0){1919 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_117,7,0){1944 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_142,7,0){1969 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_167,7,0){1994 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 60 
        const RF_OUT8(io_coverage_bytes_17,7,0){1844 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_89,7,0){1916 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_114,7,0){1941 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_139,7,0){1966 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_164,7,0){1991 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_189,7,0){2016 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 61 
        const RF_OUT8(io_coverage_bytes_19,7,0){1846 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_90,7,0){1917 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_115,7,0){1942 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_140,7,0){1967 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_165,7,0){1992 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_190,7,0){2017 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 58 
        const RF_OUT8(io_coverage_bytes_13,7,0){1840 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_109,7,0){1936 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_134,7,0){1961 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_159,7,0){1986 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_184,7,0){2011 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 59 
        const RF_OUT8(io_coverage_bytes_50,7,0){1877 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_88,7,0){1915 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_113,7,0){1940 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_138,7,0){1965 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_163,7,0){1990 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_188,7,0){2015 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 56 
        const RF_OUT8(io_coverage_bytes_9,7,0){1836 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_108,7,0){1935 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_133,7,0){1960 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_158,7,0){1985 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_183,7,0){2010 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 57 
        const RF_OUT8(io_coverage_bytes_47,7,0){1874 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_87,7,0){1914 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_112,7,0){1939 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_137,7,0){1964 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_162,7,0){1989 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_187,7,0){2014 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 54 
        const RF_OUT8(io_coverage_bytes_5,7,0){1832 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_107,7,0){1934 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_132,7,0){1959 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_157,7,0){1984 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_182,7,0){2009 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 55 
        const RF_OUT8(io_coverage_bytes_45,7,0){1872 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_86,7,0){1913 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_111,7,0){1938 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_136,7,0){1963 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_161,7,0){1988 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_186,7,0){2013 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 37 
        const RF_OUT8(io_coverage_bytes_0,7,0){1827 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 53 
        const RF_OUT8(io_coverage_bytes_85,7,0){1912 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_110,7,0){1937 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_135,7,0){1962 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_160,7,0){1987 * BATCH_SIZE/*CData*/};
        const RF_OUT8(io_coverage_bytes_185,7,0){2012 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 28 
        const RF_IN8(io_input_bytes_0,7,0){1819 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_1,7,0){1820 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_2,7,0){1821 * BATCH_SIZE/*CData*/};
        const RF_IN8(io_input_bytes_3,7,0){1822 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 1 2 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 36 37 39 41 47 
        const RF_IN8(io_meta_reset,0,0){2025 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 36 37 39 41 47 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 
        const RF_IN8(clock,0,0){1817 * BATCH_SIZE/*CData*/};
        // Begin mtask footprint all: 5 6 7 8 9 10 11 12 13 14 15 24 25 26 27 29 30 31 32 36 37 39 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 
        const RF_IN8(reset,0,0){1818 * BATCH_SIZE/*CData*/};

        // LOCAL SIGNALS
        // Internals; generally not touched by application code
        // Anonymous structures to workaround compiler member-count bugs
        struct {
            // Begin mtask footprint all: 26 28 34 37 38 39 40 41 43 44 45 46 47 52 
            // Begin mtask footprint all: 26 34 47 52 
            // Begin mtask footprint all: 34 47 52 
            // Begin mtask footprint all: 28 34 36 52 
            // Begin mtask footprint all: 28 34 36 39 52 
            // Begin mtask footprint all: 28 36 37 48 52 
            // Begin mtask footprint all: 36 37 52 
            // Begin mtask footprint all: 26 36 37 52 
            // Begin mtask footprint all: 27 37 42 52 
            // Begin mtask footprint all: 37 52 
            // Begin mtask footprint all: 51 52 
            // Begin mtask footprint all: 43 51 52 
            // Begin mtask footprint all: 43 51 
            // Begin mtask footprint all: 43 
            // Begin mtask footprint all: 51 
            // Begin mtask footprint all: 47 51 
            // Begin mtask footprint all: 47 
        };
        struct {
            // Begin mtask footprint all: 47 52 
            // Begin mtask footprint all: 34 45 
            // Begin mtask footprint all: 45 
            // Begin mtask footprint all: 14 
            // Begin mtask footprint all: 15 
        };
        struct {
            // Begin mtask footprint all: 12 
            // Begin mtask footprint all: 13 
        };
        struct {
            // Begin mtask footprint all: 10 
            // Begin mtask footprint all: 10 62 
            // Begin mtask footprint all: 62 
        };
        struct {
            // Begin mtask footprint all: 63 
            // Begin mtask footprint all: 8 
            // Begin mtask footprint all: 8 60 
        };
        struct {
            // Begin mtask footprint all: 60 
            // Begin mtask footprint all: 61 
        };
        struct {
            // Begin mtask footprint all: 9 61 
            // Begin mtask footprint all: 9 
            // Begin mtask footprint all: 1 51 
            // Begin mtask footprint all: 17 35 51 
            // Begin mtask footprint all: 17 34 35 51 
            // Begin mtask footprint all: 2 17 35 51 
            // Begin mtask footprint all: 2 3 35 51 
            // Begin mtask footprint all: 2 20 35 51 
        };
        struct {
            // Begin mtask footprint all: 2 22 35 51 
            // Begin mtask footprint all: 22 35 51 
            // Begin mtask footprint all: 22 34 35 51 
            // Begin mtask footprint all: 22 34 35 
            // Begin mtask footprint all: 1 34 35 51 
            // Begin mtask footprint all: 23 34 35 51 
            // Begin mtask footprint all: 20 33 35 51 
        };
        struct {
            // Begin mtask footprint all: 1 33 35 51 
            // Begin mtask footprint all: 1 35 51 
            // Begin mtask footprint all: 21 35 51 
            // Begin mtask footprint all: 21 33 35 51 
            // Begin mtask footprint all: 3 33 35 51 
        };
        struct {
            // Begin mtask footprint all: 19 33 35 51 
            // Begin mtask footprint all: 23 33 35 51 
            // Begin mtask footprint all: 2 23 35 51 
            // Begin mtask footprint all: 2 19 35 51 
            // Begin mtask footprint all: 2 18 35 51 
        };
        struct {
            // Begin mtask footprint all: 18 35 51 
            // Begin mtask footprint all: 18 34 35 51 
            // Begin mtask footprint all: 2 51 
            // Begin mtask footprint all: 2 
            // Begin mtask footprint all: 2 5 
            // Begin mtask footprint all: 11 
        };
        struct {
            // Begin mtask footprint all: 7 11 
            // Begin mtask footprint all: 7 
            // Begin mtask footprint all: 7 58 
        };
        struct {
            // Begin mtask footprint all: 58 
            // Begin mtask footprint all: 59 
        };
        struct {
            // Begin mtask footprint all: 7 59 
            // Begin mtask footprint all: 7 56 
            // Begin mtask footprint all: 56 
        };
        struct {
            // Begin mtask footprint all: 57 
            // Begin mtask footprint all: 7 57 
            // Begin mtask footprint all: 7 54 
            // Begin mtask footprint all: 7 55 
        };
        struct {
            // Begin mtask footprint all: 55 
            // Begin mtask footprint all: 54 
        };
        struct {
            // Begin mtask footprint all: 6 54 
            // Begin mtask footprint all: 6 
            // Begin mtask footprint all: 6 53 
            // Begin mtask footprint all: 53 
        };
        struct {
            // Begin mtask footprint all: 5 53 
            // Begin mtask footprint all: 5 26 
            // Begin mtask footprint all: 5 26 41 
            // Begin mtask footprint all: 26 41 
            // Begin mtask footprint all: 26 41 52 
            // Begin mtask footprint all: 41 52 
            // Begin mtask footprint all: 41 
            // Begin mtask footprint all: 5 41 
            // Begin mtask footprint all: 5 35 
            // Begin mtask footprint all: 26 38 
            // Begin mtask footprint all: 72 
        };
        struct {
            // Begin mtask footprint all: 1 
            // Begin mtask footprint all: 70 
        };
        struct {
            // Begin mtask footprint all: 71 
            // Begin mtask footprint all: 68 
        };
        struct {
            // Begin mtask footprint all: 69 
        };
        struct {
            // Begin mtask footprint all: 66 
            // Begin mtask footprint all: 67 
        };
        struct {
            // Begin mtask footprint all: 64 
            // Begin mtask footprint all: 65 
        };
        struct {
            // Begin mtask footprint all: 46 
            // Begin mtask footprint all: 38 46 
            // Begin mtask footprint all: 28 46 
            // Begin mtask footprint all: 28 46 52 
            // Begin mtask footprint all: 26 28 42 52 
            // Begin mtask footprint all: 26 28 42 
            // Begin mtask footprint all: 26 28 36 
            // Begin mtask footprint all: 36 
            // Begin mtask footprint all: 36 52 
            // Begin mtask footprint all: 36 37 
            // Begin mtask footprint all: 36 39 
            // Begin mtask footprint all: 39 
        };
        struct {
            // Begin mtask footprint all: 28 39 
            // Begin mtask footprint all: 28 39 47 
            // Begin mtask footprint all: 24 39 47 
            // Begin mtask footprint all: 25 39 47 
            // Begin mtask footprint all: 26 39 47 
            // Begin mtask footprint all: 24 29 39 47 
            // Begin mtask footprint all: 24 30 39 47 
            // Begin mtask footprint all: 24 31 39 47 
        };
        struct {
            // Begin mtask footprint all: 24 32 39 47 
            // Begin mtask footprint all: 28 29 30 31 32 39 47 
            // Begin mtask footprint all: 24 25 26 29 30 31 32 39 
            // Begin mtask footprint all: 1 17 18 21 22 23 51 
            // Begin mtask footprint all: 1 17 18 19 20 21 22 23 47 51 
            // Begin mtask footprint all: 1 5 17 18 19 20 21 22 23 34 51 
            // Begin mtask footprint all: 1 17 18 19 20 22 23 51 
            // Begin mtask footprint all: 1 17 19 20 22 51 
            // Begin mtask footprint all: 1 17 51 
            // Begin mtask footprint all: 42 
            // Begin mtask footprint all: 27 42 
            // Begin mtask footprint all: 27 36 42 
            // Begin mtask footprint all: 26 27 28 36 37 42 48 49 50 52 
            // Begin mtask footprint all: 26 27 37 49 50 
            // Begin mtask footprint all: 26 27 48 49 50 
            // Begin mtask footprint all: 26 27 49 
            // Begin mtask footprint all: 27 49 
            // Begin mtask footprint all: 27 49 52 
            // Begin mtask footprint all: 27 42 49 
            // Begin mtask footprint all: 27 28 42 
            // Begin mtask footprint all: 27 28 
            // Begin mtask footprint all: 28 34 
            // Begin mtask footprint all: 28 49 
            // Begin mtask footprint all: 28 42 49 
            // Begin mtask footprint all: 16 42 49 
            // Begin mtask footprint all: 16 49 
        };
        struct {
            // Begin mtask footprint all: 16 50 
            // Begin mtask footprint all: 16 42 50 
            // Begin mtask footprint all: 16 42 48 49 
            // Begin mtask footprint all: 42 48 
            // Begin mtask footprint all: 48 
            // Begin mtask footprint all: 26 48 
            // Begin mtask footprint all: 26 47 48 51 
            // Begin mtask footprint all: 37 48 49 
            // Begin mtask footprint all: 37 49 
            // Begin mtask footprint all: 37 
            // Begin mtask footprint all: 27 37 
        };
        struct {
            // Begin mtask footprint all: 27 37 52 
            // Begin mtask footprint all: 27 36 37 52 
            // Begin mtask footprint all: 27 36 52 
            // Begin mtask footprint all: 26 27 36 52 
            // Begin mtask footprint all: 34 36 52 
            // Begin mtask footprint all: 34 52 
            // Begin mtask footprint all: 52 
            // Begin mtask footprint all: 40 52 
            // Begin mtask footprint all: 40 
            // Begin mtask footprint all: 44 
            // Begin mtask footprint all: 44 52 
            // Begin mtask footprint all: 5 52 
            // Begin mtask footprint all: 5 
            // Begin mtask footprint all: 5 11 
            // Begin mtask footprint all: 5 11 12 13 14 15 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 
        };

        // LOCAL VARIABLES
        // Internals; generally not touched by application code
        // Begin mtask footprint all: 4 26 47 
        // Begin mtask footprint all: 26 47 
        // Begin mtask footprint all: 1 2 
        // Begin mtask footprint all: 
        // Begin mtask footprint all: 2 17 

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
        static void _sequent__TOP__24(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__25(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__26(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__27(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__28(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__30(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__31(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__32(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__33(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__34(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__35(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__36(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__37(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__38(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__39(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__40(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__41(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__42(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__43(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__44(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__45(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__46(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__47(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__48(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
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
        static void _sequent__TOP__66(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__67(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__68(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__69(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__70(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__71(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__72(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__73(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__74(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__75(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__76(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__77(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__78(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__79(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__80(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__81(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__82(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__83(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__84(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__85(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__86(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__87(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__88(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__89(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__90(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__91(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__92(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__93(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__94(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__95(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__96(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__97(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__98(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__99(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__100(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__101(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__102(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__103(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _sequent__TOP__104(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
        __device__
        static void _combo__TOP__105(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
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
        friend __global__ void __Vmtask__4(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__6(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__7(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__8(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__9(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__10(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__16(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__17(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__18(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__19(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__20(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__21(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__22(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__23(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__25(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__26(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__27(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__29(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__30(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__31(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__32(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__1(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__2(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__24(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__28(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__36(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__37(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__38(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
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
        friend __global__ void __Vmtask__34(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__35(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__39(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__52(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__5(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__11(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__12(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__13(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__14(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__15(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__51(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
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
        friend __global__ void __Vmtask__67(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__68(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__69(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__70(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__71(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
        friend __global__ void __Vmtask__72(void* symtab, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals, IData* change, bool* done);
    } VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

    //----------
    
} // end of namespace RF ========================================

#endif  // guard
