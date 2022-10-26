
#include <genfuzz/genfuzz.hpp>


int main() {

  gf::COVERAGE_TYPE = gf::CoverageType::REG;

  gf::GenFuzz gf(256, "./out", "RocketTile", "/usr/bin/python3", "../../cov_metrics/reg/RocketTile_256_build/Top", "/home/luan/Gen-Fuzz/cov_metrics/reg/ISASim/riscv-isa-sim/build/spike");
  //gf::GenFuzz gf(256, "./out", "SmallBoomTile_1", "/usr/bin/python3", "../../cov_metrics/reg/SmallBoomTile_1_256_build/Top", "/home/luan/Gen-Fuzz/cov_metrics/reg/ISASim/riscv-isa-sim/build/spike");
  //
  //gf::GenFuzz gf(1024, "./out", "../../cov_metrics/mux/Sodor3Stage_1024_build/Top");
  //gf::GenFuzz gf(256, "./out", "../../cov_metrics/mux/Sodor3Stage_256_build/Top");
  //gf::GenFuzz gf(32, "./out", "../../cov_metrics/mux/Sodor5Stage_32_build/Top");
  //gf::GenFuzz gf(256, "./out", "../../cov_metrics/mux/RocketTile_256_build/Top");
  //gf::GenFuzz gf(256, "./out", "../../cov_metrics/mux/TLI2C_256_build/Top");
  gf.run_n(1000);

  //gf::GenFuzz gf(gf::REG_COVERAGE);
  //gf.set_muxcov_env();
  //gf.set_regcov_env();
  
}
