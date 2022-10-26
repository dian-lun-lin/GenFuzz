#pragma once

#include <Top.h>
#include <rtlflow.h>

#define TOPLEVEL_STR "TLSPI"

static constexpr size_t COVERAGE_SIZE = 190;
static constexpr size_t INPUT_SIZE    = 24;

inline void apply_input(
  RF::RTLflow& rtlflow, 
  RF::Top* dut, 
  size_t num_inputs,
  size_t c, 
  const std::vector<std::vector<std::vector<uint8_t>>>& inputs
) {

  for(size_t i = 0; i < num_inputs; ++i) {
    if(c < inputs[i].size()) {
      *rtlflow.get(dut->io_input_bytes_0, i)  = inputs[i][c][  0];
      *rtlflow.get(dut->io_input_bytes_1, i)  = inputs[i][c][  1];
      *rtlflow.get(dut->io_input_bytes_2, i)  = inputs[i][c][  2];
      *rtlflow.get(dut->io_input_bytes_3, i)  = inputs[i][c][  3];
      *rtlflow.get(dut->io_input_bytes_4, i)  = inputs[i][c][  4];
      *rtlflow.get(dut->io_input_bytes_5, i)  = inputs[i][c][  5];
      *rtlflow.get(dut->io_input_bytes_6, i)  = inputs[i][c][  6];
      *rtlflow.get(dut->io_input_bytes_7, i)  = inputs[i][c][  7];
      *rtlflow.get(dut->io_input_bytes_8, i)  = inputs[i][c][  8];
      *rtlflow.get(dut->io_input_bytes_9, i)  = inputs[i][c][  9];
      *rtlflow.get(dut->io_input_bytes_10, i) = inputs[i][c][ 10];
      *rtlflow.get(dut->io_input_bytes_11, i) = inputs[i][c][ 11];
      *rtlflow.get(dut->io_input_bytes_12, i) = inputs[i][c][ 12];
      *rtlflow.get(dut->io_input_bytes_13, i) = inputs[i][c][ 13];
      *rtlflow.get(dut->io_input_bytes_14, i) = inputs[i][c][ 14];
      *rtlflow.get(dut->io_input_bytes_15, i) = inputs[i][c][ 15];
      *rtlflow.get(dut->io_input_bytes_16, i) = inputs[i][c][ 16];
      *rtlflow.get(dut->io_input_bytes_17, i) = inputs[i][c][ 17];
      *rtlflow.get(dut->io_input_bytes_18, i) = inputs[i][c][ 18];
      *rtlflow.get(dut->io_input_bytes_19, i) = inputs[i][c][ 19];
      *rtlflow.get(dut->io_input_bytes_20, i) = inputs[i][c][ 20];
      *rtlflow.get(dut->io_input_bytes_21, i) = inputs[i][c][ 21];
      *rtlflow.get(dut->io_input_bytes_22, i) = inputs[i][c][ 22];
      *rtlflow.get(dut->io_input_bytes_23, i) = inputs[i][c][ 23];
    }
  }
}
inline void read_coverages(
  RF::RTLflow& rtlflow, 
  RF::Top* dut, 
  size_t num_inputs,
  std::vector<std::vector<uint8_t>>& coverages
) {

  for(size_t i = 0; i < num_inputs; ++i) {
    coverages[i][  0] = *rtlflow.get(dut->io_coverage_bytes_0, i);
    coverages[i][  1] = *rtlflow.get(dut->io_coverage_bytes_1, i);
    coverages[i][  2] = *rtlflow.get(dut->io_coverage_bytes_2, i);
    coverages[i][  3] = *rtlflow.get(dut->io_coverage_bytes_3, i);
    coverages[i][  4] = *rtlflow.get(dut->io_coverage_bytes_4, i);
    coverages[i][  5] = *rtlflow.get(dut->io_coverage_bytes_5, i);
    coverages[i][  6] = *rtlflow.get(dut->io_coverage_bytes_6, i);
    coverages[i][  7] = *rtlflow.get(dut->io_coverage_bytes_7, i);
    coverages[i][  8] = *rtlflow.get(dut->io_coverage_bytes_8, i);
    coverages[i][  9] = *rtlflow.get(dut->io_coverage_bytes_9, i);
    coverages[i][ 10] = *rtlflow.get(dut->io_coverage_bytes_10, i);
    coverages[i][ 11] = *rtlflow.get(dut->io_coverage_bytes_11, i);
    coverages[i][ 12] = *rtlflow.get(dut->io_coverage_bytes_12, i);
    coverages[i][ 13] = *rtlflow.get(dut->io_coverage_bytes_13, i);
    coverages[i][ 14] = *rtlflow.get(dut->io_coverage_bytes_14, i);
    coverages[i][ 15] = *rtlflow.get(dut->io_coverage_bytes_15, i);
    coverages[i][ 16] = *rtlflow.get(dut->io_coverage_bytes_16, i);
    coverages[i][ 17] = *rtlflow.get(dut->io_coverage_bytes_17, i);
    coverages[i][ 18] = *rtlflow.get(dut->io_coverage_bytes_18, i);
    coverages[i][ 19] = *rtlflow.get(dut->io_coverage_bytes_19, i);
    coverages[i][ 20] = *rtlflow.get(dut->io_coverage_bytes_20, i);
    coverages[i][ 21] = *rtlflow.get(dut->io_coverage_bytes_21, i);
    coverages[i][ 22] = *rtlflow.get(dut->io_coverage_bytes_22, i);
    coverages[i][ 23] = *rtlflow.get(dut->io_coverage_bytes_23, i);
    coverages[i][ 24] = *rtlflow.get(dut->io_coverage_bytes_24, i);
    coverages[i][ 25] = *rtlflow.get(dut->io_coverage_bytes_25, i);
    coverages[i][ 26] = *rtlflow.get(dut->io_coverage_bytes_26, i);
    coverages[i][ 27] = *rtlflow.get(dut->io_coverage_bytes_27, i);
    coverages[i][ 28] = *rtlflow.get(dut->io_coverage_bytes_28, i);
    coverages[i][ 29] = *rtlflow.get(dut->io_coverage_bytes_29, i);
    coverages[i][ 30] = *rtlflow.get(dut->io_coverage_bytes_30, i);
    coverages[i][ 31] = *rtlflow.get(dut->io_coverage_bytes_31, i);
    coverages[i][ 32] = *rtlflow.get(dut->io_coverage_bytes_32, i);
    coverages[i][ 33] = *rtlflow.get(dut->io_coverage_bytes_33, i);
    coverages[i][ 34] = *rtlflow.get(dut->io_coverage_bytes_34, i);
    coverages[i][ 35] = *rtlflow.get(dut->io_coverage_bytes_35, i);
    coverages[i][ 36] = *rtlflow.get(dut->io_coverage_bytes_36, i);
    coverages[i][ 37] = *rtlflow.get(dut->io_coverage_bytes_37, i);
    coverages[i][ 38] = *rtlflow.get(dut->io_coverage_bytes_38, i);
    coverages[i][ 39] = *rtlflow.get(dut->io_coverage_bytes_39, i);
    coverages[i][ 40] = *rtlflow.get(dut->io_coverage_bytes_40, i);
    coverages[i][ 41] = *rtlflow.get(dut->io_coverage_bytes_41, i);
    coverages[i][ 42] = *rtlflow.get(dut->io_coverage_bytes_42, i);
    coverages[i][ 43] = *rtlflow.get(dut->io_coverage_bytes_43, i);
    coverages[i][ 44] = *rtlflow.get(dut->io_coverage_bytes_44, i);
    coverages[i][ 45] = *rtlflow.get(dut->io_coverage_bytes_45, i);
    coverages[i][ 46] = *rtlflow.get(dut->io_coverage_bytes_46, i);
    coverages[i][ 47] = *rtlflow.get(dut->io_coverage_bytes_47, i);
    coverages[i][ 48] = *rtlflow.get(dut->io_coverage_bytes_48, i);
    coverages[i][ 49] = *rtlflow.get(dut->io_coverage_bytes_49, i);
    coverages[i][ 50] = *rtlflow.get(dut->io_coverage_bytes_50, i);
    coverages[i][ 51] = *rtlflow.get(dut->io_coverage_bytes_51, i);
    coverages[i][ 52] = *rtlflow.get(dut->io_coverage_bytes_52, i);
    coverages[i][ 53] = *rtlflow.get(dut->io_coverage_bytes_53, i);
    coverages[i][ 54] = *rtlflow.get(dut->io_coverage_bytes_54, i);
    coverages[i][ 55] = *rtlflow.get(dut->io_coverage_bytes_55, i);
    coverages[i][ 56] = *rtlflow.get(dut->io_coverage_bytes_56, i);
    coverages[i][ 57] = *rtlflow.get(dut->io_coverage_bytes_57, i);
    coverages[i][ 58] = *rtlflow.get(dut->io_coverage_bytes_58, i);
    coverages[i][ 59] = *rtlflow.get(dut->io_coverage_bytes_59, i);
    coverages[i][ 60] = *rtlflow.get(dut->io_coverage_bytes_60, i);
    coverages[i][ 61] = *rtlflow.get(dut->io_coverage_bytes_61, i);
    coverages[i][ 62] = *rtlflow.get(dut->io_coverage_bytes_62, i);
    coverages[i][ 63] = *rtlflow.get(dut->io_coverage_bytes_63, i);
    coverages[i][ 64] = *rtlflow.get(dut->io_coverage_bytes_64, i);
    coverages[i][ 65] = *rtlflow.get(dut->io_coverage_bytes_65, i);
    coverages[i][ 66] = *rtlflow.get(dut->io_coverage_bytes_66, i);
    coverages[i][ 67] = *rtlflow.get(dut->io_coverage_bytes_67, i);
    coverages[i][ 68] = *rtlflow.get(dut->io_coverage_bytes_68, i);
    coverages[i][ 69] = *rtlflow.get(dut->io_coverage_bytes_69, i);
    coverages[i][ 70] = *rtlflow.get(dut->io_coverage_bytes_70, i);
    coverages[i][ 71] = *rtlflow.get(dut->io_coverage_bytes_71, i);
    coverages[i][ 72] = *rtlflow.get(dut->io_coverage_bytes_72, i);
    coverages[i][ 73] = *rtlflow.get(dut->io_coverage_bytes_73, i);
    coverages[i][ 74] = *rtlflow.get(dut->io_coverage_bytes_74, i);
    coverages[i][ 75] = *rtlflow.get(dut->io_coverage_bytes_75, i);
    coverages[i][ 76] = *rtlflow.get(dut->io_coverage_bytes_76, i);
    coverages[i][ 77] = *rtlflow.get(dut->io_coverage_bytes_77, i);
    coverages[i][ 78] = *rtlflow.get(dut->io_coverage_bytes_78, i);
    coverages[i][ 79] = *rtlflow.get(dut->io_coverage_bytes_79, i);
    coverages[i][ 80] = *rtlflow.get(dut->io_coverage_bytes_80, i);
    coverages[i][ 81] = *rtlflow.get(dut->io_coverage_bytes_81, i);
    coverages[i][ 82] = *rtlflow.get(dut->io_coverage_bytes_82, i);
    coverages[i][ 83] = *rtlflow.get(dut->io_coverage_bytes_83, i);
    coverages[i][ 84] = *rtlflow.get(dut->io_coverage_bytes_84, i);
    coverages[i][ 85] = *rtlflow.get(dut->io_coverage_bytes_85, i);
    coverages[i][ 86] = *rtlflow.get(dut->io_coverage_bytes_86, i);
    coverages[i][ 87] = *rtlflow.get(dut->io_coverage_bytes_87, i);
    coverages[i][ 88] = *rtlflow.get(dut->io_coverage_bytes_88, i);
    coverages[i][ 89] = *rtlflow.get(dut->io_coverage_bytes_89, i);
    coverages[i][ 90] = *rtlflow.get(dut->io_coverage_bytes_90, i);
    coverages[i][ 91] = *rtlflow.get(dut->io_coverage_bytes_91, i);
    coverages[i][ 92] = *rtlflow.get(dut->io_coverage_bytes_92, i);
    coverages[i][ 93] = *rtlflow.get(dut->io_coverage_bytes_93, i);
    coverages[i][ 94] = *rtlflow.get(dut->io_coverage_bytes_94, i);
    coverages[i][ 95] = *rtlflow.get(dut->io_coverage_bytes_95, i);
    coverages[i][ 96] = *rtlflow.get(dut->io_coverage_bytes_96, i);
    coverages[i][ 97] = *rtlflow.get(dut->io_coverage_bytes_97, i);
    coverages[i][ 98] = *rtlflow.get(dut->io_coverage_bytes_98, i);
    coverages[i][ 99] = *rtlflow.get(dut->io_coverage_bytes_99, i);
    coverages[i][100] = *rtlflow.get(dut->io_coverage_bytes_100, i);
    coverages[i][101] = *rtlflow.get(dut->io_coverage_bytes_101, i);
    coverages[i][102] = *rtlflow.get(dut->io_coverage_bytes_102, i);
    coverages[i][103] = *rtlflow.get(dut->io_coverage_bytes_103, i);
    coverages[i][104] = *rtlflow.get(dut->io_coverage_bytes_104, i);
    coverages[i][105] = *rtlflow.get(dut->io_coverage_bytes_105, i);
    coverages[i][106] = *rtlflow.get(dut->io_coverage_bytes_106, i);
    coverages[i][107] = *rtlflow.get(dut->io_coverage_bytes_107, i);
    coverages[i][108] = *rtlflow.get(dut->io_coverage_bytes_108, i);
    coverages[i][109] = *rtlflow.get(dut->io_coverage_bytes_109, i);
    coverages[i][110] = *rtlflow.get(dut->io_coverage_bytes_110, i);
    coverages[i][111] = *rtlflow.get(dut->io_coverage_bytes_111, i);
    coverages[i][112] = *rtlflow.get(dut->io_coverage_bytes_112, i);
    coverages[i][113] = *rtlflow.get(dut->io_coverage_bytes_113, i);
    coverages[i][114] = *rtlflow.get(dut->io_coverage_bytes_114, i);
    coverages[i][115] = *rtlflow.get(dut->io_coverage_bytes_115, i);
    coverages[i][116] = *rtlflow.get(dut->io_coverage_bytes_116, i);
    coverages[i][117] = *rtlflow.get(dut->io_coverage_bytes_117, i);
    coverages[i][118] = *rtlflow.get(dut->io_coverage_bytes_118, i);
    coverages[i][119] = *rtlflow.get(dut->io_coverage_bytes_119, i);
    coverages[i][120] = *rtlflow.get(dut->io_coverage_bytes_120, i);
    coverages[i][121] = *rtlflow.get(dut->io_coverage_bytes_121, i);
    coverages[i][122] = *rtlflow.get(dut->io_coverage_bytes_122, i);
    coverages[i][123] = *rtlflow.get(dut->io_coverage_bytes_123, i);
    coverages[i][124] = *rtlflow.get(dut->io_coverage_bytes_124, i);
    coverages[i][125] = *rtlflow.get(dut->io_coverage_bytes_125, i);
    coverages[i][126] = *rtlflow.get(dut->io_coverage_bytes_126, i);
    coverages[i][127] = *rtlflow.get(dut->io_coverage_bytes_127, i);
    coverages[i][128] = *rtlflow.get(dut->io_coverage_bytes_128, i);
    coverages[i][129] = *rtlflow.get(dut->io_coverage_bytes_129, i);
    coverages[i][130] = *rtlflow.get(dut->io_coverage_bytes_130, i);
    coverages[i][131] = *rtlflow.get(dut->io_coverage_bytes_131, i);
    coverages[i][132] = *rtlflow.get(dut->io_coverage_bytes_132, i);
    coverages[i][133] = *rtlflow.get(dut->io_coverage_bytes_133, i);
    coverages[i][134] = *rtlflow.get(dut->io_coverage_bytes_134, i);
    coverages[i][135] = *rtlflow.get(dut->io_coverage_bytes_135, i);
    coverages[i][136] = *rtlflow.get(dut->io_coverage_bytes_136, i);
    coverages[i][137] = *rtlflow.get(dut->io_coverage_bytes_137, i);
    coverages[i][138] = *rtlflow.get(dut->io_coverage_bytes_138, i);
    coverages[i][139] = *rtlflow.get(dut->io_coverage_bytes_139, i);
    coverages[i][140] = *rtlflow.get(dut->io_coverage_bytes_140, i);
    coverages[i][141] = *rtlflow.get(dut->io_coverage_bytes_141, i);
    coverages[i][142] = *rtlflow.get(dut->io_coverage_bytes_142, i);
    coverages[i][143] = *rtlflow.get(dut->io_coverage_bytes_143, i);
    coverages[i][144] = *rtlflow.get(dut->io_coverage_bytes_144, i);
    coverages[i][145] = *rtlflow.get(dut->io_coverage_bytes_145, i);
    coverages[i][146] = *rtlflow.get(dut->io_coverage_bytes_146, i);
    coverages[i][147] = *rtlflow.get(dut->io_coverage_bytes_147, i);
    coverages[i][148] = *rtlflow.get(dut->io_coverage_bytes_148, i);
    coverages[i][149] = *rtlflow.get(dut->io_coverage_bytes_149, i);
    coverages[i][150] = *rtlflow.get(dut->io_coverage_bytes_150, i);
    coverages[i][151] = *rtlflow.get(dut->io_coverage_bytes_151, i);
    coverages[i][152] = *rtlflow.get(dut->io_coverage_bytes_152, i);
    coverages[i][153] = *rtlflow.get(dut->io_coverage_bytes_153, i);
    coverages[i][154] = *rtlflow.get(dut->io_coverage_bytes_154, i);
    coverages[i][155] = *rtlflow.get(dut->io_coverage_bytes_155, i);
    coverages[i][156] = *rtlflow.get(dut->io_coverage_bytes_156, i);
    coverages[i][157] = *rtlflow.get(dut->io_coverage_bytes_157, i);
    coverages[i][158] = *rtlflow.get(dut->io_coverage_bytes_158, i);
    coverages[i][159] = *rtlflow.get(dut->io_coverage_bytes_159, i);
    coverages[i][160] = *rtlflow.get(dut->io_coverage_bytes_160, i);
    coverages[i][161] = *rtlflow.get(dut->io_coverage_bytes_161, i);
    coverages[i][162] = *rtlflow.get(dut->io_coverage_bytes_162, i);
    coverages[i][163] = *rtlflow.get(dut->io_coverage_bytes_163, i);
    coverages[i][164] = *rtlflow.get(dut->io_coverage_bytes_164, i);
    coverages[i][165] = *rtlflow.get(dut->io_coverage_bytes_165, i);
    coverages[i][166] = *rtlflow.get(dut->io_coverage_bytes_166, i);
    coverages[i][167] = *rtlflow.get(dut->io_coverage_bytes_167, i);
    coverages[i][168] = *rtlflow.get(dut->io_coverage_bytes_168, i);
    coverages[i][169] = *rtlflow.get(dut->io_coverage_bytes_169, i);
    coverages[i][170] = *rtlflow.get(dut->io_coverage_bytes_170, i);
    coverages[i][171] = *rtlflow.get(dut->io_coverage_bytes_171, i);
    coverages[i][172] = *rtlflow.get(dut->io_coverage_bytes_172, i);
    coverages[i][173] = *rtlflow.get(dut->io_coverage_bytes_173, i);
    coverages[i][174] = *rtlflow.get(dut->io_coverage_bytes_174, i);
    coverages[i][175] = *rtlflow.get(dut->io_coverage_bytes_175, i);
    coverages[i][176] = *rtlflow.get(dut->io_coverage_bytes_176, i);
    coverages[i][177] = *rtlflow.get(dut->io_coverage_bytes_177, i);
    coverages[i][178] = *rtlflow.get(dut->io_coverage_bytes_178, i);
    coverages[i][179] = *rtlflow.get(dut->io_coverage_bytes_179, i);
    coverages[i][180] = *rtlflow.get(dut->io_coverage_bytes_180, i);
    coverages[i][181] = *rtlflow.get(dut->io_coverage_bytes_181, i);
    coverages[i][182] = *rtlflow.get(dut->io_coverage_bytes_182, i);
    coverages[i][183] = *rtlflow.get(dut->io_coverage_bytes_183, i);
    coverages[i][184] = *rtlflow.get(dut->io_coverage_bytes_184, i);
    coverages[i][185] = *rtlflow.get(dut->io_coverage_bytes_185, i);
    coverages[i][186] = *rtlflow.get(dut->io_coverage_bytes_186, i);
    coverages[i][187] = *rtlflow.get(dut->io_coverage_bytes_187, i);
    coverages[i][188] = *rtlflow.get(dut->io_coverage_bytes_188, i);
    coverages[i][189] = *rtlflow.get(dut->io_coverage_bytes_189, i);
  }
}

