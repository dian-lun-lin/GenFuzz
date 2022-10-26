module TLSPI( // @[:TLSPI.fir@2.2]
  input          metaReset,
  input          clock, // @[:TLSPI.fir@3.4]
  input          reset, // @[:TLSPI.fir@4.4]
  output         auto_int_out_0, // @[:TLSPI.fir@5.4]
  output         auto_r_in_a_ready, // @[:TLSPI.fir@5.4]
  input          auto_r_in_a_valid, // @[:TLSPI.fir@5.4]
  input  [2:0]   auto_r_in_a_bits_opcode, // @[:TLSPI.fir@5.4]
  input  [2:0]   auto_r_in_a_bits_param, // @[:TLSPI.fir@5.4]
  input  [1:0]   auto_r_in_a_bits_size, // @[:TLSPI.fir@5.4]
  input  [6:0]   auto_r_in_a_bits_source, // @[:TLSPI.fir@5.4]
  input  [28:0]  auto_r_in_a_bits_address, // @[:TLSPI.fir@5.4]
  input  [3:0]   auto_r_in_a_bits_mask, // @[:TLSPI.fir@5.4]
  input  [31:0]  auto_r_in_a_bits_data, // @[:TLSPI.fir@5.4]
  input          auto_r_in_b_ready, // @[:TLSPI.fir@5.4]
  output         auto_r_in_b_valid, // @[:TLSPI.fir@5.4]
  output [2:0]   auto_r_in_b_bits_opcode, // @[:TLSPI.fir@5.4]
  output [1:0]   auto_r_in_b_bits_param, // @[:TLSPI.fir@5.4]
  output [1:0]   auto_r_in_b_bits_size, // @[:TLSPI.fir@5.4]
  output [6:0]   auto_r_in_b_bits_source, // @[:TLSPI.fir@5.4]
  output [28:0]  auto_r_in_b_bits_address, // @[:TLSPI.fir@5.4]
  output [3:0]   auto_r_in_b_bits_mask, // @[:TLSPI.fir@5.4]
  output [31:0]  auto_r_in_b_bits_data, // @[:TLSPI.fir@5.4]
  output         auto_r_in_c_ready, // @[:TLSPI.fir@5.4]
  input          auto_r_in_c_valid, // @[:TLSPI.fir@5.4]
  input  [2:0]   auto_r_in_c_bits_opcode, // @[:TLSPI.fir@5.4]
  input  [2:0]   auto_r_in_c_bits_param, // @[:TLSPI.fir@5.4]
  input  [1:0]   auto_r_in_c_bits_size, // @[:TLSPI.fir@5.4]
  input  [6:0]   auto_r_in_c_bits_source, // @[:TLSPI.fir@5.4]
  input  [28:0]  auto_r_in_c_bits_address, // @[:TLSPI.fir@5.4]
  input  [31:0]  auto_r_in_c_bits_data, // @[:TLSPI.fir@5.4]
  input          auto_r_in_c_bits_error, // @[:TLSPI.fir@5.4]
  input          auto_r_in_d_ready, // @[:TLSPI.fir@5.4]
  output         auto_r_in_d_valid, // @[:TLSPI.fir@5.4]
  output [2:0]   auto_r_in_d_bits_opcode, // @[:TLSPI.fir@5.4]
  output [1:0]   auto_r_in_d_bits_param, // @[:TLSPI.fir@5.4]
  output [1:0]   auto_r_in_d_bits_size, // @[:TLSPI.fir@5.4]
  output [6:0]   auto_r_in_d_bits_source, // @[:TLSPI.fir@5.4]
  output         auto_r_in_d_bits_sink, // @[:TLSPI.fir@5.4]
  output [31:0]  auto_r_in_d_bits_data, // @[:TLSPI.fir@5.4]
  output         auto_r_in_d_bits_error, // @[:TLSPI.fir@5.4]
  output         auto_r_in_e_ready, // @[:TLSPI.fir@5.4]
  input          auto_r_in_e_valid, // @[:TLSPI.fir@5.4]
  input          auto_r_in_e_bits_sink, // @[:TLSPI.fir@5.4]
  output         io_port_sck, // @[:TLSPI.fir@6.4]
  input          io_port_dq_0_i, // @[:TLSPI.fir@6.4]
  output         io_port_dq_0_o, // @[:TLSPI.fir@6.4]
  output         io_port_dq_0_oe, // @[:TLSPI.fir@6.4]
  input          io_port_dq_1_i, // @[:TLSPI.fir@6.4]
  output         io_port_dq_1_o, // @[:TLSPI.fir@6.4]
  output         io_port_dq_1_oe, // @[:TLSPI.fir@6.4]
  input          io_port_dq_2_i, // @[:TLSPI.fir@6.4]
  output         io_port_dq_2_o, // @[:TLSPI.fir@6.4]
  output         io_port_dq_2_oe, // @[:TLSPI.fir@6.4]
  input          io_port_dq_3_i, // @[:TLSPI.fir@6.4]
  output         io_port_dq_3_o, // @[:TLSPI.fir@6.4]
  output         io_port_dq_3_oe, // @[:TLSPI.fir@6.4]
  output         io_port_cs_0, // @[:TLSPI.fir@6.4]
  output         io_port_cs_1, // @[:TLSPI.fir@6.4]
  output         io_port_cs_2, // @[:TLSPI.fir@6.4]
  output         io_port_cs_3, // @[:TLSPI.fir@6.4]
  output [83:0]  assert_out,
  output [322:0] auto_cover_out
);
  wire  TLMonitor_metaReset; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_clock; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_reset; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_io_in_a_ready; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_io_in_a_valid; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [2:0] TLMonitor_io_in_a_bits_opcode; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [2:0] TLMonitor_io_in_a_bits_param; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [1:0] TLMonitor_io_in_a_bits_size; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [6:0] TLMonitor_io_in_a_bits_source; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [28:0] TLMonitor_io_in_a_bits_address; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [3:0] TLMonitor_io_in_a_bits_mask; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_io_in_c_valid; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_io_in_d_ready; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_io_in_d_valid; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [2:0] TLMonitor_io_in_d_bits_opcode; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [1:0] TLMonitor_io_in_d_bits_size; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire [6:0] TLMonitor_io_in_d_bits_source; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor_io_in_e_valid; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_118_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_10_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_43_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_37_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_109_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_21_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_3_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_17_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_96_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_112_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_24_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_115_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_7_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_73_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_121_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_80_2; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_59_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_108_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_53_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_46_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_70_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_77_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_39_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_29_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_56_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_26_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_5_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_33_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_63_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_114_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_9_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_20_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_36_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_42_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_2_3; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_117_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_111_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_75_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_23_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_12_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_79_2; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_89_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_58_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_65_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_35_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_69_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_62_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_22_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_51_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_11_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_38_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_45_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_113_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_4_2; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_32_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_25_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_48_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_8_3; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_122_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_28_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_1_2; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_19_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_74_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_85_3; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_110_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_67_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_71_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_54_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_47_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_81_2; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_40_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_27_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_64_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_57_1; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  wire  TLMonitor__GEN_50_0; // @[Nodes.scala 25:25:TLSPI.fir@14.4]
  reg [1:0] ctrl_fmt_proto; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_0;
  reg  ctrl_fmt_endian; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_1;
  reg  ctrl_fmt_iodir; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_2;
  reg [3:0] ctrl_fmt_len; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_3;
  reg [11:0] ctrl_sck_div; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_4;
  reg  ctrl_sck_pol; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_5;
  reg  ctrl_sck_pha; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_6;
  reg [1:0] ctrl_cs_id; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_7;
  reg  ctrl_cs_dflt_0; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_8;
  reg  ctrl_cs_dflt_1; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_9;
  reg  ctrl_cs_dflt_2; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_10;
  reg  ctrl_cs_dflt_3; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_11;
  reg [1:0] ctrl_cs_mode; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_12;
  reg [7:0] ctrl_dla_cssck; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_13;
  reg [7:0] ctrl_dla_sckcs; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_14;
  reg [7:0] ctrl_dla_intercs; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_15;
  reg [7:0] ctrl_dla_interxfr; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_16;
  reg [3:0] ctrl_wm_tx; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_17;
  reg [3:0] ctrl_wm_rx; // @[TLSPI.scala 58:17:TLSPI.fir@76.4]
  reg [31:0] _RAND_18;
  wire  fifo_metaReset; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_clock; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_reset; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [1:0] fifo_io_ctrl_fmt_proto; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_ctrl_fmt_endian; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_ctrl_fmt_iodir; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [3:0] fifo_io_ctrl_fmt_len; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [1:0] fifo_io_ctrl_cs_mode; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [3:0] fifo_io_ctrl_wm_tx; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [3:0] fifo_io_ctrl_wm_rx; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_tx_ready; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_tx_valid; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [7:0] fifo_io_link_tx_bits; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_rx_valid; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [7:0] fifo_io_link_rx_bits; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [7:0] fifo_io_link_cnt; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [1:0] fifo_io_link_fmt_proto; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_fmt_endian; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_fmt_iodir; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_cs_set; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_link_cs_clear; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_tx_ready; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_tx_valid; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [7:0] fifo_io_tx_bits; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_rx_ready; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_rx_valid; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire [7:0] fifo_io_rx_bits; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_ip_txwm; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo_io_ip_rxwm; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_2_0; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_2_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_8_0; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_5_0; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_2_2; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_8_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_8_2; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_10_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_7_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_7_2; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_7_3; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_1_0; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_4_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_1_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_9_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_3_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_3_2; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_6_0; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_0_0; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_0_1; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  fifo__GEN_3_3; // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
  wire  mac_metaReset; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_clock; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_reset; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_sck; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_0_i; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_0_o; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_0_oe; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_1_i; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_1_o; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_1_oe; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_2_i; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_2_o; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_2_oe; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_3_i; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_3_o; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_dq_3_oe; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_cs_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_cs_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_cs_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_port_cs_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [11:0] mac_io_ctrl_sck_div; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_ctrl_sck_pol; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_ctrl_sck_pha; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_ctrl_dla_cssck; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_ctrl_dla_sckcs; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_ctrl_dla_intercs; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_ctrl_dla_interxfr; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [1:0] mac_io_ctrl_cs_id; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_ctrl_cs_dflt_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_ctrl_cs_dflt_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_ctrl_cs_dflt_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_ctrl_cs_dflt_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_tx_ready; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_tx_valid; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_link_tx_bits; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_rx_valid; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_link_rx_bits; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [7:0] mac_io_link_cnt; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire [1:0] mac_io_link_fmt_proto; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_fmt_endian; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_fmt_iodir; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_cs_set; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac_io_link_cs_clear; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_14_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_95_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_80_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_80_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_73_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_74_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_58_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_68_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_66_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_4_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_61_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_130_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_140; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_130_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_124_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_39_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_124_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_77_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_112_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_106_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_133_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_118_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_127_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_133_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_127_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_143; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_112_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_106_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_88_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_94_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_79_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_121_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_100_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_79_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_136_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_115_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_100_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_121_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_136_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_94_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_115_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_103_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_97_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_88_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_82_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_97_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_109_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_60_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_82_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_109_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_118_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_76_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_76_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_103_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_91_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_142_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_69_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_70_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_91_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_85_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_85_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_57_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_61_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_63_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_72_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_73_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_67_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_135_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_65_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_135_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_11_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_129_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_108_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_117_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_117_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_139_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_123_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_129_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_138_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_21_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_123_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_105_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_126_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_111_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_111_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_126_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_105_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_132_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_132_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_90_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_90_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_71_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_108_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_99_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_99_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_93_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_87_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_120_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_114_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_78_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_72_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_87_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_93_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_120_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_114_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_102_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_75_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_75_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_102_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_96_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_59_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_96_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_81_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_20_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_81_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_68_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_131_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_78_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_141_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_84_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_69_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_84_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_43_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_62_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_55_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_134_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_144_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_10_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_66_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_119_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_119_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_128_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_134_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_113_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_64_0; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_137_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_101_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_122_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_122_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_116_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_116_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_128_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_137_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_101_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_95_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_89_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_83_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_104_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_77_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_104_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_125_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_83_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_131_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_89_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_110_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_98_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_110_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_125_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_107_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_113_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_65_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_92_1; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_70_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_86_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_86_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_92_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_71_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_63_2; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_98_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  wire  mac__GEN_107_3; // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
  reg  ie_txwm; // @[TLSPI.scala 71:15:TLSPI.fir@101.4]
  reg [31:0] _RAND_19;
  reg  ie_rxwm; // @[TLSPI.scala 71:15:TLSPI.fir@101.4]
  reg [31:0] _RAND_20;
  wire  profilePin_132;
  wire [1:0] _GEN_339; // @[:TLSPI.fir@2.2]
  wire  profilePin_133;
  wire [2:0] _GEN_340; // @[:TLSPI.fir@2.2]
  wire [3:0] _GEN_341; // @[:TLSPI.fir@2.2]
  wire  profilePin_135;
  wire [4:0] _GEN_342; // @[:TLSPI.fir@2.2]
  wire  profilePin_136;
  wire [5:0] _GEN_343; // @[:TLSPI.fir@2.2]
  wire  profilePin_137;
  wire [6:0] _GEN_344; // @[:TLSPI.fir@2.2]
  wire  profilePin_138;
  wire [7:0] _GEN_345; // @[:TLSPI.fir@2.2]
  wire  profilePin_139;
  wire [8:0] _GEN_346; // @[:TLSPI.fir@2.2]
  wire  profilePin_140;
  wire [9:0] _GEN_347; // @[:TLSPI.fir@2.2]
  wire [10:0] _GEN_348; // @[:TLSPI.fir@2.2]
  wire  profilePin_142;
  wire [11:0] _GEN_349; // @[:TLSPI.fir@2.2]
  wire  profilePin_143;
  wire [12:0] _GEN_350; // @[:TLSPI.fir@2.2]
  wire  profilePin_144;
  wire [13:0] _GEN_351; // @[:TLSPI.fir@2.2]
  wire  profilePin_145;
  wire [14:0] _GEN_352; // @[:TLSPI.fir@2.2]
  wire  profilePin_146;
  wire [15:0] _GEN_353; // @[:TLSPI.fir@2.2]
  wire  profilePin_147;
  wire [16:0] _GEN_354; // @[:TLSPI.fir@2.2]
  wire [17:0] _GEN_355; // @[:TLSPI.fir@2.2]
  wire  profilePin_149;
  wire [18:0] _GEN_356; // @[:TLSPI.fir@2.2]
  wire  profilePin_150;
  wire [19:0] _GEN_357; // @[:TLSPI.fir@2.2]
  wire  profilePin_151;
  wire [20:0] _GEN_358; // @[:TLSPI.fir@2.2]
  wire  profilePin_152;
  wire [21:0] _GEN_359; // @[:TLSPI.fir@2.2]
  wire [22:0] _GEN_360; // @[:TLSPI.fir@2.2]
  wire  profilePin_154;
  wire [23:0] _GEN_361; // @[:TLSPI.fir@2.2]
  wire  profilePin_155;
  wire [24:0] _GEN_362; // @[:TLSPI.fir@2.2]
  wire  profilePin_156;
  wire [25:0] _GEN_363; // @[:TLSPI.fir@2.2]
  wire  profilePin_157;
  wire [26:0] _GEN_364; // @[:TLSPI.fir@2.2]
  wire [27:0] _GEN_365; // @[:TLSPI.fir@2.2]
  wire  profilePin_159;
  wire [28:0] _GEN_366; // @[:TLSPI.fir@2.2]
  wire  profilePin_160;
  wire [29:0] _GEN_367; // @[:TLSPI.fir@2.2]
  wire  profilePin_161;
  wire [30:0] _GEN_368; // @[:TLSPI.fir@2.2]
  wire  profilePin_162;
  wire [31:0] _GEN_369; // @[:TLSPI.fir@2.2]
  wire [32:0] _GEN_370; // @[:TLSPI.fir@2.2]
  wire  profilePin_164;
  wire [33:0] _GEN_371; // @[:TLSPI.fir@2.2]
  wire  profilePin_165;
  wire [34:0] _GEN_372; // @[:TLSPI.fir@2.2]
  wire  profilePin_166;
  wire [35:0] _GEN_373; // @[:TLSPI.fir@2.2]
  wire  profilePin_167;
  wire [36:0] _GEN_374; // @[:TLSPI.fir@2.2]
  wire [37:0] _GEN_375; // @[:TLSPI.fir@2.2]
  wire  profilePin_169;
  wire [38:0] _GEN_376; // @[:TLSPI.fir@2.2]
  wire  profilePin_170;
  wire [39:0] _GEN_377; // @[:TLSPI.fir@2.2]
  wire  profilePin_171;
  wire [40:0] _GEN_378; // @[:TLSPI.fir@2.2]
  wire  profilePin_172;
  wire [41:0] _GEN_379; // @[:TLSPI.fir@2.2]
  wire [42:0] _GEN_380; // @[:TLSPI.fir@2.2]
  wire  profilePin_174;
  wire [43:0] _GEN_381; // @[:TLSPI.fir@2.2]
  wire  profilePin_175;
  wire [44:0] _GEN_382; // @[:TLSPI.fir@2.2]
  wire  profilePin_176;
  wire [45:0] _GEN_383; // @[:TLSPI.fir@2.2]
  wire [46:0] _GEN_384; // @[:TLSPI.fir@2.2]
  wire [47:0] _GEN_385; // @[:TLSPI.fir@2.2]
  wire  profilePin_179;
  wire [48:0] _GEN_386; // @[:TLSPI.fir@2.2]
  wire [49:0] _GEN_387; // @[:TLSPI.fir@2.2]
  wire [50:0] _GEN_388; // @[:TLSPI.fir@2.2]
  wire [51:0] _GEN_389; // @[:TLSPI.fir@2.2]
  wire  profilePin_183;
  wire [52:0] _GEN_390; // @[:TLSPI.fir@2.2]
  wire [53:0] _GEN_391; // @[:TLSPI.fir@2.2]
  wire [54:0] _GEN_392; // @[:TLSPI.fir@2.2]
  wire [55:0] _GEN_393; // @[:TLSPI.fir@2.2]
  wire  profilePin_187;
  wire [56:0] _GEN_394; // @[:TLSPI.fir@2.2]
  wire [57:0] _GEN_395; // @[:TLSPI.fir@2.2]
  wire [58:0] _GEN_396; // @[:TLSPI.fir@2.2]
  wire [59:0] _GEN_397; // @[:TLSPI.fir@2.2]
  wire [60:0] _GEN_398; // @[:TLSPI.fir@2.2]
  wire [61:0] _GEN_399; // @[:TLSPI.fir@2.2]
  wire [62:0] _GEN_400; // @[:TLSPI.fir@2.2]
  wire [63:0] _GEN_401; // @[:TLSPI.fir@2.2]
  wire [64:0] _GEN_402; // @[:TLSPI.fir@2.2]
  wire [65:0] _GEN_403; // @[:TLSPI.fir@2.2]
  wire [66:0] _GEN_404; // @[:TLSPI.fir@2.2]
  wire [67:0] _GEN_405; // @[:TLSPI.fir@2.2]
  wire  profilePin_199;
  wire [68:0] _GEN_406; // @[:TLSPI.fir@2.2]
  wire  profilePin_200;
  wire [69:0] _GEN_407; // @[:TLSPI.fir@2.2]
  wire  profilePin_201;
  wire [70:0] _GEN_408; // @[:TLSPI.fir@2.2]
  wire  profilePin_202;
  wire [71:0] _GEN_409; // @[:TLSPI.fir@2.2]
  wire  profilePin_203;
  wire [72:0] _GEN_410; // @[:TLSPI.fir@2.2]
  wire  profilePin_204;
  wire [73:0] _GEN_411; // @[:TLSPI.fir@2.2]
  wire  profilePin_205;
  wire [74:0] _GEN_412; // @[:TLSPI.fir@2.2]
  wire  profilePin_206;
  wire [75:0] _GEN_413; // @[:TLSPI.fir@2.2]
  wire [76:0] _GEN_414; // @[:TLSPI.fir@2.2]
  wire  profilePin_208;
  wire [77:0] _GEN_415; // @[:TLSPI.fir@2.2]
  wire  profilePin_209;
  wire [78:0] _GEN_416; // @[:TLSPI.fir@2.2]
  wire [79:0] _GEN_417; // @[:TLSPI.fir@2.2]
  wire [80:0] _GEN_418; // @[:TLSPI.fir@2.2]
  wire  profilePin_212;
  wire [81:0] _GEN_419; // @[:TLSPI.fir@2.2]
  wire  profilePin_213;
  wire [82:0] _GEN_420; // @[:TLSPI.fir@2.2]
  wire  profilePin; // @[Bitwise.scala 27:51:TLSPI.fir@219.4]
  wire  profilePin_0; // @[Bitwise.scala 27:51:TLSPI.fir@220.4]
  wire [1:0] _GEN_746; // @[:TLSPI.fir@2.2]
  wire  profilePin_1; // @[Bitwise.scala 27:51:TLSPI.fir@221.4]
  wire [2:0] _GEN_747; // @[:TLSPI.fir@2.2]
  wire  profilePin_2; // @[Bitwise.scala 27:51:TLSPI.fir@222.4]
  wire [3:0] _GEN_748; // @[:TLSPI.fir@2.2]
  wire  _T_2085; // @[RegisterRouter.scala 62:24:TLSPI.fir@1197.4]
  wire  _T_281; // @[RegisterRouter.scala 55:36:TLSPI.fir@113.4]
  wire  _T_2382; // @[RegisterRouter.scala 62:24:TLSPI.fir@1487.4]
  wire  _T_2383; // @[RegisterRouter.scala 62:24:TLSPI.fir@1488.4]
  wire [26:0] _T_282; // @[Edges.scala 183:34:TLSPI.fir@115.4]
  wire [9:0] _T_277_bits_index; // @[RegisterRouter.scala 54:18:TLSPI.fir@111.4]
  wire  _T_2007; // @[RegisterRouter.scala 62:24:TLSPI.fir@1121.4]
  wire  _T_2006; // @[RegisterRouter.scala 62:24:TLSPI.fir@1120.4]
  wire [1:0] _T_2014; // @[Cat.scala 30:58:TLSPI.fir@1128.4]
  wire  _T_2005; // @[RegisterRouter.scala 62:24:TLSPI.fir@1119.4]
  wire [2:0] _T_2015; // @[Cat.scala 30:58:TLSPI.fir@1129.4]
  wire  _T_2004; // @[RegisterRouter.scala 62:24:TLSPI.fir@1118.4]
  wire  _T_2003; // @[RegisterRouter.scala 62:24:TLSPI.fir@1117.4]
  wire [1:0] _T_2013; // @[Cat.scala 30:58:TLSPI.fir@1127.4]
  wire [4:0] _T_2016; // @[Cat.scala 30:58:TLSPI.fir@1130.4]
  wire [31:0] _T_2018; // @[OneHot.scala 45:35:TLSPI.fir@1131.4]
  wire  _T_2019; // @[RegisterRouter.scala 62:24:TLSPI.fir@1132.4]
  wire  _T_2386; // @[RegisterRouter.scala 62:24:TLSPI.fir@1491.4]
  wire [9:0] _T_366; // @[RegisterRouter.scala 62:24:TLSPI.fir@128.4]
  wire  _T_368; // @[RegisterRouter.scala 62:24:TLSPI.fir@129.4]
  wire  _T_2387; // @[RegisterRouter.scala 62:24:TLSPI.fir@1492.4]
  wire [7:0] _T_681; // @[Bitwise.scala 72:12:TLSPI.fir@230.4]
  wire [7:0] _T_677; // @[Bitwise.scala 72:12:TLSPI.fir@228.4]
  wire [15:0] _T_683; // @[Cat.scala 30:58:TLSPI.fir@232.4]
  wire [7:0] _T_673; // @[Bitwise.scala 72:12:TLSPI.fir@226.4]
  wire [7:0] _T_669; // @[Bitwise.scala 72:12:TLSPI.fir@224.4]
  wire [15:0] _T_682; // @[Cat.scala 30:58:TLSPI.fir@231.4]
  wire [31:0] _T_684; // @[Cat.scala 30:58:TLSPI.fir@233.4]
  wire [11:0] _T_708; // @[RegisterRouter.scala 62:24:TLSPI.fir@249.4]
  wire [11:0] _T_712; // @[RegisterRouter.scala 62:24:TLSPI.fir@252.4]
  wire  _T_714; // @[RegisterRouter.scala 62:24:TLSPI.fir@253.4]
  wire  profilePin_3; // @[RegisterRouter.scala 62:24:TLSPI.fir@261.4]
  wire [4:0] _GEN_749; // @[:TLSPI.fir@2.2]
  wire  _T_2024; // @[RegisterRouter.scala 62:24:TLSPI.fir@1137.4]
  wire  _T_2426; // @[RegisterRouter.scala 62:24:TLSPI.fir@1530.4]
  wire [9:0] _T_374; // @[RegisterRouter.scala 62:24:TLSPI.fir@133.4]
  wire [9:0] _T_375; // @[RegisterRouter.scala 62:24:TLSPI.fir@134.4]
  wire  _T_377; // @[RegisterRouter.scala 62:24:TLSPI.fir@135.4]
  wire  _T_2427; // @[RegisterRouter.scala 62:24:TLSPI.fir@1531.4]
  wire  _T_752; // @[RegisterRouter.scala 62:24:TLSPI.fir@279.4]
  wire  _T_756; // @[RegisterRouter.scala 62:24:TLSPI.fir@282.4]
  wire  _T_758; // @[RegisterRouter.scala 62:24:TLSPI.fir@283.4]
  wire  profilePin_4; // @[RegisterRouter.scala 62:24:TLSPI.fir@291.4]
  wire [5:0] _GEN_750; // @[:TLSPI.fir@2.2]
  wire  _T_796; // @[RegisterRouter.scala 62:24:TLSPI.fir@309.4]
  wire  _T_800; // @[RegisterRouter.scala 62:24:TLSPI.fir@312.4]
  wire  _T_802; // @[RegisterRouter.scala 62:24:TLSPI.fir@313.4]
  wire  profilePin_5; // @[RegisterRouter.scala 62:24:TLSPI.fir@321.4]
  wire [6:0] _GEN_751; // @[:TLSPI.fir@2.2]
  wire  _T_840; // @[RegisterRouter.scala 62:24:TLSPI.fir@339.4]
  wire  _T_844; // @[RegisterRouter.scala 62:24:TLSPI.fir@342.4]
  wire  _T_846; // @[RegisterRouter.scala 62:24:TLSPI.fir@343.4]
  wire  profilePin_6; // @[RegisterRouter.scala 62:24:TLSPI.fir@351.4]
  wire [7:0] _GEN_752; // @[:TLSPI.fir@2.2]
  wire  _T_884; // @[RegisterRouter.scala 62:24:TLSPI.fir@369.4]
  wire  _T_888; // @[RegisterRouter.scala 62:24:TLSPI.fir@372.4]
  wire  _T_890; // @[RegisterRouter.scala 62:24:TLSPI.fir@373.4]
  wire  profilePin_7; // @[RegisterRouter.scala 62:24:TLSPI.fir@381.4]
  wire [8:0] _GEN_753; // @[:TLSPI.fir@2.2]
  wire  _T_2029; // @[RegisterRouter.scala 62:24:TLSPI.fir@1142.4]
  wire  _T_2466; // @[RegisterRouter.scala 62:24:TLSPI.fir@1570.4]
  wire [9:0] _T_383; // @[RegisterRouter.scala 62:24:TLSPI.fir@139.4]
  wire [9:0] _T_384; // @[RegisterRouter.scala 62:24:TLSPI.fir@140.4]
  wire  _T_386; // @[RegisterRouter.scala 62:24:TLSPI.fir@141.4]
  wire  _T_2467; // @[RegisterRouter.scala 62:24:TLSPI.fir@1571.4]
  wire [7:0] _T_928; // @[RegisterRouter.scala 62:24:TLSPI.fir@399.4]
  wire [7:0] _T_932; // @[RegisterRouter.scala 62:24:TLSPI.fir@402.4]
  wire  _T_934; // @[RegisterRouter.scala 62:24:TLSPI.fir@403.4]
  wire  profilePin_8; // @[RegisterRouter.scala 62:24:TLSPI.fir@411.4]
  wire [9:0] _GEN_754; // @[:TLSPI.fir@2.2]
  wire [7:0] _T_972; // @[RegisterRouter.scala 62:24:TLSPI.fir@429.4]
  wire [7:0] _T_976; // @[RegisterRouter.scala 62:24:TLSPI.fir@432.4]
  wire  _T_978; // @[RegisterRouter.scala 62:24:TLSPI.fir@433.4]
  wire  profilePin_9; // @[RegisterRouter.scala 62:24:TLSPI.fir@441.4]
  wire [10:0] _GEN_755; // @[:TLSPI.fir@2.2]
  wire  _T_2039; // @[RegisterRouter.scala 62:24:TLSPI.fir@1152.4]
  wire  _T_2546; // @[RegisterRouter.scala 62:24:TLSPI.fir@1654.4]
  wire [9:0] _T_392; // @[RegisterRouter.scala 62:24:TLSPI.fir@145.4]
  wire [9:0] _T_393; // @[RegisterRouter.scala 62:24:TLSPI.fir@146.4]
  wire  _T_395; // @[RegisterRouter.scala 62:24:TLSPI.fir@147.4]
  wire  _T_2547; // @[RegisterRouter.scala 62:24:TLSPI.fir@1655.4]
  wire [3:0] _T_1016; // @[RegisterRouter.scala 62:24:TLSPI.fir@459.4]
  wire [3:0] _T_1020; // @[RegisterRouter.scala 62:24:TLSPI.fir@462.4]
  wire  _T_1022; // @[RegisterRouter.scala 62:24:TLSPI.fir@463.4]
  wire  profilePin_10; // @[RegisterRouter.scala 62:24:TLSPI.fir@471.4]
  wire [11:0] _GEN_756; // @[:TLSPI.fir@2.2]
  wire  _T_2020; // @[RegisterRouter.scala 62:24:TLSPI.fir@1133.4]
  wire  _T_2394; // @[RegisterRouter.scala 62:24:TLSPI.fir@1499.4]
  wire [9:0] _T_410; // @[RegisterRouter.scala 62:24:TLSPI.fir@157.4]
  wire [9:0] _T_411; // @[RegisterRouter.scala 62:24:TLSPI.fir@158.4]
  wire  _T_413; // @[RegisterRouter.scala 62:24:TLSPI.fir@159.4]
  wire  _T_2395; // @[RegisterRouter.scala 62:24:TLSPI.fir@1500.4]
  wire  profilePin_11; // @[RegisterRouter.scala 62:24:TLSPI.fir@555.4]
  wire [12:0] _GEN_757; // @[:TLSPI.fir@2.2]
  wire  profilePin_12; // @[RegisterRouter.scala 62:24:TLSPI.fir@585.4]
  wire [13:0] _GEN_758; // @[:TLSPI.fir@2.2]
  wire  _T_2025; // @[RegisterRouter.scala 62:24:TLSPI.fir@1138.4]
  wire  _T_2434; // @[RegisterRouter.scala 62:24:TLSPI.fir@1541.4]
  wire [9:0] _T_419; // @[RegisterRouter.scala 62:24:TLSPI.fir@163.4]
  wire [9:0] _T_420; // @[RegisterRouter.scala 62:24:TLSPI.fir@164.4]
  wire  _T_422; // @[RegisterRouter.scala 62:24:TLSPI.fir@165.4]
  wire  _T_2435; // @[RegisterRouter.scala 62:24:TLSPI.fir@1542.4]
  wire [1:0] _T_1236; // @[RegisterRouter.scala 62:24:TLSPI.fir@603.4]
  wire [1:0] _T_1240; // @[RegisterRouter.scala 62:24:TLSPI.fir@606.4]
  wire  _T_1242; // @[RegisterRouter.scala 62:24:TLSPI.fir@607.4]
  wire  profilePin_13; // @[RegisterRouter.scala 62:24:TLSPI.fir@615.4]
  wire [14:0] _GEN_759; // @[:TLSPI.fir@2.2]
  wire  _T_2047; // @[RegisterRouter.scala 62:24:TLSPI.fir@1160.4]
  wire  _T_2610; // @[RegisterRouter.scala 62:24:TLSPI.fir@1712.4]
  wire [9:0] _T_428; // @[RegisterRouter.scala 62:24:TLSPI.fir@169.4]
  wire [9:0] _T_429; // @[RegisterRouter.scala 62:24:TLSPI.fir@170.4]
  wire  _T_431; // @[RegisterRouter.scala 62:24:TLSPI.fir@171.4]
  wire  _T_2611; // @[RegisterRouter.scala 62:24:TLSPI.fir@1713.4]
  wire  profilePin_14; // @[RegisterRouter.scala 62:24:TLSPI.fir@645.4]
  wire [15:0] _GEN_760; // @[:TLSPI.fir@2.2]
  wire  profilePin_15; // @[RegisterRouter.scala 62:24:TLSPI.fir@675.4]
  wire [16:0] _GEN_761; // @[:TLSPI.fir@2.2]
  wire  _T_2040; // @[RegisterRouter.scala 62:24:TLSPI.fir@1153.4]
  wire  _T_2554; // @[RegisterRouter.scala 62:24:TLSPI.fir@1662.4]
  wire [9:0] _T_437; // @[RegisterRouter.scala 62:24:TLSPI.fir@175.4]
  wire [9:0] _T_438; // @[RegisterRouter.scala 62:24:TLSPI.fir@176.4]
  wire  _T_440; // @[RegisterRouter.scala 62:24:TLSPI.fir@177.4]
  wire  _T_2555; // @[RegisterRouter.scala 62:24:TLSPI.fir@1663.4]
  wire  profilePin_16; // @[RegisterRouter.scala 62:24:TLSPI.fir@705.4]
  wire [17:0] _GEN_762; // @[:TLSPI.fir@2.2]
  wire  _T_2035; // @[RegisterRouter.scala 62:24:TLSPI.fir@1148.4]
  wire  _T_2514; // @[RegisterRouter.scala 62:24:TLSPI.fir@1616.4]
  wire [9:0] _T_455; // @[RegisterRouter.scala 62:24:TLSPI.fir@187.4]
  wire [9:0] _T_456; // @[RegisterRouter.scala 62:24:TLSPI.fir@188.4]
  wire  _T_458; // @[RegisterRouter.scala 62:24:TLSPI.fir@189.4]
  wire  _T_2515; // @[RegisterRouter.scala 62:24:TLSPI.fir@1617.4]
  wire  profilePin_17; // @[RegisterRouter.scala 62:24:TLSPI.fir@823.4]
  wire [18:0] _GEN_763; // @[:TLSPI.fir@2.2]
  wire  profilePin_18; // @[RegisterRouter.scala 62:24:TLSPI.fir@853.4]
  wire [19:0] _GEN_764; // @[:TLSPI.fir@2.2]
  wire  profilePin_19; // @[RegisterRouter.scala 62:24:TLSPI.fir@883.4]
  wire [20:0] _GEN_765; // @[:TLSPI.fir@2.2]
  wire [3:0] _T_1681; // @[RegisterRouter.scala 62:24:TLSPI.fir@901.4]
  wire [3:0] _T_1685; // @[RegisterRouter.scala 62:24:TLSPI.fir@904.4]
  wire  _T_1687; // @[RegisterRouter.scala 62:24:TLSPI.fir@905.4]
  wire  profilePin_20; // @[RegisterRouter.scala 62:24:TLSPI.fir@913.4]
  wire [21:0] _GEN_766; // @[:TLSPI.fir@2.2]
  wire  _T_2030; // @[RegisterRouter.scala 62:24:TLSPI.fir@1143.4]
  wire  _T_2474; // @[RegisterRouter.scala 62:24:TLSPI.fir@1579.4]
  wire [9:0] _T_464; // @[RegisterRouter.scala 62:24:TLSPI.fir@193.4]
  wire [9:0] _T_465; // @[RegisterRouter.scala 62:24:TLSPI.fir@194.4]
  wire  _T_467; // @[RegisterRouter.scala 62:24:TLSPI.fir@195.4]
  wire  _T_2475; // @[RegisterRouter.scala 62:24:TLSPI.fir@1580.4]
  wire  profilePin_21; // @[RegisterRouter.scala 62:24:TLSPI.fir@943.4]
  wire [22:0] _GEN_767; // @[:TLSPI.fir@2.2]
  wire  profilePin_22; // @[RegisterRouter.scala 62:24:TLSPI.fir@973.4]
  wire [23:0] _GEN_768; // @[:TLSPI.fir@2.2]
  wire  _T_2023; // @[RegisterRouter.scala 62:24:TLSPI.fir@1136.4]
  wire  _T_2418; // @[RegisterRouter.scala 62:24:TLSPI.fir@1522.4]
  wire [9:0] _T_482; // @[RegisterRouter.scala 62:24:TLSPI.fir@205.4]
  wire [9:0] _T_483; // @[RegisterRouter.scala 62:24:TLSPI.fir@206.4]
  wire  _T_485; // @[RegisterRouter.scala 62:24:TLSPI.fir@207.4]
  wire  _T_2419; // @[RegisterRouter.scala 62:24:TLSPI.fir@1523.4]
  wire  profilePin_23; // @[RegisterRouter.scala 62:24:TLSPI.fir@1085.4]
  wire [24:0] _GEN_769; // @[:TLSPI.fir@2.2]
  wire  profilePin_24; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [25:0] _GEN_770; // @[:TLSPI.fir@2.2]
  wire  profilePin_25; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [26:0] _GEN_771; // @[:TLSPI.fir@2.2]
  wire  profilePin_26; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [27:0] _GEN_772; // @[:TLSPI.fir@2.2]
  wire  profilePin_27; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [28:0] _GEN_773; // @[:TLSPI.fir@2.2]
  wire  profilePin_28; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [29:0] _GEN_774; // @[:TLSPI.fir@2.2]
  wire  profilePin_29; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [30:0] _GEN_775; // @[:TLSPI.fir@2.2]
  wire  profilePin_30; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_776; // @[:TLSPI.fir@2.2]
  wire  profilePin_31; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [32:0] _GEN_777; // @[:TLSPI.fir@2.2]
  wire  profilePin_32; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [33:0] _GEN_778; // @[:TLSPI.fir@2.2]
  wire  profilePin_33; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [34:0] _GEN_779; // @[:TLSPI.fir@2.2]
  wire  profilePin_34; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [35:0] _GEN_780; // @[:TLSPI.fir@2.2]
  wire  profilePin_35; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [36:0] _GEN_781; // @[:TLSPI.fir@2.2]
  wire  profilePin_36; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [37:0] _GEN_782; // @[:TLSPI.fir@2.2]
  wire  profilePin_37; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [38:0] _GEN_783; // @[:TLSPI.fir@2.2]
  wire  profilePin_38; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [39:0] _GEN_784; // @[:TLSPI.fir@2.2]
  wire  profilePin_39; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [40:0] _GEN_785; // @[:TLSPI.fir@2.2]
  wire  profilePin_40; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [41:0] _GEN_786; // @[:TLSPI.fir@2.2]
  wire  profilePin_41; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [42:0] _GEN_787; // @[:TLSPI.fir@2.2]
  wire  profilePin_42; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [43:0] _GEN_788; // @[:TLSPI.fir@2.2]
  wire  profilePin_43; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [44:0] _GEN_789; // @[:TLSPI.fir@2.2]
  wire  profilePin_44; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [45:0] _GEN_790; // @[:TLSPI.fir@2.2]
  wire  profilePin_45; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [46:0] _GEN_791; // @[:TLSPI.fir@2.2]
  wire  profilePin_46; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [47:0] _GEN_792; // @[:TLSPI.fir@2.2]
  wire  profilePin_47; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [48:0] _GEN_793; // @[:TLSPI.fir@2.2]
  wire  profilePin_48; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [49:0] _GEN_794; // @[:TLSPI.fir@2.2]
  wire  profilePin_49; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [50:0] _GEN_795; // @[:TLSPI.fir@2.2]
  wire  profilePin_50; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [51:0] _GEN_796; // @[:TLSPI.fir@2.2]
  wire  profilePin_51; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [52:0] _GEN_797; // @[:TLSPI.fir@2.2]
  wire  profilePin_52; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [53:0] _GEN_798; // @[:TLSPI.fir@2.2]
  wire  profilePin_53; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [54:0] _GEN_799; // @[:TLSPI.fir@2.2]
  wire  profilePin_54; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [55:0] _GEN_800; // @[:TLSPI.fir@2.2]
  wire [56:0] _GEN_801; // @[:TLSPI.fir@2.2]
  wire [57:0] _GEN_802; // @[:TLSPI.fir@2.2]
  wire [58:0] _GEN_803; // @[:TLSPI.fir@2.2]
  wire [59:0] _GEN_804; // @[:TLSPI.fir@2.2]
  wire [60:0] _GEN_805; // @[:TLSPI.fir@2.2]
  wire [61:0] _GEN_806; // @[:TLSPI.fir@2.2]
  wire [62:0] _GEN_807; // @[:TLSPI.fir@2.2]
  wire [63:0] _GEN_808; // @[:TLSPI.fir@2.2]
  wire [64:0] _GEN_809; // @[:TLSPI.fir@2.2]
  wire [65:0] _GEN_810; // @[:TLSPI.fir@2.2]
  wire [66:0] _GEN_811; // @[:TLSPI.fir@2.2]
  wire [67:0] _GEN_812; // @[:TLSPI.fir@2.2]
  wire [68:0] _GEN_813; // @[:TLSPI.fir@2.2]
  wire [69:0] _GEN_814; // @[:TLSPI.fir@2.2]
  wire [70:0] _GEN_815; // @[:TLSPI.fir@2.2]
  wire [71:0] _GEN_816; // @[:TLSPI.fir@2.2]
  wire [72:0] _GEN_817; // @[:TLSPI.fir@2.2]
  wire [73:0] _GEN_818; // @[:TLSPI.fir@2.2]
  wire [74:0] _GEN_819; // @[:TLSPI.fir@2.2]
  wire [75:0] _GEN_820; // @[:TLSPI.fir@2.2]
  wire [76:0] _GEN_821; // @[:TLSPI.fir@2.2]
  wire [77:0] _GEN_822; // @[:TLSPI.fir@2.2]
  wire [78:0] _GEN_823; // @[:TLSPI.fir@2.2]
  wire [79:0] _GEN_824; // @[:TLSPI.fir@2.2]
  wire [80:0] _GEN_825; // @[:TLSPI.fir@2.2]
  wire [81:0] _GEN_826; // @[:TLSPI.fir@2.2]
  wire [82:0] _GEN_827; // @[:TLSPI.fir@2.2]
  wire [83:0] _GEN_828; // @[:TLSPI.fir@2.2]
  wire [84:0] _GEN_829; // @[:TLSPI.fir@2.2]
  wire [85:0] _GEN_830; // @[:TLSPI.fir@2.2]
  wire [86:0] _GEN_831; // @[:TLSPI.fir@2.2]
  wire [9:0] _T_401; // @[RegisterRouter.scala 62:24:TLSPI.fir@151.4]
  wire [9:0] _T_402; // @[RegisterRouter.scala 62:24:TLSPI.fir@152.4]
  wire  _T_404; // @[RegisterRouter.scala 62:24:TLSPI.fir@153.4]
  wire [9:0] _T_473; // @[RegisterRouter.scala 62:24:TLSPI.fir@199.4]
  wire [9:0] _T_474; // @[RegisterRouter.scala 62:24:TLSPI.fir@200.4]
  wire  _T_476; // @[RegisterRouter.scala 62:24:TLSPI.fir@201.4]
  wire [9:0] _T_446; // @[RegisterRouter.scala 62:24:TLSPI.fir@181.4]
  wire [9:0] _T_447; // @[RegisterRouter.scala 62:24:TLSPI.fir@182.4]
  wire  _T_449; // @[RegisterRouter.scala 62:24:TLSPI.fir@183.4]
  wire  _GEN_150; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_151; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_152; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_153; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_154; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_155; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_156; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_157; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_158; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_159; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_160; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_161; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_162; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_163; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_164; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_165; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_166; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_167; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_168; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_169; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_170; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_171; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_172; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_173; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_174; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_175; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_176; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_177; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_178; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  _GEN_179; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire  profilePin_86; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [87:0] _GEN_832; // @[:TLSPI.fir@2.2]
  wire [88:0] _GEN_833; // @[:TLSPI.fir@2.2]
  wire [89:0] _GEN_834; // @[:TLSPI.fir@2.2]
  wire [90:0] _GEN_835; // @[:TLSPI.fir@2.2]
  wire [91:0] _GEN_836; // @[:TLSPI.fir@2.2]
  wire [92:0] _GEN_837; // @[:TLSPI.fir@2.2]
  wire [93:0] _GEN_838; // @[:TLSPI.fir@2.2]
  wire [94:0] _GEN_839; // @[:TLSPI.fir@2.2]
  wire [95:0] _GEN_840; // @[:TLSPI.fir@2.2]
  wire [96:0] _GEN_841; // @[:TLSPI.fir@2.2]
  wire [97:0] _GEN_842; // @[:TLSPI.fir@2.2]
  wire [98:0] _GEN_843; // @[:TLSPI.fir@2.2]
  wire [99:0] _GEN_844; // @[:TLSPI.fir@2.2]
  wire [100:0] _GEN_845; // @[:TLSPI.fir@2.2]
  wire [101:0] _GEN_846; // @[:TLSPI.fir@2.2]
  wire [102:0] _GEN_847; // @[:TLSPI.fir@2.2]
  wire [103:0] _GEN_848; // @[:TLSPI.fir@2.2]
  wire [104:0] _GEN_849; // @[:TLSPI.fir@2.2]
  wire [105:0] _GEN_850; // @[:TLSPI.fir@2.2]
  wire [106:0] _GEN_851; // @[:TLSPI.fir@2.2]
  wire [107:0] _GEN_852; // @[:TLSPI.fir@2.2]
  wire [108:0] _GEN_853; // @[:TLSPI.fir@2.2]
  wire  profilePin_108;
  wire [109:0] _GEN_854; // @[:TLSPI.fir@2.2]
  wire  profilePin_109;
  wire [110:0] _GEN_855; // @[:TLSPI.fir@2.2]
  wire  profilePin_110;
  wire [111:0] _GEN_856; // @[:TLSPI.fir@2.2]
  wire  profilePin_111;
  wire [112:0] _GEN_857; // @[:TLSPI.fir@2.2]
  wire  profilePin_112;
  wire [113:0] _GEN_858; // @[:TLSPI.fir@2.2]
  wire  profilePin_113;
  wire [114:0] _GEN_859; // @[:TLSPI.fir@2.2]
  wire  profilePin_114;
  wire [115:0] _GEN_860; // @[:TLSPI.fir@2.2]
  wire  profilePin_115;
  wire [116:0] _GEN_861; // @[:TLSPI.fir@2.2]
  wire  profilePin_116;
  wire [117:0] _GEN_862; // @[:TLSPI.fir@2.2]
  wire  profilePin_117;
  wire [118:0] _GEN_863; // @[:TLSPI.fir@2.2]
  wire  profilePin_118;
  wire [119:0] _GEN_864; // @[:TLSPI.fir@2.2]
  wire  profilePin_119;
  wire [120:0] _GEN_865; // @[:TLSPI.fir@2.2]
  wire  profilePin_120;
  wire [121:0] _GEN_866; // @[:TLSPI.fir@2.2]
  wire  profilePin_121;
  wire [122:0] _GEN_867; // @[:TLSPI.fir@2.2]
  wire  profilePin_122;
  wire [123:0] _GEN_868; // @[:TLSPI.fir@2.2]
  wire  profilePin_123;
  wire [124:0] _GEN_869; // @[:TLSPI.fir@2.2]
  wire  profilePin_124;
  wire [125:0] _GEN_870; // @[:TLSPI.fir@2.2]
  wire  profilePin_125;
  wire [126:0] _GEN_871; // @[:TLSPI.fir@2.2]
  wire  profilePin_126;
  wire [127:0] _GEN_872; // @[:TLSPI.fir@2.2]
  wire  profilePin_127;
  wire [128:0] _GEN_873; // @[:TLSPI.fir@2.2]
  wire  profilePin_128;
  wire [129:0] _GEN_874; // @[:TLSPI.fir@2.2]
  wire  profilePin_129;
  wire [130:0] _GEN_875; // @[:TLSPI.fir@2.2]
  wire  profilePin_130;
  wire [131:0] _GEN_876; // @[:TLSPI.fir@2.2]
  wire  profilePin_215;
  wire [132:0] _GEN_877; // @[:TLSPI.fir@2.2]
  wire  profilePin_216;
  wire [133:0] _GEN_878; // @[:TLSPI.fir@2.2]
  wire  profilePin_217;
  wire [134:0] _GEN_879; // @[:TLSPI.fir@2.2]
  wire  profilePin_218;
  wire [135:0] _GEN_880; // @[:TLSPI.fir@2.2]
  wire  profilePin_219;
  wire [136:0] _GEN_881; // @[:TLSPI.fir@2.2]
  wire  profilePin_220;
  wire [137:0] _GEN_882; // @[:TLSPI.fir@2.2]
  wire  profilePin_221;
  wire [138:0] _GEN_883; // @[:TLSPI.fir@2.2]
  wire  profilePin_222;
  wire [139:0] _GEN_884; // @[:TLSPI.fir@2.2]
  wire  profilePin_223;
  wire [140:0] _GEN_885; // @[:TLSPI.fir@2.2]
  wire  profilePin_224;
  wire [141:0] _GEN_886; // @[:TLSPI.fir@2.2]
  wire  profilePin_225;
  wire [142:0] _GEN_887; // @[:TLSPI.fir@2.2]
  wire  profilePin_226;
  wire [143:0] _GEN_888; // @[:TLSPI.fir@2.2]
  wire  profilePin_227;
  wire [144:0] _GEN_889; // @[:TLSPI.fir@2.2]
  wire  profilePin_228;
  wire [145:0] _GEN_890; // @[:TLSPI.fir@2.2]
  wire  profilePin_229;
  wire [146:0] _GEN_891; // @[:TLSPI.fir@2.2]
  wire  profilePin_230;
  wire [147:0] _GEN_892; // @[:TLSPI.fir@2.2]
  wire  profilePin_231;
  wire [148:0] _GEN_893; // @[:TLSPI.fir@2.2]
  wire  profilePin_232;
  wire [149:0] _GEN_894; // @[:TLSPI.fir@2.2]
  wire  profilePin_233;
  wire [150:0] _GEN_895; // @[:TLSPI.fir@2.2]
  wire  profilePin_234;
  wire [151:0] _GEN_896; // @[:TLSPI.fir@2.2]
  wire  profilePin_235;
  wire [152:0] _GEN_897; // @[:TLSPI.fir@2.2]
  wire  profilePin_236;
  wire [153:0] _GEN_898; // @[:TLSPI.fir@2.2]
  wire  profilePin_237;
  wire [154:0] _GEN_899; // @[:TLSPI.fir@2.2]
  wire  profilePin_238;
  wire [155:0] _GEN_900; // @[:TLSPI.fir@2.2]
  wire  profilePin_239;
  wire [156:0] _GEN_901; // @[:TLSPI.fir@2.2]
  wire  profilePin_240;
  wire [157:0] _GEN_902; // @[:TLSPI.fir@2.2]
  wire  profilePin_241;
  wire [158:0] _GEN_903; // @[:TLSPI.fir@2.2]
  wire  profilePin_242;
  wire [159:0] _GEN_904; // @[:TLSPI.fir@2.2]
  wire  profilePin_243;
  wire [160:0] _GEN_905; // @[:TLSPI.fir@2.2]
  wire  profilePin_244;
  wire [161:0] _GEN_906; // @[:TLSPI.fir@2.2]
  wire  profilePin_245;
  wire [162:0] _GEN_907; // @[:TLSPI.fir@2.2]
  wire  profilePin_246;
  wire [163:0] _GEN_908; // @[:TLSPI.fir@2.2]
  wire  profilePin_247;
  wire [164:0] _GEN_909; // @[:TLSPI.fir@2.2]
  wire  profilePin_248;
  wire [165:0] _GEN_910; // @[:TLSPI.fir@2.2]
  wire  profilePin_249;
  wire [166:0] _GEN_911; // @[:TLSPI.fir@2.2]
  wire  profilePin_250;
  wire [167:0] _GEN_912; // @[:TLSPI.fir@2.2]
  wire  profilePin_251;
  wire [168:0] _GEN_913; // @[:TLSPI.fir@2.2]
  wire  profilePin_252;
  wire [169:0] _GEN_914; // @[:TLSPI.fir@2.2]
  wire  profilePin_253;
  wire [170:0] _GEN_915; // @[:TLSPI.fir@2.2]
  wire  profilePin_254;
  wire [171:0] _GEN_916; // @[:TLSPI.fir@2.2]
  wire  profilePin_255;
  wire [172:0] _GEN_917; // @[:TLSPI.fir@2.2]
  wire  profilePin_256;
  wire [173:0] _GEN_918; // @[:TLSPI.fir@2.2]
  wire  profilePin_257;
  wire [174:0] _GEN_919; // @[:TLSPI.fir@2.2]
  wire  profilePin_258;
  wire [175:0] _GEN_920; // @[:TLSPI.fir@2.2]
  wire  profilePin_259;
  wire [176:0] _GEN_921; // @[:TLSPI.fir@2.2]
  wire  profilePin_260;
  wire [177:0] _GEN_922; // @[:TLSPI.fir@2.2]
  wire  profilePin_261;
  wire [178:0] _GEN_923; // @[:TLSPI.fir@2.2]
  wire  profilePin_262;
  wire [179:0] _GEN_924; // @[:TLSPI.fir@2.2]
  wire  profilePin_263;
  wire [180:0] _GEN_925; // @[:TLSPI.fir@2.2]
  wire  profilePin_264;
  wire [181:0] _GEN_926; // @[:TLSPI.fir@2.2]
  wire  profilePin_265;
  wire [182:0] _GEN_927; // @[:TLSPI.fir@2.2]
  wire  profilePin_266;
  wire [183:0] _GEN_928; // @[:TLSPI.fir@2.2]
  wire  profilePin_267;
  wire [184:0] _GEN_929; // @[:TLSPI.fir@2.2]
  wire  profilePin_268;
  wire [185:0] _GEN_930; // @[:TLSPI.fir@2.2]
  wire  profilePin_269;
  wire [186:0] _GEN_931; // @[:TLSPI.fir@2.2]
  wire  profilePin_270;
  wire [187:0] _GEN_932; // @[:TLSPI.fir@2.2]
  wire  profilePin_271;
  wire [188:0] _GEN_933; // @[:TLSPI.fir@2.2]
  wire  profilePin_272;
  wire [189:0] _GEN_934; // @[:TLSPI.fir@2.2]
  wire  profilePin_273;
  wire [190:0] _GEN_935; // @[:TLSPI.fir@2.2]
  wire  profilePin_274;
  wire [191:0] _GEN_936; // @[:TLSPI.fir@2.2]
  wire  profilePin_275;
  wire [192:0] _GEN_937; // @[:TLSPI.fir@2.2]
  wire  profilePin_276;
  wire [193:0] _GEN_938; // @[:TLSPI.fir@2.2]
  wire  profilePin_277;
  wire [194:0] _GEN_939; // @[:TLSPI.fir@2.2]
  wire  profilePin_278;
  wire [195:0] _GEN_940; // @[:TLSPI.fir@2.2]
  wire  profilePin_279;
  wire [196:0] _GEN_941; // @[:TLSPI.fir@2.2]
  wire  profilePin_280;
  wire [197:0] _GEN_942; // @[:TLSPI.fir@2.2]
  wire  profilePin_281;
  wire [198:0] _GEN_943; // @[:TLSPI.fir@2.2]
  wire  profilePin_282;
  wire [199:0] _GEN_944; // @[:TLSPI.fir@2.2]
  wire  profilePin_283;
  wire [200:0] _GEN_945; // @[:TLSPI.fir@2.2]
  wire  profilePin_284;
  wire [201:0] _GEN_946; // @[:TLSPI.fir@2.2]
  wire  profilePin_285;
  wire [202:0] _GEN_947; // @[:TLSPI.fir@2.2]
  wire  profilePin_286;
  wire [203:0] _GEN_948; // @[:TLSPI.fir@2.2]
  wire  profilePin_287;
  wire [204:0] _GEN_949; // @[:TLSPI.fir@2.2]
  wire  profilePin_288;
  wire [205:0] _GEN_950; // @[:TLSPI.fir@2.2]
  wire  profilePin_289;
  wire [206:0] _GEN_951; // @[:TLSPI.fir@2.2]
  wire  profilePin_290;
  wire [207:0] _GEN_952; // @[:TLSPI.fir@2.2]
  wire  profilePin_291;
  wire [208:0] _GEN_953; // @[:TLSPI.fir@2.2]
  wire  profilePin_292;
  wire [209:0] _GEN_954; // @[:TLSPI.fir@2.2]
  wire  profilePin_293;
  wire [210:0] _GEN_955; // @[:TLSPI.fir@2.2]
  wire  profilePin_294;
  wire [211:0] _GEN_956; // @[:TLSPI.fir@2.2]
  wire  profilePin_295;
  wire [212:0] _GEN_957; // @[:TLSPI.fir@2.2]
  wire  profilePin_296;
  wire [213:0] _GEN_958; // @[:TLSPI.fir@2.2]
  wire  profilePin_297;
  wire [214:0] _GEN_959; // @[:TLSPI.fir@2.2]
  wire  profilePin_298;
  wire [215:0] _GEN_960; // @[:TLSPI.fir@2.2]
  wire  profilePin_299;
  wire [216:0] _GEN_961; // @[:TLSPI.fir@2.2]
  wire  profilePin_300;
  wire [217:0] _GEN_962; // @[:TLSPI.fir@2.2]
  wire  profilePin_301;
  wire [218:0] _GEN_963; // @[:TLSPI.fir@2.2]
  wire  profilePin_302;
  wire [219:0] _GEN_964; // @[:TLSPI.fir@2.2]
  wire  profilePin_303;
  wire [220:0] _GEN_965; // @[:TLSPI.fir@2.2]
  wire  profilePin_304;
  wire [221:0] _GEN_966; // @[:TLSPI.fir@2.2]
  wire  profilePin_305;
  wire [222:0] _GEN_967; // @[:TLSPI.fir@2.2]
  wire  profilePin_306;
  wire [223:0] _GEN_968; // @[:TLSPI.fir@2.2]
  wire  profilePin_307;
  wire [224:0] _GEN_969; // @[:TLSPI.fir@2.2]
  wire  profilePin_308;
  wire [225:0] _GEN_970; // @[:TLSPI.fir@2.2]
  wire  profilePin_309;
  wire [226:0] _GEN_971; // @[:TLSPI.fir@2.2]
  wire  profilePin_310;
  wire [227:0] _GEN_972; // @[:TLSPI.fir@2.2]
  wire  profilePin_311;
  wire [228:0] _GEN_973; // @[:TLSPI.fir@2.2]
  wire  profilePin_312;
  wire [229:0] _GEN_974; // @[:TLSPI.fir@2.2]
  wire  profilePin_313;
  wire [230:0] _GEN_975; // @[:TLSPI.fir@2.2]
  wire  profilePin_314;
  wire [231:0] _GEN_976; // @[:TLSPI.fir@2.2]
  wire  profilePin_315;
  wire [232:0] _GEN_977; // @[:TLSPI.fir@2.2]
  wire  profilePin_316;
  wire [233:0] _GEN_978; // @[:TLSPI.fir@2.2]
  wire  profilePin_317;
  wire [234:0] _GEN_979; // @[:TLSPI.fir@2.2]
  wire  profilePin_318;
  wire [235:0] _GEN_980; // @[:TLSPI.fir@2.2]
  wire  profilePin_319;
  wire [236:0] _GEN_981; // @[:TLSPI.fir@2.2]
  wire  profilePin_320;
  wire [237:0] _GEN_982; // @[:TLSPI.fir@2.2]
  wire  profilePin_321;
  wire [238:0] _GEN_983; // @[:TLSPI.fir@2.2]
  wire  profilePin_322;
  wire [239:0] _GEN_984; // @[:TLSPI.fir@2.2]
  wire  profilePin_323;
  wire [240:0] _GEN_985; // @[:TLSPI.fir@2.2]
  wire  profilePin_324;
  wire [241:0] _GEN_986; // @[:TLSPI.fir@2.2]
  wire  profilePin_325;
  wire [242:0] _GEN_987; // @[:TLSPI.fir@2.2]
  wire  profilePin_326;
  wire [243:0] _GEN_988; // @[:TLSPI.fir@2.2]
  wire  profilePin_327;
  wire [244:0] _GEN_989; // @[:TLSPI.fir@2.2]
  wire  profilePin_328;
  wire [245:0] _GEN_990; // @[:TLSPI.fir@2.2]
  wire  profilePin_329;
  wire [246:0] _GEN_991; // @[:TLSPI.fir@2.2]
  wire  profilePin_330;
  wire [247:0] _GEN_992; // @[:TLSPI.fir@2.2]
  wire  profilePin_331;
  wire [248:0] _GEN_993; // @[:TLSPI.fir@2.2]
  wire  profilePin_332;
  wire [249:0] _GEN_994; // @[:TLSPI.fir@2.2]
  wire  profilePin_333;
  wire [250:0] _GEN_995; // @[:TLSPI.fir@2.2]
  wire  profilePin_334;
  wire [251:0] _GEN_996; // @[:TLSPI.fir@2.2]
  wire  profilePin_335;
  wire [252:0] _GEN_997; // @[:TLSPI.fir@2.2]
  wire  profilePin_336;
  wire [253:0] _GEN_998; // @[:TLSPI.fir@2.2]
  wire  profilePin_337;
  wire [254:0] _GEN_999; // @[:TLSPI.fir@2.2]
  wire  profilePin_338;
  wire [255:0] _GEN_1000; // @[:TLSPI.fir@2.2]
  wire  profilePin_339;
  wire [256:0] _GEN_1001; // @[:TLSPI.fir@2.2]
  wire  profilePin_340;
  wire [257:0] _GEN_1002; // @[:TLSPI.fir@2.2]
  wire  profilePin_341;
  wire [258:0] _GEN_1003; // @[:TLSPI.fir@2.2]
  wire  profilePin_342;
  wire [259:0] _GEN_1004; // @[:TLSPI.fir@2.2]
  wire  profilePin_343;
  wire [260:0] _GEN_1005; // @[:TLSPI.fir@2.2]
  wire  profilePin_344;
  wire [261:0] _GEN_1006; // @[:TLSPI.fir@2.2]
  wire  profilePin_345;
  wire [262:0] _GEN_1007; // @[:TLSPI.fir@2.2]
  wire  profilePin_346;
  wire [263:0] _GEN_1008; // @[:TLSPI.fir@2.2]
  wire  profilePin_347;
  wire [264:0] _GEN_1009; // @[:TLSPI.fir@2.2]
  wire  profilePin_348;
  wire [265:0] _GEN_1010; // @[:TLSPI.fir@2.2]
  wire  profilePin_349;
  wire [266:0] _GEN_1011; // @[:TLSPI.fir@2.2]
  wire  profilePin_350;
  wire [267:0] _GEN_1012; // @[:TLSPI.fir@2.2]
  wire  profilePin_351;
  wire [268:0] _GEN_1013; // @[:TLSPI.fir@2.2]
  wire  profilePin_352;
  wire [269:0] _GEN_1014; // @[:TLSPI.fir@2.2]
  wire  profilePin_353;
  wire [270:0] _GEN_1015; // @[:TLSPI.fir@2.2]
  wire  profilePin_354;
  wire [271:0] _GEN_1016; // @[:TLSPI.fir@2.2]
  wire  profilePin_355;
  wire [272:0] _GEN_1017; // @[:TLSPI.fir@2.2]
  wire  profilePin_356;
  wire [273:0] _GEN_1018; // @[:TLSPI.fir@2.2]
  wire  profilePin_357;
  wire [274:0] _GEN_1019; // @[:TLSPI.fir@2.2]
  wire  profilePin_358;
  wire [275:0] _GEN_1020; // @[:TLSPI.fir@2.2]
  wire  profilePin_359;
  wire [276:0] _GEN_1021; // @[:TLSPI.fir@2.2]
  wire  profilePin_360;
  wire [277:0] _GEN_1022; // @[:TLSPI.fir@2.2]
  wire  profilePin_361;
  wire [278:0] _GEN_1023; // @[:TLSPI.fir@2.2]
  wire  profilePin_362;
  wire [279:0] _GEN_1024; // @[:TLSPI.fir@2.2]
  wire  profilePin_363;
  wire [280:0] _GEN_1025; // @[:TLSPI.fir@2.2]
  wire  profilePin_364;
  wire [281:0] _GEN_1026; // @[:TLSPI.fir@2.2]
  wire  profilePin_365;
  wire [282:0] _GEN_1027; // @[:TLSPI.fir@2.2]
  wire  profilePin_366;
  wire [283:0] _GEN_1028; // @[:TLSPI.fir@2.2]
  wire  profilePin_367;
  wire [284:0] _GEN_1029; // @[:TLSPI.fir@2.2]
  wire  profilePin_368;
  wire [285:0] _GEN_1030; // @[:TLSPI.fir@2.2]
  wire  profilePin_369;
  wire [286:0] _GEN_1031; // @[:TLSPI.fir@2.2]
  wire  profilePin_370;
  wire [287:0] _GEN_1032; // @[:TLSPI.fir@2.2]
  wire  profilePin_371;
  wire [288:0] _GEN_1033; // @[:TLSPI.fir@2.2]
  wire  profilePin_372;
  wire [289:0] _GEN_1034; // @[:TLSPI.fir@2.2]
  wire  profilePin_373;
  wire [290:0] _GEN_1035; // @[:TLSPI.fir@2.2]
  wire  profilePin_374;
  wire [291:0] _GEN_1036; // @[:TLSPI.fir@2.2]
  wire  profilePin_375;
  wire [292:0] _GEN_1037; // @[:TLSPI.fir@2.2]
  wire  profilePin_376;
  wire [293:0] _GEN_1038; // @[:TLSPI.fir@2.2]
  wire  profilePin_377;
  wire [294:0] _GEN_1039; // @[:TLSPI.fir@2.2]
  wire  profilePin_378;
  wire [295:0] _GEN_1040; // @[:TLSPI.fir@2.2]
  wire  profilePin_379;
  wire [296:0] _GEN_1041; // @[:TLSPI.fir@2.2]
  wire  profilePin_380;
  wire [297:0] _GEN_1042; // @[:TLSPI.fir@2.2]
  wire  profilePin_381;
  wire [298:0] _GEN_1043; // @[:TLSPI.fir@2.2]
  wire  profilePin_382;
  wire [299:0] _GEN_1044; // @[:TLSPI.fir@2.2]
  wire  profilePin_383;
  wire [300:0] _GEN_1045; // @[:TLSPI.fir@2.2]
  wire  profilePin_384;
  wire [301:0] _GEN_1046; // @[:TLSPI.fir@2.2]
  wire  profilePin_385;
  wire [302:0] _GEN_1047; // @[:TLSPI.fir@2.2]
  wire  profilePin_386;
  wire [303:0] _GEN_1048; // @[:TLSPI.fir@2.2]
  wire  profilePin_387;
  wire [304:0] _GEN_1049; // @[:TLSPI.fir@2.2]
  wire  profilePin_388;
  wire [305:0] _GEN_1050; // @[:TLSPI.fir@2.2]
  wire  profilePin_389;
  wire [306:0] _GEN_1051; // @[:TLSPI.fir@2.2]
  wire  profilePin_390;
  wire [307:0] _GEN_1052; // @[:TLSPI.fir@2.2]
  wire  profilePin_391;
  wire [308:0] _GEN_1053; // @[:TLSPI.fir@2.2]
  wire  profilePin_392;
  wire [309:0] _GEN_1054; // @[:TLSPI.fir@2.2]
  wire  profilePin_393;
  wire [310:0] _GEN_1055; // @[:TLSPI.fir@2.2]
  wire  profilePin_394;
  wire [311:0] _GEN_1056; // @[:TLSPI.fir@2.2]
  wire  profilePin_395;
  wire [312:0] _GEN_1057; // @[:TLSPI.fir@2.2]
  wire  profilePin_396;
  wire [313:0] _GEN_1058; // @[:TLSPI.fir@2.2]
  wire  profilePin_397;
  wire [314:0] _GEN_1059; // @[:TLSPI.fir@2.2]
  wire  profilePin_398;
  wire [315:0] _GEN_1060; // @[:TLSPI.fir@2.2]
  wire  profilePin_399;
  wire [316:0] _GEN_1061; // @[:TLSPI.fir@2.2]
  wire  profilePin_400;
  wire [317:0] _GEN_1062; // @[:TLSPI.fir@2.2]
  wire  profilePin_401;
  wire [318:0] _GEN_1063; // @[:TLSPI.fir@2.2]
  wire  profilePin_402;
  wire [319:0] _GEN_1064; // @[:TLSPI.fir@2.2]
  wire  profilePin_403;
  wire [320:0] _GEN_1065; // @[:TLSPI.fir@2.2]
  wire  profilePin_404;
  wire [321:0] _GEN_1066; // @[:TLSPI.fir@2.2]
  wire  profilePin_405;
  wire  _T_261; // @[TLSPI.scala 74:25:TLSPI.fir@102.4]
  wire  _T_262; // @[TLSPI.scala 74:49:TLSPI.fir@103.4]
  wire  _T_269; // @[RegMapFIFO.scala 24:9:TLSPI.fir@108.4]
  wire  _T_272; // @[RegMapFIFO.scala 45:21:TLSPI.fir@109.4]
  wire [8:0] _T_283; // @[Cat.scala 30:58:TLSPI.fir@119.4]
  wire  _T_2086; // @[RegisterRouter.scala 62:24:TLSPI.fir@1198.4]
  wire [11:0] _T_728; // @[RegisterRouter.scala 62:24:TLSPI.fir@263.4]
  wire  _T_772; // @[RegisterRouter.scala 62:24:TLSPI.fir@293.4]
  wire  _T_816; // @[RegisterRouter.scala 62:24:TLSPI.fir@323.4]
  wire [1:0] _GEN_1068; // @[RegisterRouter.scala 62:24:TLSPI.fir@335.4]
  wire [1:0] _T_835; // @[RegisterRouter.scala 62:24:TLSPI.fir@335.4]
  wire [1:0] _GEN_1069; // @[RegisterRouter.scala 62:24:TLSPI.fir@338.4]
  wire [1:0] _T_839; // @[RegisterRouter.scala 62:24:TLSPI.fir@338.4]
  wire  _T_860; // @[RegisterRouter.scala 62:24:TLSPI.fir@353.4]
  wire [2:0] _GEN_1070; // @[RegisterRouter.scala 62:24:TLSPI.fir@365.4]
  wire [2:0] _T_879; // @[RegisterRouter.scala 62:24:TLSPI.fir@365.4]
  wire [2:0] _GEN_1071; // @[RegisterRouter.scala 62:24:TLSPI.fir@368.4]
  wire [2:0] _T_883; // @[RegisterRouter.scala 62:24:TLSPI.fir@368.4]
  wire  _T_904; // @[RegisterRouter.scala 62:24:TLSPI.fir@383.4]
  wire [3:0] _GEN_1072; // @[RegisterRouter.scala 62:24:TLSPI.fir@395.4]
  wire [3:0] _T_923; // @[RegisterRouter.scala 62:24:TLSPI.fir@395.4]
  wire [3:0] _GEN_1073; // @[RegisterRouter.scala 62:24:TLSPI.fir@398.4]
  wire [3:0] _T_927; // @[RegisterRouter.scala 62:24:TLSPI.fir@398.4]
  wire  _T_930; // @[RegisterRouter.scala 62:24:TLSPI.fir@400.4]
  wire [7:0] _T_948; // @[RegisterRouter.scala 62:24:TLSPI.fir@413.4]
  wire [7:0] _T_992; // @[RegisterRouter.scala 62:24:TLSPI.fir@443.4]
  wire [23:0] _GEN_1074; // @[RegisterRouter.scala 62:24:TLSPI.fir@455.4]
  wire [23:0] _T_1011; // @[RegisterRouter.scala 62:24:TLSPI.fir@455.4]
  wire [23:0] _GEN_1075; // @[RegisterRouter.scala 62:24:TLSPI.fir@458.4]
  wire [23:0] _T_1015; // @[RegisterRouter.scala 62:24:TLSPI.fir@458.4]
  wire [3:0] _T_1036; // @[RegisterRouter.scala 62:24:TLSPI.fir@473.4]
  wire  _T_1099; // @[RegisterRouter.scala 62:24:TLSPI.fir@512.4]
  wire [1:0] _GEN_1076; // @[RegisterRouter.scala 62:24:TLSPI.fir@539.4]
  wire [1:0] _T_1143; // @[RegisterRouter.scala 62:24:TLSPI.fir@539.4]
  wire [1:0] _GEN_1077; // @[RegisterRouter.scala 62:24:TLSPI.fir@542.4]
  wire [1:0] _T_1147; // @[RegisterRouter.scala 62:24:TLSPI.fir@542.4]
  wire [1:0] _GEN_1078; // @[RegisterRouter.scala 62:24:TLSPI.fir@599.4]
  wire [1:0] _T_1231; // @[RegisterRouter.scala 62:24:TLSPI.fir@599.4]
  wire [1:0] _GEN_1079; // @[RegisterRouter.scala 62:24:TLSPI.fir@602.4]
  wire [1:0] _T_1235; // @[RegisterRouter.scala 62:24:TLSPI.fir@602.4]
  wire [1:0] _T_1256; // @[RegisterRouter.scala 62:24:TLSPI.fir@617.4]
  wire [1:0] _GEN_1080; // @[RegisterRouter.scala 62:24:TLSPI.fir@689.4]
  wire [1:0] _T_1363; // @[RegisterRouter.scala 62:24:TLSPI.fir@689.4]
  wire [1:0] _GEN_1081; // @[RegisterRouter.scala 62:24:TLSPI.fir@692.4]
  wire [1:0] _T_1367; // @[RegisterRouter.scala 62:24:TLSPI.fir@692.4]
  wire  _T_2037; // @[RegisterRouter.scala 62:24:TLSPI.fir@1150.4]
  wire  _T_2530; // @[RegisterRouter.scala 62:24:TLSPI.fir@1634.4]
  wire  _T_2531; // @[RegisterRouter.scala 62:24:TLSPI.fir@1635.4]
  wire  _T_1428; // @[RegisterRouter.scala 62:24:TLSPI.fir@735.4]
  wire  _T_1513; // @[RegisterRouter.scala 62:24:TLSPI.fir@788.4]
  wire  _T_1514; // @[RegisterRouter.scala 62:24:TLSPI.fir@789.4]
  wire  _T_1516; // @[RegisterRouter.scala 62:24:TLSPI.fir@790.4]
  wire  _T_1520; // @[RegisterRouter.scala 62:24:TLSPI.fir@794.4]
  wire  _T_1523; // @[RegisterRouter.scala 62:24:TLSPI.fir@795.4]
  wire  _T_1526; // @[RegMapFIFO.scala 26:26:TLSPI.fir@797.4]
  wire  _T_1435; // @[RegMapFIFO.scala 18:33:TLSPI.fir@738.4]
  wire [31:0] _GEN_1082; // @[RegisterRouter.scala 62:24:TLSPI.fir@807.4]
  wire [31:0] _T_1544; // @[RegisterRouter.scala 62:24:TLSPI.fir@807.4]
  wire [2:0] _GEN_1083; // @[RegisterRouter.scala 62:24:TLSPI.fir@867.4]
  wire [2:0] _T_1632; // @[RegisterRouter.scala 62:24:TLSPI.fir@867.4]
  wire [2:0] _GEN_1084; // @[RegisterRouter.scala 62:24:TLSPI.fir@870.4]
  wire [2:0] _T_1636; // @[RegisterRouter.scala 62:24:TLSPI.fir@870.4]
  wire [3:0] _GEN_1085; // @[RegisterRouter.scala 62:24:TLSPI.fir@897.4]
  wire [3:0] _T_1676; // @[RegisterRouter.scala 62:24:TLSPI.fir@897.4]
  wire [3:0] _GEN_1086; // @[RegisterRouter.scala 62:24:TLSPI.fir@900.4]
  wire [3:0] _T_1680; // @[RegisterRouter.scala 62:24:TLSPI.fir@900.4]
  wire [3:0] _T_1701; // @[RegisterRouter.scala 62:24:TLSPI.fir@915.4]
  wire [19:0] _GEN_1087; // @[RegisterRouter.scala 62:24:TLSPI.fir@927.4]
  wire [19:0] _T_1720; // @[RegisterRouter.scala 62:24:TLSPI.fir@927.4]
  wire [19:0] _GEN_1088; // @[RegisterRouter.scala 62:24:TLSPI.fir@930.4]
  wire [19:0] _T_1724; // @[RegisterRouter.scala 62:24:TLSPI.fir@930.4]
  wire [23:0] _GEN_1089; // @[RegisterRouter.scala 62:24:TLSPI.fir@987.4]
  wire [23:0] _T_1808; // @[RegisterRouter.scala 62:24:TLSPI.fir@987.4]
  wire [23:0] _GEN_1090; // @[RegisterRouter.scala 62:24:TLSPI.fir@990.4]
  wire [23:0] _T_1812; // @[RegisterRouter.scala 62:24:TLSPI.fir@990.4]
  wire  _T_2038; // @[RegisterRouter.scala 62:24:TLSPI.fir@1151.4]
  wire  _T_2241; // @[RegisterRouter.scala 62:24:TLSPI.fir@1354.4]
  wire  _T_2242; // @[RegisterRouter.scala 62:24:TLSPI.fir@1355.4]
  wire [7:0] _T_1852; // @[RegisterRouter.scala 62:24:TLSPI.fir@1015.4]
  wire [30:0] _T_1900; // @[RegisterRouter.scala 62:24:TLSPI.fir@1045.4]
  wire [31:0] _GEN_1091; // @[RegisterRouter.scala 62:24:TLSPI.fir@1069.4]
  wire [31:0] _T_1940; // @[RegisterRouter.scala 62:24:TLSPI.fir@1069.4]
  wire [31:0] _GEN_1092; // @[RegisterRouter.scala 62:24:TLSPI.fir@1072.4]
  wire [31:0] _T_1944; // @[RegisterRouter.scala 62:24:TLSPI.fir@1072.4]
  wire [31:0] _T_3319_0; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _T_3319_1; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_182; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_183; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_184; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_4; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_185; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_5; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_186; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_6; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_187; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_188; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_189; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_190; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_10; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_191; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_11; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_192; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_193; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_194; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_195; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_196; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_16; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_197; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_198; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_199; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_200; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_20; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_201; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_21; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_202; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_203; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_204; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_205; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_206; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_207; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_208; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_28; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_209; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _T_3319_29; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  wire [31:0] _GEN_210; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_211; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  wire [31:0] _GEN_212; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  TLMonitor_66 TLMonitor ( // @[Nodes.scala 25:25:TLSPI.fir@14.4]
    .metaReset(TLMonitor_metaReset),
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_c_valid(TLMonitor_io_in_c_valid),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_e_valid(TLMonitor_io_in_e_valid),
    ._GEN_118_0(TLMonitor__GEN_118_0),
    ._GEN_10_0(TLMonitor__GEN_10_0),
    ._GEN_43_0(TLMonitor__GEN_43_0),
    ._GEN_37_0(TLMonitor__GEN_37_0),
    ._GEN_109_0(TLMonitor__GEN_109_0),
    ._GEN_21_0(TLMonitor__GEN_21_0),
    ._GEN_3_0(TLMonitor__GEN_3_0),
    ._GEN_17_0(TLMonitor__GEN_17_0),
    ._GEN_96_0(TLMonitor__GEN_96_0),
    ._GEN_112_0(TLMonitor__GEN_112_0),
    ._GEN_24_0(TLMonitor__GEN_24_0),
    ._GEN_115_0(TLMonitor__GEN_115_0),
    ._GEN_7_0(TLMonitor__GEN_7_0),
    ._GEN_73_1(TLMonitor__GEN_73_1),
    ._GEN_121_1(TLMonitor__GEN_121_1),
    ._GEN_80_2(TLMonitor__GEN_80_2),
    ._GEN_59_0(TLMonitor__GEN_59_0),
    ._GEN_108_0(TLMonitor__GEN_108_0),
    ._GEN_53_0(TLMonitor__GEN_53_0),
    ._GEN_46_0(TLMonitor__GEN_46_0),
    ._GEN_70_0(TLMonitor__GEN_70_0),
    ._GEN_77_1(TLMonitor__GEN_77_1),
    ._GEN_39_1(TLMonitor__GEN_39_1),
    ._GEN_29_0(TLMonitor__GEN_29_0),
    ._GEN_56_0(TLMonitor__GEN_56_0),
    ._GEN_26_0(TLMonitor__GEN_26_0),
    ._GEN_5_1(TLMonitor__GEN_5_1),
    ._GEN_33_0(TLMonitor__GEN_33_0),
    ._GEN_63_0(TLMonitor__GEN_63_0),
    ._GEN_114_0(TLMonitor__GEN_114_0),
    ._GEN_9_0(TLMonitor__GEN_9_0),
    ._GEN_20_0(TLMonitor__GEN_20_0),
    ._GEN_36_0(TLMonitor__GEN_36_0),
    ._GEN_42_0(TLMonitor__GEN_42_0),
    ._GEN_2_3(TLMonitor__GEN_2_3),
    ._GEN_117_1(TLMonitor__GEN_117_1),
    ._GEN_111_1(TLMonitor__GEN_111_1),
    ._GEN_75_0(TLMonitor__GEN_75_0),
    ._GEN_23_0(TLMonitor__GEN_23_0),
    ._GEN_12_0(TLMonitor__GEN_12_0),
    ._GEN_79_2(TLMonitor__GEN_79_2),
    ._GEN_89_1(TLMonitor__GEN_89_1),
    ._GEN_58_1(TLMonitor__GEN_58_1),
    ._GEN_65_1(TLMonitor__GEN_65_1),
    ._GEN_35_0(TLMonitor__GEN_35_0),
    ._GEN_69_1(TLMonitor__GEN_69_1),
    ._GEN_62_0(TLMonitor__GEN_62_0),
    ._GEN_22_0(TLMonitor__GEN_22_0),
    ._GEN_51_0(TLMonitor__GEN_51_0),
    ._GEN_11_1(TLMonitor__GEN_11_1),
    ._GEN_38_0(TLMonitor__GEN_38_0),
    ._GEN_45_0(TLMonitor__GEN_45_0),
    ._GEN_113_0(TLMonitor__GEN_113_0),
    ._GEN_4_2(TLMonitor__GEN_4_2),
    ._GEN_32_0(TLMonitor__GEN_32_0),
    ._GEN_25_0(TLMonitor__GEN_25_0),
    ._GEN_48_0(TLMonitor__GEN_48_0),
    ._GEN_8_3(TLMonitor__GEN_8_3),
    ._GEN_122_1(TLMonitor__GEN_122_1),
    ._GEN_28_0(TLMonitor__GEN_28_0),
    ._GEN_1_2(TLMonitor__GEN_1_2),
    ._GEN_19_0(TLMonitor__GEN_19_0),
    ._GEN_74_1(TLMonitor__GEN_74_1),
    ._GEN_85_3(TLMonitor__GEN_85_3),
    ._GEN_110_1(TLMonitor__GEN_110_1),
    ._GEN_67_1(TLMonitor__GEN_67_1),
    ._GEN_71_1(TLMonitor__GEN_71_1),
    ._GEN_54_0(TLMonitor__GEN_54_0),
    ._GEN_47_0(TLMonitor__GEN_47_0),
    ._GEN_81_2(TLMonitor__GEN_81_2),
    ._GEN_40_0(TLMonitor__GEN_40_0),
    ._GEN_27_0(TLMonitor__GEN_27_0),
    ._GEN_64_1(TLMonitor__GEN_64_1),
    ._GEN_57_1(TLMonitor__GEN_57_1),
    ._GEN_50_0(TLMonitor__GEN_50_0)
  );
  SPIFIFO_1 fifo ( // @[TLSPI.scala 60:20:TLSPI.fir@77.4]
    .metaReset(fifo_metaReset),
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_ctrl_fmt_proto(fifo_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(fifo_io_ctrl_fmt_endian),
    .io_ctrl_fmt_iodir(fifo_io_ctrl_fmt_iodir),
    .io_ctrl_fmt_len(fifo_io_ctrl_fmt_len),
    .io_ctrl_cs_mode(fifo_io_ctrl_cs_mode),
    .io_ctrl_wm_tx(fifo_io_ctrl_wm_tx),
    .io_ctrl_wm_rx(fifo_io_ctrl_wm_rx),
    .io_link_tx_ready(fifo_io_link_tx_ready),
    .io_link_tx_valid(fifo_io_link_tx_valid),
    .io_link_tx_bits(fifo_io_link_tx_bits),
    .io_link_rx_valid(fifo_io_link_rx_valid),
    .io_link_rx_bits(fifo_io_link_rx_bits),
    .io_link_cnt(fifo_io_link_cnt),
    .io_link_fmt_proto(fifo_io_link_fmt_proto),
    .io_link_fmt_endian(fifo_io_link_fmt_endian),
    .io_link_fmt_iodir(fifo_io_link_fmt_iodir),
    .io_link_cs_set(fifo_io_link_cs_set),
    .io_link_cs_clear(fifo_io_link_cs_clear),
    .io_tx_ready(fifo_io_tx_ready),
    .io_tx_valid(fifo_io_tx_valid),
    .io_tx_bits(fifo_io_tx_bits),
    .io_rx_ready(fifo_io_rx_ready),
    .io_rx_valid(fifo_io_rx_valid),
    .io_rx_bits(fifo_io_rx_bits),
    .io_ip_txwm(fifo_io_ip_txwm),
    .io_ip_rxwm(fifo_io_ip_rxwm),
    ._GEN_2_0(fifo__GEN_2_0),
    ._GEN_2_1(fifo__GEN_2_1),
    ._GEN_8_0(fifo__GEN_8_0),
    ._GEN_5_0(fifo__GEN_5_0),
    ._GEN_2_2(fifo__GEN_2_2),
    ._GEN_8_1(fifo__GEN_8_1),
    ._GEN_8_2(fifo__GEN_8_2),
    ._GEN_10_1(fifo__GEN_10_1),
    ._GEN_7_1(fifo__GEN_7_1),
    ._GEN_7_2(fifo__GEN_7_2),
    ._GEN_7_3(fifo__GEN_7_3),
    ._GEN_1_0(fifo__GEN_1_0),
    ._GEN_4_1(fifo__GEN_4_1),
    ._GEN_1_1(fifo__GEN_1_1),
    ._GEN_9_1(fifo__GEN_9_1),
    ._GEN_3_1(fifo__GEN_3_1),
    ._GEN_3_2(fifo__GEN_3_2),
    ._GEN_6_0(fifo__GEN_6_0),
    ._GEN_0_0(fifo__GEN_0_0),
    ._GEN_0_1(fifo__GEN_0_1),
    ._GEN_3_3(fifo__GEN_3_3)
  );
  SPIMedia_1 mac ( // @[TLSPI.scala 61:19:TLSPI.fir@81.4]
    .metaReset(mac_metaReset),
    .clock(mac_clock),
    .reset(mac_reset),
    .io_port_sck(mac_io_port_sck),
    .io_port_dq_0_i(mac_io_port_dq_0_i),
    .io_port_dq_0_o(mac_io_port_dq_0_o),
    .io_port_dq_0_oe(mac_io_port_dq_0_oe),
    .io_port_dq_1_i(mac_io_port_dq_1_i),
    .io_port_dq_1_o(mac_io_port_dq_1_o),
    .io_port_dq_1_oe(mac_io_port_dq_1_oe),
    .io_port_dq_2_i(mac_io_port_dq_2_i),
    .io_port_dq_2_o(mac_io_port_dq_2_o),
    .io_port_dq_2_oe(mac_io_port_dq_2_oe),
    .io_port_dq_3_i(mac_io_port_dq_3_i),
    .io_port_dq_3_o(mac_io_port_dq_3_o),
    .io_port_dq_3_oe(mac_io_port_dq_3_oe),
    .io_port_cs_0(mac_io_port_cs_0),
    .io_port_cs_1(mac_io_port_cs_1),
    .io_port_cs_2(mac_io_port_cs_2),
    .io_port_cs_3(mac_io_port_cs_3),
    .io_ctrl_sck_div(mac_io_ctrl_sck_div),
    .io_ctrl_sck_pol(mac_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(mac_io_ctrl_sck_pha),
    .io_ctrl_dla_cssck(mac_io_ctrl_dla_cssck),
    .io_ctrl_dla_sckcs(mac_io_ctrl_dla_sckcs),
    .io_ctrl_dla_intercs(mac_io_ctrl_dla_intercs),
    .io_ctrl_dla_interxfr(mac_io_ctrl_dla_interxfr),
    .io_ctrl_cs_id(mac_io_ctrl_cs_id),
    .io_ctrl_cs_dflt_0(mac_io_ctrl_cs_dflt_0),
    .io_ctrl_cs_dflt_1(mac_io_ctrl_cs_dflt_1),
    .io_ctrl_cs_dflt_2(mac_io_ctrl_cs_dflt_2),
    .io_ctrl_cs_dflt_3(mac_io_ctrl_cs_dflt_3),
    .io_link_tx_ready(mac_io_link_tx_ready),
    .io_link_tx_valid(mac_io_link_tx_valid),
    .io_link_tx_bits(mac_io_link_tx_bits),
    .io_link_rx_valid(mac_io_link_rx_valid),
    .io_link_rx_bits(mac_io_link_rx_bits),
    .io_link_cnt(mac_io_link_cnt),
    .io_link_fmt_proto(mac_io_link_fmt_proto),
    .io_link_fmt_endian(mac_io_link_fmt_endian),
    .io_link_fmt_iodir(mac_io_link_fmt_iodir),
    .io_link_cs_set(mac_io_link_cs_set),
    .io_link_cs_clear(mac_io_link_cs_clear),
    ._GEN_14_0(mac__GEN_14_0),
    ._GEN_95_0(mac__GEN_95_0),
    ._GEN_80_0(mac__GEN_80_0),
    ._GEN_80_1(mac__GEN_80_1),
    ._GEN_73_0(mac__GEN_73_0),
    ._GEN_74_0(mac__GEN_74_0),
    ._GEN_58_0(mac__GEN_58_0),
    ._GEN_68_0(mac__GEN_68_0),
    ._GEN_66_0(mac__GEN_66_0),
    ._GEN_4_0(mac__GEN_4_0),
    ._GEN_61_1(mac__GEN_61_1),
    ._GEN_130_0(mac__GEN_130_0),
    ._GEN_140(mac__GEN_140),
    ._GEN_130_1(mac__GEN_130_1),
    ._GEN_124_1(mac__GEN_124_1),
    ._GEN_39_0(mac__GEN_39_0),
    ._GEN_124_2(mac__GEN_124_2),
    ._GEN_77_0(mac__GEN_77_0),
    ._GEN_112_1(mac__GEN_112_1),
    ._GEN_106_1(mac__GEN_106_1),
    ._GEN_133_1(mac__GEN_133_1),
    ._GEN_118_2(mac__GEN_118_2),
    ._GEN_127_1(mac__GEN_127_1),
    ._GEN_133_2(mac__GEN_133_2),
    ._GEN_127_2(mac__GEN_127_2),
    ._GEN_143(mac__GEN_143),
    ._GEN_112_2(mac__GEN_112_2),
    ._GEN_106_2(mac__GEN_106_2),
    ._GEN_88_0(mac__GEN_88_0),
    ._GEN_94_1(mac__GEN_94_1),
    ._GEN_79_0(mac__GEN_79_0),
    ._GEN_121_2(mac__GEN_121_2),
    ._GEN_100_1(mac__GEN_100_1),
    ._GEN_79_1(mac__GEN_79_1),
    ._GEN_136_0(mac__GEN_136_0),
    ._GEN_115_2(mac__GEN_115_2),
    ._GEN_100_2(mac__GEN_100_2),
    ._GEN_121_3(mac__GEN_121_3),
    ._GEN_136_1(mac__GEN_136_1),
    ._GEN_94_2(mac__GEN_94_2),
    ._GEN_115_3(mac__GEN_115_3),
    ._GEN_103_1(mac__GEN_103_1),
    ._GEN_97_1(mac__GEN_97_1),
    ._GEN_88_1(mac__GEN_88_1),
    ._GEN_82_0(mac__GEN_82_0),
    ._GEN_97_2(mac__GEN_97_2),
    ._GEN_109_2(mac__GEN_109_2),
    ._GEN_60_0(mac__GEN_60_0),
    ._GEN_82_1(mac__GEN_82_1),
    ._GEN_109_3(mac__GEN_109_3),
    ._GEN_118_3(mac__GEN_118_3),
    ._GEN_76_0(mac__GEN_76_0),
    ._GEN_76_1(mac__GEN_76_1),
    ._GEN_103_2(mac__GEN_103_2),
    ._GEN_91_1(mac__GEN_91_1),
    ._GEN_142_0(mac__GEN_142_0),
    ._GEN_69_0(mac__GEN_69_0),
    ._GEN_70_1(mac__GEN_70_1),
    ._GEN_91_2(mac__GEN_91_2),
    ._GEN_85_0(mac__GEN_85_0),
    ._GEN_85_1(mac__GEN_85_1),
    ._GEN_57_0(mac__GEN_57_0),
    ._GEN_61_2(mac__GEN_61_2),
    ._GEN_63_1(mac__GEN_63_1),
    ._GEN_72_0(mac__GEN_72_0),
    ._GEN_73_2(mac__GEN_73_2),
    ._GEN_67_0(mac__GEN_67_0),
    ._GEN_135_1(mac__GEN_135_1),
    ._GEN_65_0(mac__GEN_65_0),
    ._GEN_135_2(mac__GEN_135_2),
    ._GEN_11_0(mac__GEN_11_0),
    ._GEN_129_1(mac__GEN_129_1),
    ._GEN_108_1(mac__GEN_108_1),
    ._GEN_117_2(mac__GEN_117_2),
    ._GEN_117_3(mac__GEN_117_3),
    ._GEN_139_0(mac__GEN_139_0),
    ._GEN_123_1(mac__GEN_123_1),
    ._GEN_129_2(mac__GEN_129_2),
    ._GEN_138_0(mac__GEN_138_0),
    ._GEN_21_1(mac__GEN_21_1),
    ._GEN_123_2(mac__GEN_123_2),
    ._GEN_105_2(mac__GEN_105_2),
    ._GEN_126_1(mac__GEN_126_1),
    ._GEN_111_2(mac__GEN_111_2),
    ._GEN_111_3(mac__GEN_111_3),
    ._GEN_126_2(mac__GEN_126_2),
    ._GEN_105_3(mac__GEN_105_3),
    ._GEN_132_1(mac__GEN_132_1),
    ._GEN_132_2(mac__GEN_132_2),
    ._GEN_90_0(mac__GEN_90_0),
    ._GEN_90_1(mac__GEN_90_1),
    ._GEN_71_0(mac__GEN_71_0),
    ._GEN_108_3(mac__GEN_108_3),
    ._GEN_99_2(mac__GEN_99_2),
    ._GEN_99_3(mac__GEN_99_3),
    ._GEN_93_0(mac__GEN_93_0),
    ._GEN_87_1(mac__GEN_87_1),
    ._GEN_120_2(mac__GEN_120_2),
    ._GEN_114_2(mac__GEN_114_2),
    ._GEN_78_0(mac__GEN_78_0),
    ._GEN_72_2(mac__GEN_72_2),
    ._GEN_87_2(mac__GEN_87_2),
    ._GEN_93_1(mac__GEN_93_1),
    ._GEN_120_3(mac__GEN_120_3),
    ._GEN_114_3(mac__GEN_114_3),
    ._GEN_102_2(mac__GEN_102_2),
    ._GEN_75_1(mac__GEN_75_1),
    ._GEN_75_2(mac__GEN_75_2),
    ._GEN_102_3(mac__GEN_102_3),
    ._GEN_96_2(mac__GEN_96_2),
    ._GEN_59_1(mac__GEN_59_1),
    ._GEN_96_3(mac__GEN_96_3),
    ._GEN_81_0(mac__GEN_81_0),
    ._GEN_20_1(mac__GEN_20_1),
    ._GEN_81_1(mac__GEN_81_1),
    ._GEN_68_1(mac__GEN_68_1),
    ._GEN_131_0(mac__GEN_131_0),
    ._GEN_78_1(mac__GEN_78_1),
    ._GEN_141_0(mac__GEN_141_0),
    ._GEN_84_0(mac__GEN_84_0),
    ._GEN_69_2(mac__GEN_69_2),
    ._GEN_84_1(mac__GEN_84_1),
    ._GEN_43_1(mac__GEN_43_1),
    ._GEN_62_1(mac__GEN_62_1),
    ._GEN_55_1(mac__GEN_55_1),
    ._GEN_134_1(mac__GEN_134_1),
    ._GEN_144_0(mac__GEN_144_0),
    ._GEN_10_2(mac__GEN_10_2),
    ._GEN_66_2(mac__GEN_66_2),
    ._GEN_119_1(mac__GEN_119_1),
    ._GEN_119_2(mac__GEN_119_2),
    ._GEN_128_1(mac__GEN_128_1),
    ._GEN_134_2(mac__GEN_134_2),
    ._GEN_113_1(mac__GEN_113_1),
    ._GEN_64_0(mac__GEN_64_0),
    ._GEN_137_1(mac__GEN_137_1),
    ._GEN_101_1(mac__GEN_101_1),
    ._GEN_122_2(mac__GEN_122_2),
    ._GEN_122_3(mac__GEN_122_3),
    ._GEN_116_2(mac__GEN_116_2),
    ._GEN_116_3(mac__GEN_116_3),
    ._GEN_128_2(mac__GEN_128_2),
    ._GEN_137_2(mac__GEN_137_2),
    ._GEN_101_2(mac__GEN_101_2),
    ._GEN_95_3(mac__GEN_95_3),
    ._GEN_89_2(mac__GEN_89_2),
    ._GEN_83_2(mac__GEN_83_2),
    ._GEN_104_2(mac__GEN_104_2),
    ._GEN_77_2(mac__GEN_77_2),
    ._GEN_104_3(mac__GEN_104_3),
    ._GEN_125_1(mac__GEN_125_1),
    ._GEN_83_3(mac__GEN_83_3),
    ._GEN_131_2(mac__GEN_131_2),
    ._GEN_89_3(mac__GEN_89_3),
    ._GEN_110_2(mac__GEN_110_2),
    ._GEN_98_2(mac__GEN_98_2),
    ._GEN_110_3(mac__GEN_110_3),
    ._GEN_125_2(mac__GEN_125_2),
    ._GEN_107_2(mac__GEN_107_2),
    ._GEN_113_3(mac__GEN_113_3),
    ._GEN_65_2(mac__GEN_65_2),
    ._GEN_92_1(mac__GEN_92_1),
    ._GEN_70_2(mac__GEN_70_2),
    ._GEN_86_2(mac__GEN_86_2),
    ._GEN_86_3(mac__GEN_86_3),
    ._GEN_92_2(mac__GEN_92_2),
    ._GEN_71_2(mac__GEN_71_2),
    ._GEN_63_2(mac__GEN_63_2),
    ._GEN_98_3(mac__GEN_98_3),
    ._GEN_107_3(mac__GEN_107_3)
  );
  assign TLMonitor_metaReset = metaReset;
  assign fifo_metaReset = metaReset;
  assign mac_metaReset = metaReset;
  assign profilePin_132 = TLMonitor__GEN_32_0;
  assign _GEN_339 = {1'h0,profilePin_132}; // @[:TLSPI.fir@2.2]
  assign profilePin_133 = TLMonitor__GEN_33_0;
  assign _GEN_340 = {_GEN_339,profilePin_133}; // @[:TLSPI.fir@2.2]
  assign _GEN_341 = {_GEN_340,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_135 = TLMonitor__GEN_35_0;
  assign _GEN_342 = {_GEN_341,profilePin_135}; // @[:TLSPI.fir@2.2]
  assign profilePin_136 = TLMonitor__GEN_36_0;
  assign _GEN_343 = {_GEN_342,profilePin_136}; // @[:TLSPI.fir@2.2]
  assign profilePin_137 = TLMonitor__GEN_37_0;
  assign _GEN_344 = {_GEN_343,profilePin_137}; // @[:TLSPI.fir@2.2]
  assign profilePin_138 = TLMonitor__GEN_38_0;
  assign _GEN_345 = {_GEN_344,profilePin_138}; // @[:TLSPI.fir@2.2]
  assign profilePin_139 = TLMonitor__GEN_39_1;
  assign _GEN_346 = {_GEN_345,profilePin_139}; // @[:TLSPI.fir@2.2]
  assign profilePin_140 = TLMonitor__GEN_40_0;
  assign _GEN_347 = {_GEN_346,profilePin_140}; // @[:TLSPI.fir@2.2]
  assign _GEN_348 = {_GEN_347,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_142 = TLMonitor__GEN_42_0;
  assign _GEN_349 = {_GEN_348,profilePin_142}; // @[:TLSPI.fir@2.2]
  assign profilePin_143 = TLMonitor__GEN_43_0;
  assign _GEN_350 = {_GEN_349,profilePin_143}; // @[:TLSPI.fir@2.2]
  assign profilePin_144 = TLMonitor__GEN_45_0;
  assign _GEN_351 = {_GEN_350,profilePin_144}; // @[:TLSPI.fir@2.2]
  assign profilePin_145 = TLMonitor__GEN_46_0;
  assign _GEN_352 = {_GEN_351,profilePin_145}; // @[:TLSPI.fir@2.2]
  assign profilePin_146 = TLMonitor__GEN_47_0;
  assign _GEN_353 = {_GEN_352,profilePin_146}; // @[:TLSPI.fir@2.2]
  assign profilePin_147 = TLMonitor__GEN_48_0;
  assign _GEN_354 = {_GEN_353,profilePin_147}; // @[:TLSPI.fir@2.2]
  assign _GEN_355 = {_GEN_354,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_149 = TLMonitor__GEN_50_0;
  assign _GEN_356 = {_GEN_355,profilePin_149}; // @[:TLSPI.fir@2.2]
  assign profilePin_150 = TLMonitor__GEN_51_0;
  assign _GEN_357 = {_GEN_356,profilePin_150}; // @[:TLSPI.fir@2.2]
  assign profilePin_151 = TLMonitor__GEN_53_0;
  assign _GEN_358 = {_GEN_357,profilePin_151}; // @[:TLSPI.fir@2.2]
  assign profilePin_152 = TLMonitor__GEN_54_0;
  assign _GEN_359 = {_GEN_358,profilePin_152}; // @[:TLSPI.fir@2.2]
  assign _GEN_360 = {_GEN_359,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_154 = TLMonitor__GEN_56_0;
  assign _GEN_361 = {_GEN_360,profilePin_154}; // @[:TLSPI.fir@2.2]
  assign profilePin_155 = TLMonitor__GEN_57_1;
  assign _GEN_362 = {_GEN_361,profilePin_155}; // @[:TLSPI.fir@2.2]
  assign profilePin_156 = TLMonitor__GEN_58_1;
  assign _GEN_363 = {_GEN_362,profilePin_156}; // @[:TLSPI.fir@2.2]
  assign profilePin_157 = TLMonitor__GEN_59_0;
  assign _GEN_364 = {_GEN_363,profilePin_157}; // @[:TLSPI.fir@2.2]
  assign _GEN_365 = {_GEN_364,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_159 = TLMonitor__GEN_62_0;
  assign _GEN_366 = {_GEN_365,profilePin_159}; // @[:TLSPI.fir@2.2]
  assign profilePin_160 = TLMonitor__GEN_63_0;
  assign _GEN_367 = {_GEN_366,profilePin_160}; // @[:TLSPI.fir@2.2]
  assign profilePin_161 = TLMonitor__GEN_64_1;
  assign _GEN_368 = {_GEN_367,profilePin_161}; // @[:TLSPI.fir@2.2]
  assign profilePin_162 = TLMonitor__GEN_65_1;
  assign _GEN_369 = {_GEN_368,profilePin_162}; // @[:TLSPI.fir@2.2]
  assign _GEN_370 = {_GEN_369,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_164 = TLMonitor__GEN_67_1;
  assign _GEN_371 = {_GEN_370,profilePin_164}; // @[:TLSPI.fir@2.2]
  assign profilePin_165 = TLMonitor__GEN_69_1;
  assign _GEN_372 = {_GEN_371,profilePin_165}; // @[:TLSPI.fir@2.2]
  assign profilePin_166 = TLMonitor__GEN_70_0;
  assign _GEN_373 = {_GEN_372,profilePin_166}; // @[:TLSPI.fir@2.2]
  assign profilePin_167 = TLMonitor__GEN_71_1;
  assign _GEN_374 = {_GEN_373,profilePin_167}; // @[:TLSPI.fir@2.2]
  assign _GEN_375 = {_GEN_374,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_169 = TLMonitor__GEN_73_1;
  assign _GEN_376 = {_GEN_375,profilePin_169}; // @[:TLSPI.fir@2.2]
  assign profilePin_170 = TLMonitor__GEN_74_1;
  assign _GEN_377 = {_GEN_376,profilePin_170}; // @[:TLSPI.fir@2.2]
  assign profilePin_171 = TLMonitor__GEN_75_0;
  assign _GEN_378 = {_GEN_377,profilePin_171}; // @[:TLSPI.fir@2.2]
  assign profilePin_172 = TLMonitor__GEN_77_1;
  assign _GEN_379 = {_GEN_378,profilePin_172}; // @[:TLSPI.fir@2.2]
  assign _GEN_380 = {_GEN_379,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_174 = TLMonitor__GEN_79_2;
  assign _GEN_381 = {_GEN_380,profilePin_174}; // @[:TLSPI.fir@2.2]
  assign profilePin_175 = TLMonitor__GEN_80_2;
  assign _GEN_382 = {_GEN_381,profilePin_175}; // @[:TLSPI.fir@2.2]
  assign profilePin_176 = TLMonitor__GEN_81_2;
  assign _GEN_383 = {_GEN_382,profilePin_176}; // @[:TLSPI.fir@2.2]
  assign _GEN_384 = {_GEN_383,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_385 = {_GEN_384,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_179 = TLMonitor__GEN_85_3;
  assign _GEN_386 = {_GEN_385,profilePin_179}; // @[:TLSPI.fir@2.2]
  assign _GEN_387 = {_GEN_386,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_388 = {_GEN_387,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_389 = {_GEN_388,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_183 = TLMonitor__GEN_89_1;
  assign _GEN_390 = {_GEN_389,profilePin_183}; // @[:TLSPI.fir@2.2]
  assign _GEN_391 = {_GEN_390,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_392 = {_GEN_391,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_393 = {_GEN_392,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_187 = TLMonitor__GEN_96_0;
  assign _GEN_394 = {_GEN_393,profilePin_187}; // @[:TLSPI.fir@2.2]
  assign _GEN_395 = {_GEN_394,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_396 = {_GEN_395,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_397 = {_GEN_396,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_398 = {_GEN_397,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_399 = {_GEN_398,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_400 = {_GEN_399,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_401 = {_GEN_400,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_402 = {_GEN_401,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_403 = {_GEN_402,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_404 = {_GEN_403,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_405 = {_GEN_404,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_199 = TLMonitor__GEN_108_0;
  assign _GEN_406 = {_GEN_405,profilePin_199}; // @[:TLSPI.fir@2.2]
  assign profilePin_200 = TLMonitor__GEN_109_0;
  assign _GEN_407 = {_GEN_406,profilePin_200}; // @[:TLSPI.fir@2.2]
  assign profilePin_201 = TLMonitor__GEN_110_1;
  assign _GEN_408 = {_GEN_407,profilePin_201}; // @[:TLSPI.fir@2.2]
  assign profilePin_202 = TLMonitor__GEN_111_1;
  assign _GEN_409 = {_GEN_408,profilePin_202}; // @[:TLSPI.fir@2.2]
  assign profilePin_203 = TLMonitor__GEN_112_0;
  assign _GEN_410 = {_GEN_409,profilePin_203}; // @[:TLSPI.fir@2.2]
  assign profilePin_204 = TLMonitor__GEN_113_0;
  assign _GEN_411 = {_GEN_410,profilePin_204}; // @[:TLSPI.fir@2.2]
  assign profilePin_205 = TLMonitor__GEN_114_0;
  assign _GEN_412 = {_GEN_411,profilePin_205}; // @[:TLSPI.fir@2.2]
  assign profilePin_206 = TLMonitor__GEN_115_0;
  assign _GEN_413 = {_GEN_412,profilePin_206}; // @[:TLSPI.fir@2.2]
  assign _GEN_414 = {_GEN_413,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_208 = TLMonitor__GEN_117_1;
  assign _GEN_415 = {_GEN_414,profilePin_208}; // @[:TLSPI.fir@2.2]
  assign profilePin_209 = TLMonitor__GEN_118_0;
  assign _GEN_416 = {_GEN_415,profilePin_209}; // @[:TLSPI.fir@2.2]
  assign _GEN_417 = {_GEN_416,1'h0}; // @[:TLSPI.fir@2.2]
  assign _GEN_418 = {_GEN_417,1'h0}; // @[:TLSPI.fir@2.2]
  assign profilePin_212 = TLMonitor__GEN_121_1;
  assign _GEN_419 = {_GEN_418,profilePin_212}; // @[:TLSPI.fir@2.2]
  assign profilePin_213 = TLMonitor__GEN_122_1;
  assign _GEN_420 = {_GEN_419,profilePin_213}; // @[:TLSPI.fir@2.2]
  assign profilePin = auto_r_in_a_bits_mask[0]; // @[Bitwise.scala 27:51:TLSPI.fir@219.4]
  assign profilePin_0 = auto_r_in_a_bits_mask[1]; // @[Bitwise.scala 27:51:TLSPI.fir@220.4]
  assign _GEN_746 = {profilePin,profilePin_0}; // @[:TLSPI.fir@2.2]
  assign profilePin_1 = auto_r_in_a_bits_mask[2]; // @[Bitwise.scala 27:51:TLSPI.fir@221.4]
  assign _GEN_747 = {_GEN_746,profilePin_1}; // @[:TLSPI.fir@2.2]
  assign profilePin_2 = auto_r_in_a_bits_mask[3]; // @[Bitwise.scala 27:51:TLSPI.fir@222.4]
  assign _GEN_748 = {_GEN_747,profilePin_2}; // @[:TLSPI.fir@2.2]
  assign _T_2085 = auto_r_in_a_valid & auto_r_in_d_ready; // @[RegisterRouter.scala 62:24:TLSPI.fir@1197.4]
  assign _T_281 = auto_r_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 55:36:TLSPI.fir@113.4]
  assign _T_2382 = _T_281 == 1'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@1487.4]
  assign _T_2383 = _T_2085 & _T_2382; // @[RegisterRouter.scala 62:24:TLSPI.fir@1488.4]
  assign _T_282 = auto_r_in_a_bits_address[28:2]; // @[Edges.scala 183:34:TLSPI.fir@115.4]
  assign _T_277_bits_index = _T_282[9:0]; // @[RegisterRouter.scala 54:18:TLSPI.fir@111.4]
  assign _T_2007 = _T_277_bits_index[4]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1121.4]
  assign _T_2006 = _T_277_bits_index[3]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1120.4]
  assign _T_2014 = {_T_2007,_T_2006}; // @[Cat.scala 30:58:TLSPI.fir@1128.4]
  assign _T_2005 = _T_277_bits_index[2]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1119.4]
  assign _T_2015 = {_T_2014,_T_2005}; // @[Cat.scala 30:58:TLSPI.fir@1129.4]
  assign _T_2004 = _T_277_bits_index[1]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1118.4]
  assign _T_2003 = _T_277_bits_index[0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1117.4]
  assign _T_2013 = {_T_2004,_T_2003}; // @[Cat.scala 30:58:TLSPI.fir@1127.4]
  assign _T_2016 = {_T_2015,_T_2013}; // @[Cat.scala 30:58:TLSPI.fir@1130.4]
  assign _T_2018 = 32'h1 << _T_2016; // @[OneHot.scala 45:35:TLSPI.fir@1131.4]
  assign _T_2019 = _T_2018[0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1132.4]
  assign _T_2386 = _T_2383 & _T_2019; // @[RegisterRouter.scala 62:24:TLSPI.fir@1491.4]
  assign _T_366 = _T_277_bits_index & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@128.4]
  assign _T_368 = _T_366 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@129.4]
  assign _T_2387 = _T_2386 & _T_368; // @[RegisterRouter.scala 62:24:TLSPI.fir@1492.4]
  assign _T_681 = profilePin_2 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12:TLSPI.fir@230.4]
  assign _T_677 = profilePin_1 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12:TLSPI.fir@228.4]
  assign _T_683 = {_T_681,_T_677}; // @[Cat.scala 30:58:TLSPI.fir@232.4]
  assign _T_673 = profilePin_0 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12:TLSPI.fir@226.4]
  assign _T_669 = profilePin ? 8'hff : 8'h0; // @[Bitwise.scala 72:12:TLSPI.fir@224.4]
  assign _T_682 = {_T_673,_T_669}; // @[Cat.scala 30:58:TLSPI.fir@231.4]
  assign _T_684 = {_T_683,_T_682}; // @[Cat.scala 30:58:TLSPI.fir@233.4]
  assign _T_708 = _T_684[11:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@249.4]
  assign _T_712 = ~ _T_708; // @[RegisterRouter.scala 62:24:TLSPI.fir@252.4]
  assign _T_714 = _T_712 == 12'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@253.4]
  assign profilePin_3 = _T_2387 & _T_714; // @[RegisterRouter.scala 62:24:TLSPI.fir@261.4]
  assign _GEN_749 = {_GEN_748,profilePin_3}; // @[:TLSPI.fir@2.2]
  assign _T_2024 = _T_2018[5]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1137.4]
  assign _T_2426 = _T_2383 & _T_2024; // @[RegisterRouter.scala 62:24:TLSPI.fir@1530.4]
  assign _T_374 = _T_277_bits_index ^ 10'h5; // @[RegisterRouter.scala 62:24:TLSPI.fir@133.4]
  assign _T_375 = _T_374 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@134.4]
  assign _T_377 = _T_375 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@135.4]
  assign _T_2427 = _T_2426 & _T_377; // @[RegisterRouter.scala 62:24:TLSPI.fir@1531.4]
  assign _T_752 = _T_684[0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@279.4]
  assign _T_756 = ~ _T_752; // @[RegisterRouter.scala 62:24:TLSPI.fir@282.4]
  assign _T_758 = _T_756 == 1'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@283.4]
  assign profilePin_4 = _T_2427 & _T_758; // @[RegisterRouter.scala 62:24:TLSPI.fir@291.4]
  assign _GEN_750 = {_GEN_749,profilePin_4}; // @[:TLSPI.fir@2.2]
  assign _T_796 = _T_684[1]; // @[RegisterRouter.scala 62:24:TLSPI.fir@309.4]
  assign _T_800 = ~ _T_796; // @[RegisterRouter.scala 62:24:TLSPI.fir@312.4]
  assign _T_802 = _T_800 == 1'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@313.4]
  assign profilePin_5 = _T_2427 & _T_802; // @[RegisterRouter.scala 62:24:TLSPI.fir@321.4]
  assign _GEN_751 = {_GEN_750,profilePin_5}; // @[:TLSPI.fir@2.2]
  assign _T_840 = _T_684[2]; // @[RegisterRouter.scala 62:24:TLSPI.fir@339.4]
  assign _T_844 = ~ _T_840; // @[RegisterRouter.scala 62:24:TLSPI.fir@342.4]
  assign _T_846 = _T_844 == 1'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@343.4]
  assign profilePin_6 = _T_2427 & _T_846; // @[RegisterRouter.scala 62:24:TLSPI.fir@351.4]
  assign _GEN_752 = {_GEN_751,profilePin_6}; // @[:TLSPI.fir@2.2]
  assign _T_884 = _T_684[3]; // @[RegisterRouter.scala 62:24:TLSPI.fir@369.4]
  assign _T_888 = ~ _T_884; // @[RegisterRouter.scala 62:24:TLSPI.fir@372.4]
  assign _T_890 = _T_888 == 1'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@373.4]
  assign profilePin_7 = _T_2427 & _T_890; // @[RegisterRouter.scala 62:24:TLSPI.fir@381.4]
  assign _GEN_753 = {_GEN_752,profilePin_7}; // @[:TLSPI.fir@2.2]
  assign _T_2029 = _T_2018[10]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1142.4]
  assign _T_2466 = _T_2383 & _T_2029; // @[RegisterRouter.scala 62:24:TLSPI.fir@1570.4]
  assign _T_383 = _T_277_bits_index ^ 10'ha; // @[RegisterRouter.scala 62:24:TLSPI.fir@139.4]
  assign _T_384 = _T_383 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@140.4]
  assign _T_386 = _T_384 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@141.4]
  assign _T_2467 = _T_2466 & _T_386; // @[RegisterRouter.scala 62:24:TLSPI.fir@1571.4]
  assign _T_928 = _T_684[7:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@399.4]
  assign _T_932 = ~ _T_928; // @[RegisterRouter.scala 62:24:TLSPI.fir@402.4]
  assign _T_934 = _T_932 == 8'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@403.4]
  assign profilePin_8 = _T_2467 & _T_934; // @[RegisterRouter.scala 62:24:TLSPI.fir@411.4]
  assign _GEN_754 = {_GEN_753,profilePin_8}; // @[:TLSPI.fir@2.2]
  assign _T_972 = _T_684[23:16]; // @[RegisterRouter.scala 62:24:TLSPI.fir@429.4]
  assign _T_976 = ~ _T_972; // @[RegisterRouter.scala 62:24:TLSPI.fir@432.4]
  assign _T_978 = _T_976 == 8'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@433.4]
  assign profilePin_9 = _T_2467 & _T_978; // @[RegisterRouter.scala 62:24:TLSPI.fir@441.4]
  assign _GEN_755 = {_GEN_754,profilePin_9}; // @[:TLSPI.fir@2.2]
  assign _T_2039 = _T_2018[20]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1152.4]
  assign _T_2546 = _T_2383 & _T_2039; // @[RegisterRouter.scala 62:24:TLSPI.fir@1654.4]
  assign _T_392 = _T_277_bits_index ^ 10'h14; // @[RegisterRouter.scala 62:24:TLSPI.fir@145.4]
  assign _T_393 = _T_392 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@146.4]
  assign _T_395 = _T_393 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@147.4]
  assign _T_2547 = _T_2546 & _T_395; // @[RegisterRouter.scala 62:24:TLSPI.fir@1655.4]
  assign _T_1016 = _T_684[3:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@459.4]
  assign _T_1020 = ~ _T_1016; // @[RegisterRouter.scala 62:24:TLSPI.fir@462.4]
  assign _T_1022 = _T_1020 == 4'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@463.4]
  assign profilePin_10 = _T_2547 & _T_1022; // @[RegisterRouter.scala 62:24:TLSPI.fir@471.4]
  assign _GEN_756 = {_GEN_755,profilePin_10}; // @[:TLSPI.fir@2.2]
  assign _T_2020 = _T_2018[1]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1133.4]
  assign _T_2394 = _T_2383 & _T_2020; // @[RegisterRouter.scala 62:24:TLSPI.fir@1499.4]
  assign _T_410 = _T_277_bits_index ^ 10'h1; // @[RegisterRouter.scala 62:24:TLSPI.fir@157.4]
  assign _T_411 = _T_410 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@158.4]
  assign _T_413 = _T_411 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@159.4]
  assign _T_2395 = _T_2394 & _T_413; // @[RegisterRouter.scala 62:24:TLSPI.fir@1500.4]
  assign profilePin_11 = _T_2395 & _T_758; // @[RegisterRouter.scala 62:24:TLSPI.fir@555.4]
  assign _GEN_757 = {_GEN_756,profilePin_11}; // @[:TLSPI.fir@2.2]
  assign profilePin_12 = _T_2395 & _T_802; // @[RegisterRouter.scala 62:24:TLSPI.fir@585.4]
  assign _GEN_758 = {_GEN_757,profilePin_12}; // @[:TLSPI.fir@2.2]
  assign _T_2025 = _T_2018[6]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1138.4]
  assign _T_2434 = _T_2383 & _T_2025; // @[RegisterRouter.scala 62:24:TLSPI.fir@1541.4]
  assign _T_419 = _T_277_bits_index ^ 10'h6; // @[RegisterRouter.scala 62:24:TLSPI.fir@163.4]
  assign _T_420 = _T_419 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@164.4]
  assign _T_422 = _T_420 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@165.4]
  assign _T_2435 = _T_2434 & _T_422; // @[RegisterRouter.scala 62:24:TLSPI.fir@1542.4]
  assign _T_1236 = _T_684[1:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@603.4]
  assign _T_1240 = ~ _T_1236; // @[RegisterRouter.scala 62:24:TLSPI.fir@606.4]
  assign _T_1242 = _T_1240 == 2'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@607.4]
  assign profilePin_13 = _T_2435 & _T_1242; // @[RegisterRouter.scala 62:24:TLSPI.fir@615.4]
  assign _GEN_759 = {_GEN_758,profilePin_13}; // @[:TLSPI.fir@2.2]
  assign _T_2047 = _T_2018[28]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1160.4]
  assign _T_2610 = _T_2383 & _T_2047; // @[RegisterRouter.scala 62:24:TLSPI.fir@1712.4]
  assign _T_428 = _T_277_bits_index ^ 10'h1c; // @[RegisterRouter.scala 62:24:TLSPI.fir@169.4]
  assign _T_429 = _T_428 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@170.4]
  assign _T_431 = _T_429 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@171.4]
  assign _T_2611 = _T_2610 & _T_431; // @[RegisterRouter.scala 62:24:TLSPI.fir@1713.4]
  assign profilePin_14 = _T_2611 & _T_758; // @[RegisterRouter.scala 62:24:TLSPI.fir@645.4]
  assign _GEN_760 = {_GEN_759,profilePin_14}; // @[:TLSPI.fir@2.2]
  assign profilePin_15 = _T_2611 & _T_802; // @[RegisterRouter.scala 62:24:TLSPI.fir@675.4]
  assign _GEN_761 = {_GEN_760,profilePin_15}; // @[:TLSPI.fir@2.2]
  assign _T_2040 = _T_2018[21]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1153.4]
  assign _T_2554 = _T_2383 & _T_2040; // @[RegisterRouter.scala 62:24:TLSPI.fir@1662.4]
  assign _T_437 = _T_277_bits_index ^ 10'h15; // @[RegisterRouter.scala 62:24:TLSPI.fir@175.4]
  assign _T_438 = _T_437 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@176.4]
  assign _T_440 = _T_438 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@177.4]
  assign _T_2555 = _T_2554 & _T_440; // @[RegisterRouter.scala 62:24:TLSPI.fir@1663.4]
  assign profilePin_16 = _T_2555 & _T_1022; // @[RegisterRouter.scala 62:24:TLSPI.fir@705.4]
  assign _GEN_762 = {_GEN_761,profilePin_16}; // @[:TLSPI.fir@2.2]
  assign _T_2035 = _T_2018[16]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1148.4]
  assign _T_2514 = _T_2383 & _T_2035; // @[RegisterRouter.scala 62:24:TLSPI.fir@1616.4]
  assign _T_455 = _T_277_bits_index ^ 10'h10; // @[RegisterRouter.scala 62:24:TLSPI.fir@187.4]
  assign _T_456 = _T_455 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@188.4]
  assign _T_458 = _T_456 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@189.4]
  assign _T_2515 = _T_2514 & _T_458; // @[RegisterRouter.scala 62:24:TLSPI.fir@1617.4]
  assign profilePin_17 = _T_2515 & _T_1242; // @[RegisterRouter.scala 62:24:TLSPI.fir@823.4]
  assign _GEN_763 = {_GEN_762,profilePin_17}; // @[:TLSPI.fir@2.2]
  assign profilePin_18 = _T_2515 & _T_846; // @[RegisterRouter.scala 62:24:TLSPI.fir@853.4]
  assign _GEN_764 = {_GEN_763,profilePin_18}; // @[:TLSPI.fir@2.2]
  assign profilePin_19 = _T_2515 & _T_890; // @[RegisterRouter.scala 62:24:TLSPI.fir@883.4]
  assign _GEN_765 = {_GEN_764,profilePin_19}; // @[:TLSPI.fir@2.2]
  assign _T_1681 = _T_684[19:16]; // @[RegisterRouter.scala 62:24:TLSPI.fir@901.4]
  assign _T_1685 = ~ _T_1681; // @[RegisterRouter.scala 62:24:TLSPI.fir@904.4]
  assign _T_1687 = _T_1685 == 4'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@905.4]
  assign profilePin_20 = _T_2515 & _T_1687; // @[RegisterRouter.scala 62:24:TLSPI.fir@913.4]
  assign _GEN_766 = {_GEN_765,profilePin_20}; // @[:TLSPI.fir@2.2]
  assign _T_2030 = _T_2018[11]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1143.4]
  assign _T_2474 = _T_2383 & _T_2030; // @[RegisterRouter.scala 62:24:TLSPI.fir@1579.4]
  assign _T_464 = _T_277_bits_index ^ 10'hb; // @[RegisterRouter.scala 62:24:TLSPI.fir@193.4]
  assign _T_465 = _T_464 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@194.4]
  assign _T_467 = _T_465 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@195.4]
  assign _T_2475 = _T_2474 & _T_467; // @[RegisterRouter.scala 62:24:TLSPI.fir@1580.4]
  assign profilePin_21 = _T_2475 & _T_934; // @[RegisterRouter.scala 62:24:TLSPI.fir@943.4]
  assign _GEN_767 = {_GEN_766,profilePin_21}; // @[:TLSPI.fir@2.2]
  assign profilePin_22 = _T_2475 & _T_978; // @[RegisterRouter.scala 62:24:TLSPI.fir@973.4]
  assign _GEN_768 = {_GEN_767,profilePin_22}; // @[:TLSPI.fir@2.2]
  assign _T_2023 = _T_2018[4]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1136.4]
  assign _T_2418 = _T_2383 & _T_2023; // @[RegisterRouter.scala 62:24:TLSPI.fir@1522.4]
  assign _T_482 = _T_277_bits_index ^ 10'h4; // @[RegisterRouter.scala 62:24:TLSPI.fir@205.4]
  assign _T_483 = _T_482 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@206.4]
  assign _T_485 = _T_483 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@207.4]
  assign _T_2419 = _T_2418 & _T_485; // @[RegisterRouter.scala 62:24:TLSPI.fir@1523.4]
  assign profilePin_23 = _T_2419 & _T_1242; // @[RegisterRouter.scala 62:24:TLSPI.fir@1085.4]
  assign _GEN_769 = {_GEN_768,profilePin_23}; // @[:TLSPI.fir@2.2]
  assign profilePin_24 = 5'h1 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_770 = {_GEN_769,profilePin_24}; // @[:TLSPI.fir@2.2]
  assign profilePin_25 = 5'h2 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_771 = {_GEN_770,profilePin_25}; // @[:TLSPI.fir@2.2]
  assign profilePin_26 = 5'h3 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_772 = {_GEN_771,profilePin_26}; // @[:TLSPI.fir@2.2]
  assign profilePin_27 = 5'h4 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_773 = {_GEN_772,profilePin_27}; // @[:TLSPI.fir@2.2]
  assign profilePin_28 = 5'h5 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_774 = {_GEN_773,profilePin_28}; // @[:TLSPI.fir@2.2]
  assign profilePin_29 = 5'h6 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_775 = {_GEN_774,profilePin_29}; // @[:TLSPI.fir@2.2]
  assign profilePin_30 = 5'h7 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_776 = {_GEN_775,profilePin_30}; // @[:TLSPI.fir@2.2]
  assign profilePin_31 = 5'h8 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_777 = {_GEN_776,profilePin_31}; // @[:TLSPI.fir@2.2]
  assign profilePin_32 = 5'h9 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_778 = {_GEN_777,profilePin_32}; // @[:TLSPI.fir@2.2]
  assign profilePin_33 = 5'ha == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_779 = {_GEN_778,profilePin_33}; // @[:TLSPI.fir@2.2]
  assign profilePin_34 = 5'hb == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_780 = {_GEN_779,profilePin_34}; // @[:TLSPI.fir@2.2]
  assign profilePin_35 = 5'hc == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_781 = {_GEN_780,profilePin_35}; // @[:TLSPI.fir@2.2]
  assign profilePin_36 = 5'hd == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_782 = {_GEN_781,profilePin_36}; // @[:TLSPI.fir@2.2]
  assign profilePin_37 = 5'he == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_783 = {_GEN_782,profilePin_37}; // @[:TLSPI.fir@2.2]
  assign profilePin_38 = 5'hf == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_784 = {_GEN_783,profilePin_38}; // @[:TLSPI.fir@2.2]
  assign profilePin_39 = 5'h10 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_785 = {_GEN_784,profilePin_39}; // @[:TLSPI.fir@2.2]
  assign profilePin_40 = 5'h11 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_786 = {_GEN_785,profilePin_40}; // @[:TLSPI.fir@2.2]
  assign profilePin_41 = 5'h12 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_787 = {_GEN_786,profilePin_41}; // @[:TLSPI.fir@2.2]
  assign profilePin_42 = 5'h13 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_788 = {_GEN_787,profilePin_42}; // @[:TLSPI.fir@2.2]
  assign profilePin_43 = 5'h14 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_789 = {_GEN_788,profilePin_43}; // @[:TLSPI.fir@2.2]
  assign profilePin_44 = 5'h15 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_790 = {_GEN_789,profilePin_44}; // @[:TLSPI.fir@2.2]
  assign profilePin_45 = 5'h16 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_791 = {_GEN_790,profilePin_45}; // @[:TLSPI.fir@2.2]
  assign profilePin_46 = 5'h17 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_792 = {_GEN_791,profilePin_46}; // @[:TLSPI.fir@2.2]
  assign profilePin_47 = 5'h18 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_793 = {_GEN_792,profilePin_47}; // @[:TLSPI.fir@2.2]
  assign profilePin_48 = 5'h19 == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_794 = {_GEN_793,profilePin_48}; // @[:TLSPI.fir@2.2]
  assign profilePin_49 = 5'h1a == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_795 = {_GEN_794,profilePin_49}; // @[:TLSPI.fir@2.2]
  assign profilePin_50 = 5'h1b == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_796 = {_GEN_795,profilePin_50}; // @[:TLSPI.fir@2.2]
  assign profilePin_51 = 5'h1c == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_797 = {_GEN_796,profilePin_51}; // @[:TLSPI.fir@2.2]
  assign profilePin_52 = 5'h1d == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_798 = {_GEN_797,profilePin_52}; // @[:TLSPI.fir@2.2]
  assign profilePin_53 = 5'h1e == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_799 = {_GEN_798,profilePin_53}; // @[:TLSPI.fir@2.2]
  assign profilePin_54 = 5'h1f == _T_2016; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_800 = {_GEN_799,profilePin_54}; // @[:TLSPI.fir@2.2]
  assign _GEN_801 = {_GEN_800,profilePin_24}; // @[:TLSPI.fir@2.2]
  assign _GEN_802 = {_GEN_801,profilePin_25}; // @[:TLSPI.fir@2.2]
  assign _GEN_803 = {_GEN_802,profilePin_26}; // @[:TLSPI.fir@2.2]
  assign _GEN_804 = {_GEN_803,profilePin_27}; // @[:TLSPI.fir@2.2]
  assign _GEN_805 = {_GEN_804,profilePin_28}; // @[:TLSPI.fir@2.2]
  assign _GEN_806 = {_GEN_805,profilePin_29}; // @[:TLSPI.fir@2.2]
  assign _GEN_807 = {_GEN_806,profilePin_30}; // @[:TLSPI.fir@2.2]
  assign _GEN_808 = {_GEN_807,profilePin_31}; // @[:TLSPI.fir@2.2]
  assign _GEN_809 = {_GEN_808,profilePin_32}; // @[:TLSPI.fir@2.2]
  assign _GEN_810 = {_GEN_809,profilePin_33}; // @[:TLSPI.fir@2.2]
  assign _GEN_811 = {_GEN_810,profilePin_34}; // @[:TLSPI.fir@2.2]
  assign _GEN_812 = {_GEN_811,profilePin_35}; // @[:TLSPI.fir@2.2]
  assign _GEN_813 = {_GEN_812,profilePin_36}; // @[:TLSPI.fir@2.2]
  assign _GEN_814 = {_GEN_813,profilePin_37}; // @[:TLSPI.fir@2.2]
  assign _GEN_815 = {_GEN_814,profilePin_38}; // @[:TLSPI.fir@2.2]
  assign _GEN_816 = {_GEN_815,profilePin_39}; // @[:TLSPI.fir@2.2]
  assign _GEN_817 = {_GEN_816,profilePin_40}; // @[:TLSPI.fir@2.2]
  assign _GEN_818 = {_GEN_817,profilePin_41}; // @[:TLSPI.fir@2.2]
  assign _GEN_819 = {_GEN_818,profilePin_42}; // @[:TLSPI.fir@2.2]
  assign _GEN_820 = {_GEN_819,profilePin_43}; // @[:TLSPI.fir@2.2]
  assign _GEN_821 = {_GEN_820,profilePin_44}; // @[:TLSPI.fir@2.2]
  assign _GEN_822 = {_GEN_821,profilePin_45}; // @[:TLSPI.fir@2.2]
  assign _GEN_823 = {_GEN_822,profilePin_46}; // @[:TLSPI.fir@2.2]
  assign _GEN_824 = {_GEN_823,profilePin_47}; // @[:TLSPI.fir@2.2]
  assign _GEN_825 = {_GEN_824,profilePin_48}; // @[:TLSPI.fir@2.2]
  assign _GEN_826 = {_GEN_825,profilePin_49}; // @[:TLSPI.fir@2.2]
  assign _GEN_827 = {_GEN_826,profilePin_50}; // @[:TLSPI.fir@2.2]
  assign _GEN_828 = {_GEN_827,profilePin_51}; // @[:TLSPI.fir@2.2]
  assign _GEN_829 = {_GEN_828,profilePin_52}; // @[:TLSPI.fir@2.2]
  assign _GEN_830 = {_GEN_829,profilePin_53}; // @[:TLSPI.fir@2.2]
  assign _GEN_831 = {_GEN_830,profilePin_54}; // @[:TLSPI.fir@2.2]
  assign _T_401 = _T_277_bits_index ^ 10'h1d; // @[RegisterRouter.scala 62:24:TLSPI.fir@151.4]
  assign _T_402 = _T_401 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@152.4]
  assign _T_404 = _T_402 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@153.4]
  assign _T_473 = _T_277_bits_index ^ 10'h13; // @[RegisterRouter.scala 62:24:TLSPI.fir@199.4]
  assign _T_474 = _T_473 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@200.4]
  assign _T_476 = _T_474 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@201.4]
  assign _T_446 = _T_277_bits_index ^ 10'h12; // @[RegisterRouter.scala 62:24:TLSPI.fir@181.4]
  assign _T_447 = _T_446 & 10'h3e0; // @[RegisterRouter.scala 62:24:TLSPI.fir@182.4]
  assign _T_449 = _T_447 == 10'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@183.4]
  assign _GEN_150 = profilePin_24 ? _T_413 : _T_368; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_151 = profilePin_25 ? 1'h1 : _GEN_150; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_152 = profilePin_26 ? 1'h1 : _GEN_151; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_153 = profilePin_27 ? _T_485 : _GEN_152; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_154 = profilePin_28 ? _T_377 : _GEN_153; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_155 = profilePin_29 ? _T_422 : _GEN_154; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_156 = profilePin_30 ? 1'h1 : _GEN_155; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_157 = profilePin_31 ? 1'h1 : _GEN_156; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_158 = profilePin_32 ? 1'h1 : _GEN_157; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_159 = profilePin_33 ? _T_386 : _GEN_158; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_160 = profilePin_34 ? _T_467 : _GEN_159; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_161 = profilePin_35 ? 1'h1 : _GEN_160; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_162 = profilePin_36 ? 1'h1 : _GEN_161; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_163 = profilePin_37 ? 1'h1 : _GEN_162; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_164 = profilePin_38 ? 1'h1 : _GEN_163; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_165 = profilePin_39 ? _T_458 : _GEN_164; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_166 = profilePin_40 ? 1'h1 : _GEN_165; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_167 = profilePin_41 ? _T_449 : _GEN_166; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_168 = profilePin_42 ? _T_476 : _GEN_167; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_169 = profilePin_43 ? _T_395 : _GEN_168; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_170 = profilePin_44 ? _T_440 : _GEN_169; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_171 = profilePin_45 ? 1'h1 : _GEN_170; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_172 = profilePin_46 ? 1'h1 : _GEN_171; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_173 = profilePin_47 ? 1'h1 : _GEN_172; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_174 = profilePin_48 ? 1'h1 : _GEN_173; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_175 = profilePin_49 ? 1'h1 : _GEN_174; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_176 = profilePin_50 ? 1'h1 : _GEN_175; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_177 = profilePin_51 ? _T_431 : _GEN_176; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_178 = profilePin_52 ? _T_404 : _GEN_177; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_179 = profilePin_53 ? 1'h1 : _GEN_178; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign profilePin_86 = profilePin_54 ? 1'h1 : _GEN_179; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_832 = {_GEN_831,profilePin_86}; // @[:TLSPI.fir@2.2]
  assign _GEN_833 = {_GEN_832,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_834 = {_GEN_833,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_835 = {_GEN_834,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_836 = {_GEN_835,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_837 = {_GEN_836,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_838 = {_GEN_837,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_839 = {_GEN_838,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_840 = {_GEN_839,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_841 = {_GEN_840,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_842 = {_GEN_841,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_843 = {_GEN_842,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_844 = {_GEN_843,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_845 = {_GEN_844,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_846 = {_GEN_845,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_847 = {_GEN_846,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_848 = {_GEN_847,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_849 = {_GEN_848,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_850 = {_GEN_849,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_851 = {_GEN_850,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_852 = {_GEN_851,reset}; // @[:TLSPI.fir@2.2]
  assign _GEN_853 = {_GEN_852,reset}; // @[:TLSPI.fir@2.2]
  assign profilePin_108 = TLMonitor__GEN_1_2;
  assign _GEN_854 = {_GEN_853,profilePin_108}; // @[:TLSPI.fir@2.2]
  assign profilePin_109 = TLMonitor__GEN_2_3;
  assign _GEN_855 = {_GEN_854,profilePin_109}; // @[:TLSPI.fir@2.2]
  assign profilePin_110 = TLMonitor__GEN_3_0;
  assign _GEN_856 = {_GEN_855,profilePin_110}; // @[:TLSPI.fir@2.2]
  assign profilePin_111 = TLMonitor__GEN_4_2;
  assign _GEN_857 = {_GEN_856,profilePin_111}; // @[:TLSPI.fir@2.2]
  assign profilePin_112 = TLMonitor__GEN_5_1;
  assign _GEN_858 = {_GEN_857,profilePin_112}; // @[:TLSPI.fir@2.2]
  assign profilePin_113 = TLMonitor__GEN_7_0;
  assign _GEN_859 = {_GEN_858,profilePin_113}; // @[:TLSPI.fir@2.2]
  assign profilePin_114 = TLMonitor__GEN_8_3;
  assign _GEN_860 = {_GEN_859,profilePin_114}; // @[:TLSPI.fir@2.2]
  assign profilePin_115 = TLMonitor__GEN_9_0;
  assign _GEN_861 = {_GEN_860,profilePin_115}; // @[:TLSPI.fir@2.2]
  assign profilePin_116 = TLMonitor__GEN_10_0;
  assign _GEN_862 = {_GEN_861,profilePin_116}; // @[:TLSPI.fir@2.2]
  assign profilePin_117 = TLMonitor__GEN_11_1;
  assign _GEN_863 = {_GEN_862,profilePin_117}; // @[:TLSPI.fir@2.2]
  assign profilePin_118 = TLMonitor__GEN_12_0;
  assign _GEN_864 = {_GEN_863,profilePin_118}; // @[:TLSPI.fir@2.2]
  assign profilePin_119 = TLMonitor__GEN_17_0;
  assign _GEN_865 = {_GEN_864,profilePin_119}; // @[:TLSPI.fir@2.2]
  assign profilePin_120 = TLMonitor__GEN_19_0;
  assign _GEN_866 = {_GEN_865,profilePin_120}; // @[:TLSPI.fir@2.2]
  assign profilePin_121 = TLMonitor__GEN_20_0;
  assign _GEN_867 = {_GEN_866,profilePin_121}; // @[:TLSPI.fir@2.2]
  assign profilePin_122 = TLMonitor__GEN_21_0;
  assign _GEN_868 = {_GEN_867,profilePin_122}; // @[:TLSPI.fir@2.2]
  assign profilePin_123 = TLMonitor__GEN_22_0;
  assign _GEN_869 = {_GEN_868,profilePin_123}; // @[:TLSPI.fir@2.2]
  assign profilePin_124 = TLMonitor__GEN_23_0;
  assign _GEN_870 = {_GEN_869,profilePin_124}; // @[:TLSPI.fir@2.2]
  assign profilePin_125 = TLMonitor__GEN_24_0;
  assign _GEN_871 = {_GEN_870,profilePin_125}; // @[:TLSPI.fir@2.2]
  assign profilePin_126 = TLMonitor__GEN_25_0;
  assign _GEN_872 = {_GEN_871,profilePin_126}; // @[:TLSPI.fir@2.2]
  assign profilePin_127 = TLMonitor__GEN_26_0;
  assign _GEN_873 = {_GEN_872,profilePin_127}; // @[:TLSPI.fir@2.2]
  assign profilePin_128 = TLMonitor__GEN_27_0;
  assign _GEN_874 = {_GEN_873,profilePin_128}; // @[:TLSPI.fir@2.2]
  assign profilePin_129 = TLMonitor__GEN_28_0;
  assign _GEN_875 = {_GEN_874,profilePin_129}; // @[:TLSPI.fir@2.2]
  assign profilePin_130 = TLMonitor__GEN_29_0;
  assign _GEN_876 = {_GEN_875,profilePin_130}; // @[:TLSPI.fir@2.2]
  assign profilePin_215 = fifo__GEN_2_0;
  assign _GEN_877 = {_GEN_876,profilePin_215}; // @[:TLSPI.fir@2.2]
  assign profilePin_216 = fifo__GEN_3_1;
  assign _GEN_878 = {_GEN_877,profilePin_216}; // @[:TLSPI.fir@2.2]
  assign profilePin_217 = fifo__GEN_4_1;
  assign _GEN_879 = {_GEN_878,profilePin_217}; // @[:TLSPI.fir@2.2]
  assign profilePin_218 = fifo__GEN_5_0;
  assign _GEN_880 = {_GEN_879,profilePin_218}; // @[:TLSPI.fir@2.2]
  assign profilePin_219 = fifo__GEN_6_0;
  assign _GEN_881 = {_GEN_880,profilePin_219}; // @[:TLSPI.fir@2.2]
  assign profilePin_220 = fifo__GEN_7_3;
  assign _GEN_882 = {_GEN_881,profilePin_220}; // @[:TLSPI.fir@2.2]
  assign profilePin_221 = fifo__GEN_8_0;
  assign _GEN_883 = {_GEN_882,profilePin_221}; // @[:TLSPI.fir@2.2]
  assign profilePin_222 = fifo__GEN_9_1;
  assign _GEN_884 = {_GEN_883,profilePin_222}; // @[:TLSPI.fir@2.2]
  assign profilePin_223 = fifo__GEN_10_1;
  assign _GEN_885 = {_GEN_884,profilePin_223}; // @[:TLSPI.fir@2.2]
  assign profilePin_224 = mac__GEN_4_0;
  assign _GEN_886 = {_GEN_885,profilePin_224}; // @[:TLSPI.fir@2.2]
  assign profilePin_225 = mac__GEN_43_1;
  assign _GEN_887 = {_GEN_886,profilePin_225}; // @[:TLSPI.fir@2.2]
  assign profilePin_226 = mac__GEN_61_2;
  assign _GEN_888 = {_GEN_887,profilePin_226}; // @[:TLSPI.fir@2.2]
  assign profilePin_227 = mac__GEN_63_2;
  assign _GEN_889 = {_GEN_888,profilePin_227}; // @[:TLSPI.fir@2.2]
  assign profilePin_228 = mac__GEN_64_0;
  assign _GEN_890 = {_GEN_889,profilePin_228}; // @[:TLSPI.fir@2.2]
  assign profilePin_229 = mac__GEN_65_0;
  assign _GEN_891 = {_GEN_890,profilePin_229}; // @[:TLSPI.fir@2.2]
  assign profilePin_230 = mac__GEN_66_0;
  assign _GEN_892 = {_GEN_891,profilePin_230}; // @[:TLSPI.fir@2.2]
  assign profilePin_231 = mac__GEN_68_1;
  assign _GEN_893 = {_GEN_892,profilePin_231}; // @[:TLSPI.fir@2.2]
  assign profilePin_232 = mac__GEN_69_0;
  assign _GEN_894 = {_GEN_893,profilePin_232}; // @[:TLSPI.fir@2.2]
  assign profilePin_233 = mac__GEN_70_2;
  assign _GEN_895 = {_GEN_894,profilePin_233}; // @[:TLSPI.fir@2.2]
  assign profilePin_234 = mac__GEN_71_0;
  assign _GEN_896 = {_GEN_895,profilePin_234}; // @[:TLSPI.fir@2.2]
  assign profilePin_235 = mac__GEN_72_0;
  assign _GEN_897 = {_GEN_896,profilePin_235}; // @[:TLSPI.fir@2.2]
  assign profilePin_236 = mac__GEN_73_0;
  assign _GEN_898 = {_GEN_897,profilePin_236}; // @[:TLSPI.fir@2.2]
  assign profilePin_237 = mac__GEN_75_1;
  assign _GEN_899 = {_GEN_898,profilePin_237}; // @[:TLSPI.fir@2.2]
  assign profilePin_238 = mac__GEN_76_1;
  assign _GEN_900 = {_GEN_899,profilePin_238}; // @[:TLSPI.fir@2.2]
  assign profilePin_239 = mac__GEN_77_0;
  assign _GEN_901 = {_GEN_900,profilePin_239}; // @[:TLSPI.fir@2.2]
  assign profilePin_240 = mac__GEN_78_0;
  assign _GEN_902 = {_GEN_901,profilePin_240}; // @[:TLSPI.fir@2.2]
  assign profilePin_241 = mac__GEN_79_1;
  assign _GEN_903 = {_GEN_902,profilePin_241}; // @[:TLSPI.fir@2.2]
  assign profilePin_242 = mac__GEN_80_0;
  assign _GEN_904 = {_GEN_903,profilePin_242}; // @[:TLSPI.fir@2.2]
  assign profilePin_243 = mac__GEN_81_0;
  assign _GEN_905 = {_GEN_904,profilePin_243}; // @[:TLSPI.fir@2.2]
  assign profilePin_244 = mac__GEN_82_0;
  assign _GEN_906 = {_GEN_905,profilePin_244}; // @[:TLSPI.fir@2.2]
  assign profilePin_245 = mac__GEN_83_3;
  assign _GEN_907 = {_GEN_906,profilePin_245}; // @[:TLSPI.fir@2.2]
  assign profilePin_246 = mac__GEN_84_0;
  assign _GEN_908 = {_GEN_907,profilePin_246}; // @[:TLSPI.fir@2.2]
  assign profilePin_247 = mac__GEN_85_0;
  assign _GEN_909 = {_GEN_908,profilePin_247}; // @[:TLSPI.fir@2.2]
  assign profilePin_248 = mac__GEN_86_2;
  assign _GEN_910 = {_GEN_909,profilePin_248}; // @[:TLSPI.fir@2.2]
  assign profilePin_249 = mac__GEN_87_1;
  assign _GEN_911 = {_GEN_910,profilePin_249}; // @[:TLSPI.fir@2.2]
  assign profilePin_250 = mac__GEN_88_1;
  assign _GEN_912 = {_GEN_911,profilePin_250}; // @[:TLSPI.fir@2.2]
  assign profilePin_251 = mac__GEN_89_3;
  assign _GEN_913 = {_GEN_912,profilePin_251}; // @[:TLSPI.fir@2.2]
  assign profilePin_252 = mac__GEN_90_0;
  assign _GEN_914 = {_GEN_913,profilePin_252}; // @[:TLSPI.fir@2.2]
  assign profilePin_253 = mac__GEN_91_2;
  assign _GEN_915 = {_GEN_914,profilePin_253}; // @[:TLSPI.fir@2.2]
  assign profilePin_254 = mac__GEN_92_2;
  assign _GEN_916 = {_GEN_915,profilePin_254}; // @[:TLSPI.fir@2.2]
  assign profilePin_255 = mac__GEN_93_1;
  assign _GEN_917 = {_GEN_916,profilePin_255}; // @[:TLSPI.fir@2.2]
  assign profilePin_256 = mac__GEN_94_2;
  assign _GEN_918 = {_GEN_917,profilePin_256}; // @[:TLSPI.fir@2.2]
  assign profilePin_257 = mac__GEN_95_0;
  assign _GEN_919 = {_GEN_918,profilePin_257}; // @[:TLSPI.fir@2.2]
  assign profilePin_258 = mac__GEN_96_2;
  assign _GEN_920 = {_GEN_919,profilePin_258}; // @[:TLSPI.fir@2.2]
  assign profilePin_259 = mac__GEN_97_1;
  assign _GEN_921 = {_GEN_920,profilePin_259}; // @[:TLSPI.fir@2.2]
  assign profilePin_260 = mac__GEN_98_3;
  assign _GEN_922 = {_GEN_921,profilePin_260}; // @[:TLSPI.fir@2.2]
  assign profilePin_261 = mac__GEN_99_2;
  assign _GEN_923 = {_GEN_922,profilePin_261}; // @[:TLSPI.fir@2.2]
  assign profilePin_262 = mac__GEN_100_2;
  assign _GEN_924 = {_GEN_923,profilePin_262}; // @[:TLSPI.fir@2.2]
  assign profilePin_263 = mac__GEN_101_2;
  assign _GEN_925 = {_GEN_924,profilePin_263}; // @[:TLSPI.fir@2.2]
  assign profilePin_264 = mac__GEN_102_2;
  assign _GEN_926 = {_GEN_925,profilePin_264}; // @[:TLSPI.fir@2.2]
  assign profilePin_265 = mac__GEN_103_2;
  assign _GEN_927 = {_GEN_926,profilePin_265}; // @[:TLSPI.fir@2.2]
  assign profilePin_266 = mac__GEN_104_2;
  assign _GEN_928 = {_GEN_927,profilePin_266}; // @[:TLSPI.fir@2.2]
  assign profilePin_267 = mac__GEN_105_3;
  assign _GEN_929 = {_GEN_928,profilePin_267}; // @[:TLSPI.fir@2.2]
  assign profilePin_268 = mac__GEN_106_2;
  assign _GEN_930 = {_GEN_929,profilePin_268}; // @[:TLSPI.fir@2.2]
  assign profilePin_269 = mac__GEN_107_3;
  assign _GEN_931 = {_GEN_930,profilePin_269}; // @[:TLSPI.fir@2.2]
  assign profilePin_270 = mac__GEN_108_1;
  assign _GEN_932 = {_GEN_931,profilePin_270}; // @[:TLSPI.fir@2.2]
  assign profilePin_271 = mac__GEN_109_2;
  assign _GEN_933 = {_GEN_932,profilePin_271}; // @[:TLSPI.fir@2.2]
  assign profilePin_272 = mac__GEN_110_3;
  assign _GEN_934 = {_GEN_933,profilePin_272}; // @[:TLSPI.fir@2.2]
  assign profilePin_273 = mac__GEN_111_2;
  assign _GEN_935 = {_GEN_934,profilePin_273}; // @[:TLSPI.fir@2.2]
  assign profilePin_274 = mac__GEN_112_1;
  assign _GEN_936 = {_GEN_935,profilePin_274}; // @[:TLSPI.fir@2.2]
  assign profilePin_275 = mac__GEN_113_3;
  assign _GEN_937 = {_GEN_936,profilePin_275}; // @[:TLSPI.fir@2.2]
  assign profilePin_276 = mac__GEN_114_3;
  assign _GEN_938 = {_GEN_937,profilePin_276}; // @[:TLSPI.fir@2.2]
  assign profilePin_277 = mac__GEN_115_3;
  assign _GEN_939 = {_GEN_938,profilePin_277}; // @[:TLSPI.fir@2.2]
  assign profilePin_278 = mac__GEN_116_3;
  assign _GEN_940 = {_GEN_939,profilePin_278}; // @[:TLSPI.fir@2.2]
  assign profilePin_279 = mac__GEN_117_2;
  assign _GEN_941 = {_GEN_940,profilePin_279}; // @[:TLSPI.fir@2.2]
  assign profilePin_280 = mac__GEN_118_2;
  assign _GEN_942 = {_GEN_941,profilePin_280}; // @[:TLSPI.fir@2.2]
  assign profilePin_281 = mac__GEN_119_2;
  assign _GEN_943 = {_GEN_942,profilePin_281}; // @[:TLSPI.fir@2.2]
  assign profilePin_282 = mac__GEN_120_2;
  assign _GEN_944 = {_GEN_943,profilePin_282}; // @[:TLSPI.fir@2.2]
  assign profilePin_283 = mac__GEN_121_2;
  assign _GEN_945 = {_GEN_944,profilePin_283}; // @[:TLSPI.fir@2.2]
  assign profilePin_284 = mac__GEN_122_2;
  assign _GEN_946 = {_GEN_945,profilePin_284}; // @[:TLSPI.fir@2.2]
  assign profilePin_285 = mac__GEN_123_1;
  assign _GEN_947 = {_GEN_946,profilePin_285}; // @[:TLSPI.fir@2.2]
  assign profilePin_286 = mac__GEN_124_1;
  assign _GEN_948 = {_GEN_947,profilePin_286}; // @[:TLSPI.fir@2.2]
  assign profilePin_287 = mac__GEN_125_1;
  assign _GEN_949 = {_GEN_948,profilePin_287}; // @[:TLSPI.fir@2.2]
  assign profilePin_288 = mac__GEN_126_1;
  assign _GEN_950 = {_GEN_949,profilePin_288}; // @[:TLSPI.fir@2.2]
  assign profilePin_289 = mac__GEN_127_1;
  assign _GEN_951 = {_GEN_950,profilePin_289}; // @[:TLSPI.fir@2.2]
  assign profilePin_290 = mac__GEN_128_2;
  assign _GEN_952 = {_GEN_951,profilePin_290}; // @[:TLSPI.fir@2.2]
  assign profilePin_291 = mac__GEN_129_2;
  assign _GEN_953 = {_GEN_952,profilePin_291}; // @[:TLSPI.fir@2.2]
  assign profilePin_292 = mac__GEN_130_0;
  assign _GEN_954 = {_GEN_953,profilePin_292}; // @[:TLSPI.fir@2.2]
  assign profilePin_293 = mac__GEN_131_2;
  assign _GEN_955 = {_GEN_954,profilePin_293}; // @[:TLSPI.fir@2.2]
  assign profilePin_294 = mac__GEN_132_1;
  assign _GEN_956 = {_GEN_955,profilePin_294}; // @[:TLSPI.fir@2.2]
  assign profilePin_295 = mac__GEN_133_2;
  assign _GEN_957 = {_GEN_956,profilePin_295}; // @[:TLSPI.fir@2.2]
  assign profilePin_296 = mac__GEN_134_2;
  assign _GEN_958 = {_GEN_957,profilePin_296}; // @[:TLSPI.fir@2.2]
  assign profilePin_297 = mac__GEN_135_2;
  assign _GEN_959 = {_GEN_958,profilePin_297}; // @[:TLSPI.fir@2.2]
  assign profilePin_298 = mac__GEN_136_0;
  assign _GEN_960 = {_GEN_959,profilePin_298}; // @[:TLSPI.fir@2.2]
  assign profilePin_299 = mac__GEN_137_1;
  assign _GEN_961 = {_GEN_960,profilePin_299}; // @[:TLSPI.fir@2.2]
  assign profilePin_300 = fifo__GEN_0_1;
  assign _GEN_962 = {_GEN_961,profilePin_300}; // @[:TLSPI.fir@2.2]
  assign profilePin_301 = fifo__GEN_1_1;
  assign _GEN_963 = {_GEN_962,profilePin_301}; // @[:TLSPI.fir@2.2]
  assign profilePin_302 = fifo__GEN_2_2;
  assign _GEN_964 = {_GEN_963,profilePin_302}; // @[:TLSPI.fir@2.2]
  assign profilePin_303 = fifo__GEN_3_2;
  assign _GEN_965 = {_GEN_964,profilePin_303}; // @[:TLSPI.fir@2.2]
  assign profilePin_304 = fifo__GEN_7_1;
  assign _GEN_966 = {_GEN_965,profilePin_304}; // @[:TLSPI.fir@2.2]
  assign profilePin_305 = fifo__GEN_8_1;
  assign _GEN_967 = {_GEN_966,profilePin_305}; // @[:TLSPI.fir@2.2]
  assign profilePin_306 = fifo__GEN_0_0;
  assign _GEN_968 = {_GEN_967,profilePin_306}; // @[:TLSPI.fir@2.2]
  assign profilePin_307 = fifo__GEN_1_0;
  assign _GEN_969 = {_GEN_968,profilePin_307}; // @[:TLSPI.fir@2.2]
  assign profilePin_308 = fifo__GEN_2_1;
  assign _GEN_970 = {_GEN_969,profilePin_308}; // @[:TLSPI.fir@2.2]
  assign profilePin_309 = fifo__GEN_3_3;
  assign _GEN_971 = {_GEN_970,profilePin_309}; // @[:TLSPI.fir@2.2]
  assign profilePin_310 = fifo__GEN_7_2;
  assign _GEN_972 = {_GEN_971,profilePin_310}; // @[:TLSPI.fir@2.2]
  assign profilePin_311 = fifo__GEN_8_2;
  assign _GEN_973 = {_GEN_972,profilePin_311}; // @[:TLSPI.fir@2.2]
  assign profilePin_312 = mac__GEN_10_2;
  assign _GEN_974 = {_GEN_973,profilePin_312}; // @[:TLSPI.fir@2.2]
  assign profilePin_313 = mac__GEN_11_0;
  assign _GEN_975 = {_GEN_974,profilePin_313}; // @[:TLSPI.fir@2.2]
  assign profilePin_314 = mac__GEN_14_0;
  assign _GEN_976 = {_GEN_975,profilePin_314}; // @[:TLSPI.fir@2.2]
  assign profilePin_315 = mac__GEN_20_1;
  assign _GEN_977 = {_GEN_976,profilePin_315}; // @[:TLSPI.fir@2.2]
  assign profilePin_316 = mac__GEN_21_1;
  assign _GEN_978 = {_GEN_977,profilePin_316}; // @[:TLSPI.fir@2.2]
  assign profilePin_317 = mac__GEN_39_0;
  assign _GEN_979 = {_GEN_978,profilePin_317}; // @[:TLSPI.fir@2.2]
  assign profilePin_318 = mac__GEN_55_1;
  assign _GEN_980 = {_GEN_979,profilePin_318}; // @[:TLSPI.fir@2.2]
  assign profilePin_319 = mac__GEN_57_0;
  assign _GEN_981 = {_GEN_980,profilePin_319}; // @[:TLSPI.fir@2.2]
  assign profilePin_320 = mac__GEN_58_0;
  assign _GEN_982 = {_GEN_981,profilePin_320}; // @[:TLSPI.fir@2.2]
  assign profilePin_321 = mac__GEN_59_1;
  assign _GEN_983 = {_GEN_982,profilePin_321}; // @[:TLSPI.fir@2.2]
  assign profilePin_322 = mac__GEN_60_0;
  assign _GEN_984 = {_GEN_983,profilePin_322}; // @[:TLSPI.fir@2.2]
  assign profilePin_323 = mac__GEN_61_1;
  assign _GEN_985 = {_GEN_984,profilePin_323}; // @[:TLSPI.fir@2.2]
  assign profilePin_324 = mac__GEN_62_1;
  assign _GEN_986 = {_GEN_985,profilePin_324}; // @[:TLSPI.fir@2.2]
  assign profilePin_325 = mac__GEN_63_1;
  assign _GEN_987 = {_GEN_986,profilePin_325}; // @[:TLSPI.fir@2.2]
  assign profilePin_326 = mac__GEN_65_2;
  assign _GEN_988 = {_GEN_987,profilePin_326}; // @[:TLSPI.fir@2.2]
  assign profilePin_327 = mac__GEN_66_2;
  assign _GEN_989 = {_GEN_988,profilePin_327}; // @[:TLSPI.fir@2.2]
  assign profilePin_328 = mac__GEN_67_0;
  assign _GEN_990 = {_GEN_989,profilePin_328}; // @[:TLSPI.fir@2.2]
  assign profilePin_329 = mac__GEN_68_0;
  assign _GEN_991 = {_GEN_990,profilePin_329}; // @[:TLSPI.fir@2.2]
  assign profilePin_330 = mac__GEN_69_2;
  assign _GEN_992 = {_GEN_991,profilePin_330}; // @[:TLSPI.fir@2.2]
  assign profilePin_331 = mac__GEN_70_1;
  assign _GEN_993 = {_GEN_992,profilePin_331}; // @[:TLSPI.fir@2.2]
  assign profilePin_332 = mac__GEN_71_2;
  assign _GEN_994 = {_GEN_993,profilePin_332}; // @[:TLSPI.fir@2.2]
  assign profilePin_333 = mac__GEN_72_2;
  assign _GEN_995 = {_GEN_994,profilePin_333}; // @[:TLSPI.fir@2.2]
  assign profilePin_334 = mac__GEN_73_2;
  assign _GEN_996 = {_GEN_995,profilePin_334}; // @[:TLSPI.fir@2.2]
  assign profilePin_335 = mac__GEN_74_0;
  assign _GEN_997 = {_GEN_996,profilePin_335}; // @[:TLSPI.fir@2.2]
  assign profilePin_336 = mac__GEN_75_2;
  assign _GEN_998 = {_GEN_997,profilePin_336}; // @[:TLSPI.fir@2.2]
  assign profilePin_337 = mac__GEN_76_0;
  assign _GEN_999 = {_GEN_998,profilePin_337}; // @[:TLSPI.fir@2.2]
  assign profilePin_338 = mac__GEN_77_2;
  assign _GEN_1000 = {_GEN_999,profilePin_338}; // @[:TLSPI.fir@2.2]
  assign profilePin_339 = mac__GEN_78_1;
  assign _GEN_1001 = {_GEN_1000,profilePin_339}; // @[:TLSPI.fir@2.2]
  assign profilePin_340 = mac__GEN_79_0;
  assign _GEN_1002 = {_GEN_1001,profilePin_340}; // @[:TLSPI.fir@2.2]
  assign profilePin_341 = mac__GEN_80_1;
  assign _GEN_1003 = {_GEN_1002,profilePin_341}; // @[:TLSPI.fir@2.2]
  assign profilePin_342 = mac__GEN_81_1;
  assign _GEN_1004 = {_GEN_1003,profilePin_342}; // @[:TLSPI.fir@2.2]
  assign profilePin_343 = mac__GEN_82_1;
  assign _GEN_1005 = {_GEN_1004,profilePin_343}; // @[:TLSPI.fir@2.2]
  assign profilePin_344 = mac__GEN_83_2;
  assign _GEN_1006 = {_GEN_1005,profilePin_344}; // @[:TLSPI.fir@2.2]
  assign profilePin_345 = mac__GEN_84_1;
  assign _GEN_1007 = {_GEN_1006,profilePin_345}; // @[:TLSPI.fir@2.2]
  assign profilePin_346 = mac__GEN_85_1;
  assign _GEN_1008 = {_GEN_1007,profilePin_346}; // @[:TLSPI.fir@2.2]
  assign profilePin_347 = mac__GEN_86_3;
  assign _GEN_1009 = {_GEN_1008,profilePin_347}; // @[:TLSPI.fir@2.2]
  assign profilePin_348 = mac__GEN_87_2;
  assign _GEN_1010 = {_GEN_1009,profilePin_348}; // @[:TLSPI.fir@2.2]
  assign profilePin_349 = mac__GEN_88_0;
  assign _GEN_1011 = {_GEN_1010,profilePin_349}; // @[:TLSPI.fir@2.2]
  assign profilePin_350 = mac__GEN_89_2;
  assign _GEN_1012 = {_GEN_1011,profilePin_350}; // @[:TLSPI.fir@2.2]
  assign profilePin_351 = mac__GEN_90_1;
  assign _GEN_1013 = {_GEN_1012,profilePin_351}; // @[:TLSPI.fir@2.2]
  assign profilePin_352 = mac__GEN_91_1;
  assign _GEN_1014 = {_GEN_1013,profilePin_352}; // @[:TLSPI.fir@2.2]
  assign profilePin_353 = mac__GEN_92_1;
  assign _GEN_1015 = {_GEN_1014,profilePin_353}; // @[:TLSPI.fir@2.2]
  assign profilePin_354 = mac__GEN_93_0;
  assign _GEN_1016 = {_GEN_1015,profilePin_354}; // @[:TLSPI.fir@2.2]
  assign profilePin_355 = mac__GEN_94_1;
  assign _GEN_1017 = {_GEN_1016,profilePin_355}; // @[:TLSPI.fir@2.2]
  assign profilePin_356 = mac__GEN_95_3;
  assign _GEN_1018 = {_GEN_1017,profilePin_356}; // @[:TLSPI.fir@2.2]
  assign profilePin_357 = mac__GEN_96_3;
  assign _GEN_1019 = {_GEN_1018,profilePin_357}; // @[:TLSPI.fir@2.2]
  assign profilePin_358 = mac__GEN_97_2;
  assign _GEN_1020 = {_GEN_1019,profilePin_358}; // @[:TLSPI.fir@2.2]
  assign profilePin_359 = mac__GEN_98_2;
  assign _GEN_1021 = {_GEN_1020,profilePin_359}; // @[:TLSPI.fir@2.2]
  assign profilePin_360 = mac__GEN_99_3;
  assign _GEN_1022 = {_GEN_1021,profilePin_360}; // @[:TLSPI.fir@2.2]
  assign profilePin_361 = mac__GEN_100_1;
  assign _GEN_1023 = {_GEN_1022,profilePin_361}; // @[:TLSPI.fir@2.2]
  assign profilePin_362 = mac__GEN_101_1;
  assign _GEN_1024 = {_GEN_1023,profilePin_362}; // @[:TLSPI.fir@2.2]
  assign profilePin_363 = mac__GEN_102_3;
  assign _GEN_1025 = {_GEN_1024,profilePin_363}; // @[:TLSPI.fir@2.2]
  assign profilePin_364 = mac__GEN_103_1;
  assign _GEN_1026 = {_GEN_1025,profilePin_364}; // @[:TLSPI.fir@2.2]
  assign profilePin_365 = mac__GEN_104_3;
  assign _GEN_1027 = {_GEN_1026,profilePin_365}; // @[:TLSPI.fir@2.2]
  assign profilePin_366 = mac__GEN_105_2;
  assign _GEN_1028 = {_GEN_1027,profilePin_366}; // @[:TLSPI.fir@2.2]
  assign profilePin_367 = mac__GEN_106_1;
  assign _GEN_1029 = {_GEN_1028,profilePin_367}; // @[:TLSPI.fir@2.2]
  assign profilePin_368 = mac__GEN_107_2;
  assign _GEN_1030 = {_GEN_1029,profilePin_368}; // @[:TLSPI.fir@2.2]
  assign profilePin_369 = mac__GEN_108_3;
  assign _GEN_1031 = {_GEN_1030,profilePin_369}; // @[:TLSPI.fir@2.2]
  assign profilePin_370 = mac__GEN_109_3;
  assign _GEN_1032 = {_GEN_1031,profilePin_370}; // @[:TLSPI.fir@2.2]
  assign profilePin_371 = mac__GEN_110_2;
  assign _GEN_1033 = {_GEN_1032,profilePin_371}; // @[:TLSPI.fir@2.2]
  assign profilePin_372 = mac__GEN_111_3;
  assign _GEN_1034 = {_GEN_1033,profilePin_372}; // @[:TLSPI.fir@2.2]
  assign profilePin_373 = mac__GEN_112_2;
  assign _GEN_1035 = {_GEN_1034,profilePin_373}; // @[:TLSPI.fir@2.2]
  assign profilePin_374 = mac__GEN_113_1;
  assign _GEN_1036 = {_GEN_1035,profilePin_374}; // @[:TLSPI.fir@2.2]
  assign profilePin_375 = mac__GEN_114_2;
  assign _GEN_1037 = {_GEN_1036,profilePin_375}; // @[:TLSPI.fir@2.2]
  assign profilePin_376 = mac__GEN_115_2;
  assign _GEN_1038 = {_GEN_1037,profilePin_376}; // @[:TLSPI.fir@2.2]
  assign profilePin_377 = mac__GEN_116_2;
  assign _GEN_1039 = {_GEN_1038,profilePin_377}; // @[:TLSPI.fir@2.2]
  assign profilePin_378 = mac__GEN_117_3;
  assign _GEN_1040 = {_GEN_1039,profilePin_378}; // @[:TLSPI.fir@2.2]
  assign profilePin_379 = mac__GEN_118_3;
  assign _GEN_1041 = {_GEN_1040,profilePin_379}; // @[:TLSPI.fir@2.2]
  assign profilePin_380 = mac__GEN_119_1;
  assign _GEN_1042 = {_GEN_1041,profilePin_380}; // @[:TLSPI.fir@2.2]
  assign profilePin_381 = mac__GEN_120_3;
  assign _GEN_1043 = {_GEN_1042,profilePin_381}; // @[:TLSPI.fir@2.2]
  assign profilePin_382 = mac__GEN_121_3;
  assign _GEN_1044 = {_GEN_1043,profilePin_382}; // @[:TLSPI.fir@2.2]
  assign profilePin_383 = mac__GEN_122_3;
  assign _GEN_1045 = {_GEN_1044,profilePin_383}; // @[:TLSPI.fir@2.2]
  assign profilePin_384 = mac__GEN_123_2;
  assign _GEN_1046 = {_GEN_1045,profilePin_384}; // @[:TLSPI.fir@2.2]
  assign profilePin_385 = mac__GEN_124_2;
  assign _GEN_1047 = {_GEN_1046,profilePin_385}; // @[:TLSPI.fir@2.2]
  assign profilePin_386 = mac__GEN_125_2;
  assign _GEN_1048 = {_GEN_1047,profilePin_386}; // @[:TLSPI.fir@2.2]
  assign profilePin_387 = mac__GEN_126_2;
  assign _GEN_1049 = {_GEN_1048,profilePin_387}; // @[:TLSPI.fir@2.2]
  assign profilePin_388 = mac__GEN_127_2;
  assign _GEN_1050 = {_GEN_1049,profilePin_388}; // @[:TLSPI.fir@2.2]
  assign profilePin_389 = mac__GEN_128_1;
  assign _GEN_1051 = {_GEN_1050,profilePin_389}; // @[:TLSPI.fir@2.2]
  assign profilePin_390 = mac__GEN_129_1;
  assign _GEN_1052 = {_GEN_1051,profilePin_390}; // @[:TLSPI.fir@2.2]
  assign profilePin_391 = mac__GEN_130_1;
  assign _GEN_1053 = {_GEN_1052,profilePin_391}; // @[:TLSPI.fir@2.2]
  assign profilePin_392 = mac__GEN_131_0;
  assign _GEN_1054 = {_GEN_1053,profilePin_392}; // @[:TLSPI.fir@2.2]
  assign profilePin_393 = mac__GEN_132_2;
  assign _GEN_1055 = {_GEN_1054,profilePin_393}; // @[:TLSPI.fir@2.2]
  assign profilePin_394 = mac__GEN_133_1;
  assign _GEN_1056 = {_GEN_1055,profilePin_394}; // @[:TLSPI.fir@2.2]
  assign profilePin_395 = mac__GEN_134_1;
  assign _GEN_1057 = {_GEN_1056,profilePin_395}; // @[:TLSPI.fir@2.2]
  assign profilePin_396 = mac__GEN_135_1;
  assign _GEN_1058 = {_GEN_1057,profilePin_396}; // @[:TLSPI.fir@2.2]
  assign profilePin_397 = mac__GEN_136_1;
  assign _GEN_1059 = {_GEN_1058,profilePin_397}; // @[:TLSPI.fir@2.2]
  assign profilePin_398 = mac__GEN_137_2;
  assign _GEN_1060 = {_GEN_1059,profilePin_398}; // @[:TLSPI.fir@2.2]
  assign profilePin_399 = mac__GEN_138_0;
  assign _GEN_1061 = {_GEN_1060,profilePin_399}; // @[:TLSPI.fir@2.2]
  assign profilePin_400 = mac__GEN_139_0;
  assign _GEN_1062 = {_GEN_1061,profilePin_400}; // @[:TLSPI.fir@2.2]
  assign profilePin_401 = mac__GEN_140;
  assign _GEN_1063 = {_GEN_1062,profilePin_401}; // @[:TLSPI.fir@2.2]
  assign profilePin_402 = mac__GEN_141_0;
  assign _GEN_1064 = {_GEN_1063,profilePin_402}; // @[:TLSPI.fir@2.2]
  assign profilePin_403 = mac__GEN_142_0;
  assign _GEN_1065 = {_GEN_1064,profilePin_403}; // @[:TLSPI.fir@2.2]
  assign profilePin_404 = mac__GEN_143;
  assign _GEN_1066 = {_GEN_1065,profilePin_404}; // @[:TLSPI.fir@2.2]
  assign profilePin_405 = mac__GEN_144_0;
  assign _T_261 = fifo_io_ip_txwm & ie_txwm; // @[TLSPI.scala 74:25:TLSPI.fir@102.4]
  assign _T_262 = fifo_io_ip_rxwm & ie_rxwm; // @[TLSPI.scala 74:49:TLSPI.fir@103.4]
  assign _T_269 = fifo_io_tx_ready == 1'h0; // @[RegMapFIFO.scala 24:9:TLSPI.fir@108.4]
  assign _T_272 = fifo_io_rx_valid == 1'h0; // @[RegMapFIFO.scala 45:21:TLSPI.fir@109.4]
  assign _T_283 = {auto_r_in_a_bits_source,auto_r_in_a_bits_size}; // @[Cat.scala 30:58:TLSPI.fir@119.4]
  assign _T_2086 = _T_2085 & _T_281; // @[RegisterRouter.scala 62:24:TLSPI.fir@1198.4]
  assign _T_728 = auto_r_in_a_bits_data[11:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@263.4]
  assign _T_772 = auto_r_in_a_bits_data[0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@293.4]
  assign _T_816 = auto_r_in_a_bits_data[1]; // @[RegisterRouter.scala 62:24:TLSPI.fir@323.4]
  assign _GEN_1068 = {{1'd0}, ctrl_cs_dflt_1}; // @[RegisterRouter.scala 62:24:TLSPI.fir@335.4]
  assign _T_835 = _GEN_1068 << 1; // @[RegisterRouter.scala 62:24:TLSPI.fir@335.4]
  assign _GEN_1069 = {{1'd0}, ctrl_cs_dflt_0}; // @[RegisterRouter.scala 62:24:TLSPI.fir@338.4]
  assign _T_839 = _GEN_1069 | _T_835; // @[RegisterRouter.scala 62:24:TLSPI.fir@338.4]
  assign _T_860 = auto_r_in_a_bits_data[2]; // @[RegisterRouter.scala 62:24:TLSPI.fir@353.4]
  assign _GEN_1070 = {{2'd0}, ctrl_cs_dflt_2}; // @[RegisterRouter.scala 62:24:TLSPI.fir@365.4]
  assign _T_879 = _GEN_1070 << 2; // @[RegisterRouter.scala 62:24:TLSPI.fir@365.4]
  assign _GEN_1071 = {{1'd0}, _T_839}; // @[RegisterRouter.scala 62:24:TLSPI.fir@368.4]
  assign _T_883 = _GEN_1071 | _T_879; // @[RegisterRouter.scala 62:24:TLSPI.fir@368.4]
  assign _T_904 = auto_r_in_a_bits_data[3]; // @[RegisterRouter.scala 62:24:TLSPI.fir@383.4]
  assign _GEN_1072 = {{3'd0}, ctrl_cs_dflt_3}; // @[RegisterRouter.scala 62:24:TLSPI.fir@395.4]
  assign _T_923 = _GEN_1072 << 3; // @[RegisterRouter.scala 62:24:TLSPI.fir@395.4]
  assign _GEN_1073 = {{1'd0}, _T_883}; // @[RegisterRouter.scala 62:24:TLSPI.fir@398.4]
  assign _T_927 = _GEN_1073 | _T_923; // @[RegisterRouter.scala 62:24:TLSPI.fir@398.4]
  assign _T_930 = _T_928 != 8'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@400.4]
  assign _T_948 = auto_r_in_a_bits_data[7:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@413.4]
  assign _T_992 = auto_r_in_a_bits_data[23:16]; // @[RegisterRouter.scala 62:24:TLSPI.fir@443.4]
  assign _GEN_1074 = {{16'd0}, ctrl_dla_sckcs}; // @[RegisterRouter.scala 62:24:TLSPI.fir@455.4]
  assign _T_1011 = _GEN_1074 << 16; // @[RegisterRouter.scala 62:24:TLSPI.fir@455.4]
  assign _GEN_1075 = {{16'd0}, ctrl_dla_cssck}; // @[RegisterRouter.scala 62:24:TLSPI.fir@458.4]
  assign _T_1015 = _GEN_1075 | _T_1011; // @[RegisterRouter.scala 62:24:TLSPI.fir@458.4]
  assign _T_1036 = auto_r_in_a_bits_data[3:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@473.4]
  assign _T_1099 = fifo_io_ip_txwm; // @[RegisterRouter.scala 62:24:TLSPI.fir@512.4]
  assign _GEN_1076 = {{1'd0}, fifo_io_ip_rxwm}; // @[RegisterRouter.scala 62:24:TLSPI.fir@539.4]
  assign _T_1143 = _GEN_1076 << 1; // @[RegisterRouter.scala 62:24:TLSPI.fir@539.4]
  assign _GEN_1077 = {{1'd0}, _T_1099}; // @[RegisterRouter.scala 62:24:TLSPI.fir@542.4]
  assign _T_1147 = _GEN_1077 | _T_1143; // @[RegisterRouter.scala 62:24:TLSPI.fir@542.4]
  assign _GEN_1078 = {{1'd0}, ctrl_sck_pol}; // @[RegisterRouter.scala 62:24:TLSPI.fir@599.4]
  assign _T_1231 = _GEN_1078 << 1; // @[RegisterRouter.scala 62:24:TLSPI.fir@599.4]
  assign _GEN_1079 = {{1'd0}, ctrl_sck_pha}; // @[RegisterRouter.scala 62:24:TLSPI.fir@602.4]
  assign _T_1235 = _GEN_1079 | _T_1231; // @[RegisterRouter.scala 62:24:TLSPI.fir@602.4]
  assign _T_1256 = auto_r_in_a_bits_data[1:0]; // @[RegisterRouter.scala 62:24:TLSPI.fir@617.4]
  assign _GEN_1080 = {{1'd0}, ie_rxwm}; // @[RegisterRouter.scala 62:24:TLSPI.fir@689.4]
  assign _T_1363 = _GEN_1080 << 1; // @[RegisterRouter.scala 62:24:TLSPI.fir@689.4]
  assign _GEN_1081 = {{1'd0}, ie_txwm}; // @[RegisterRouter.scala 62:24:TLSPI.fir@692.4]
  assign _T_1367 = _GEN_1081 | _T_1363; // @[RegisterRouter.scala 62:24:TLSPI.fir@692.4]
  assign _T_2037 = _T_2018[18]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1150.4]
  assign _T_2530 = _T_2383 & _T_2037; // @[RegisterRouter.scala 62:24:TLSPI.fir@1634.4]
  assign _T_2531 = _T_2530 & _T_449; // @[RegisterRouter.scala 62:24:TLSPI.fir@1635.4]
  assign _T_1428 = _T_2531 & _T_934; // @[RegisterRouter.scala 62:24:TLSPI.fir@735.4]
  assign _T_1513 = _T_684[31]; // @[RegisterRouter.scala 62:24:TLSPI.fir@788.4]
  assign _T_1514 = ~ _T_1513; // @[RegisterRouter.scala 62:24:TLSPI.fir@789.4]
  assign _T_1516 = _T_1514 == 1'h0; // @[RegisterRouter.scala 62:24:TLSPI.fir@790.4]
  assign _T_1520 = _T_2531 & _T_1516; // @[RegisterRouter.scala 62:24:TLSPI.fir@794.4]
  assign _T_1523 = auto_r_in_a_bits_data[31]; // @[RegisterRouter.scala 62:24:TLSPI.fir@795.4]
  assign _T_1526 = _T_1520 & _T_1523; // @[RegMapFIFO.scala 26:26:TLSPI.fir@797.4]
  assign _T_1435 = _T_1526 == 1'h0; // @[RegMapFIFO.scala 18:33:TLSPI.fir@738.4]
  assign _GEN_1082 = {{31'd0}, _T_269}; // @[RegisterRouter.scala 62:24:TLSPI.fir@807.4]
  assign _T_1544 = _GEN_1082 << 31; // @[RegisterRouter.scala 62:24:TLSPI.fir@807.4]
  assign _GEN_1083 = {{2'd0}, ctrl_fmt_endian}; // @[RegisterRouter.scala 62:24:TLSPI.fir@867.4]
  assign _T_1632 = _GEN_1083 << 2; // @[RegisterRouter.scala 62:24:TLSPI.fir@867.4]
  assign _GEN_1084 = {{1'd0}, ctrl_fmt_proto}; // @[RegisterRouter.scala 62:24:TLSPI.fir@870.4]
  assign _T_1636 = _GEN_1084 | _T_1632; // @[RegisterRouter.scala 62:24:TLSPI.fir@870.4]
  assign _GEN_1085 = {{3'd0}, ctrl_fmt_iodir}; // @[RegisterRouter.scala 62:24:TLSPI.fir@897.4]
  assign _T_1676 = _GEN_1085 << 3; // @[RegisterRouter.scala 62:24:TLSPI.fir@897.4]
  assign _GEN_1086 = {{1'd0}, _T_1636}; // @[RegisterRouter.scala 62:24:TLSPI.fir@900.4]
  assign _T_1680 = _GEN_1086 | _T_1676; // @[RegisterRouter.scala 62:24:TLSPI.fir@900.4]
  assign _T_1701 = auto_r_in_a_bits_data[19:16]; // @[RegisterRouter.scala 62:24:TLSPI.fir@915.4]
  assign _GEN_1087 = {{16'd0}, ctrl_fmt_len}; // @[RegisterRouter.scala 62:24:TLSPI.fir@927.4]
  assign _T_1720 = _GEN_1087 << 16; // @[RegisterRouter.scala 62:24:TLSPI.fir@927.4]
  assign _GEN_1088 = {{16'd0}, _T_1680}; // @[RegisterRouter.scala 62:24:TLSPI.fir@930.4]
  assign _T_1724 = _GEN_1088 | _T_1720; // @[RegisterRouter.scala 62:24:TLSPI.fir@930.4]
  assign _GEN_1089 = {{16'd0}, ctrl_dla_interxfr}; // @[RegisterRouter.scala 62:24:TLSPI.fir@987.4]
  assign _T_1808 = _GEN_1089 << 16; // @[RegisterRouter.scala 62:24:TLSPI.fir@987.4]
  assign _GEN_1090 = {{16'd0}, ctrl_dla_intercs}; // @[RegisterRouter.scala 62:24:TLSPI.fir@990.4]
  assign _T_1812 = _GEN_1090 | _T_1808; // @[RegisterRouter.scala 62:24:TLSPI.fir@990.4]
  assign _T_2038 = _T_2018[19]; // @[RegisterRouter.scala 62:24:TLSPI.fir@1151.4]
  assign _T_2241 = _T_2086 & _T_2038; // @[RegisterRouter.scala 62:24:TLSPI.fir@1354.4]
  assign _T_2242 = _T_2241 & _T_476; // @[RegisterRouter.scala 62:24:TLSPI.fir@1355.4]
  assign _T_1852 = fifo_io_rx_bits; // @[RegisterRouter.scala 62:24:TLSPI.fir@1015.4]
  assign _T_1900 = {{23'd0}, _T_1852}; // @[RegisterRouter.scala 62:24:TLSPI.fir@1045.4]
  assign _GEN_1091 = {{31'd0}, _T_272}; // @[RegisterRouter.scala 62:24:TLSPI.fir@1069.4]
  assign _T_1940 = _GEN_1091 << 31; // @[RegisterRouter.scala 62:24:TLSPI.fir@1069.4]
  assign _GEN_1092 = {{1'd0}, _T_1900}; // @[RegisterRouter.scala 62:24:TLSPI.fir@1072.4]
  assign _T_1944 = _GEN_1092 | _T_1940; // @[RegisterRouter.scala 62:24:TLSPI.fir@1072.4]
  assign _T_3319_0 = {{20'd0}, ctrl_sck_div}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _T_3319_1 = {{30'd0}, _T_1235}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_182 = profilePin_24 ? _T_3319_1 : _T_3319_0; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_183 = profilePin_25 ? 32'h0 : _GEN_182; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_184 = profilePin_26 ? 32'h0 : _GEN_183; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_4 = {{30'd0}, ctrl_cs_id}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_185 = profilePin_27 ? _T_3319_4 : _GEN_184; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_5 = {{28'd0}, _T_927}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_186 = profilePin_28 ? _T_3319_5 : _GEN_185; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_6 = {{30'd0}, ctrl_cs_mode}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_187 = profilePin_29 ? _T_3319_6 : _GEN_186; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_188 = profilePin_30 ? 32'h0 : _GEN_187; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_189 = profilePin_31 ? 32'h0 : _GEN_188; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_190 = profilePin_32 ? 32'h0 : _GEN_189; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_10 = {{8'd0}, _T_1015}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_191 = profilePin_33 ? _T_3319_10 : _GEN_190; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_11 = {{8'd0}, _T_1812}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_192 = profilePin_34 ? _T_3319_11 : _GEN_191; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_193 = profilePin_35 ? 32'h0 : _GEN_192; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_194 = profilePin_36 ? 32'h0 : _GEN_193; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_195 = profilePin_37 ? 32'h0 : _GEN_194; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_196 = profilePin_38 ? 32'h0 : _GEN_195; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_16 = {{12'd0}, _T_1724}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_197 = profilePin_39 ? _T_3319_16 : _GEN_196; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_198 = profilePin_40 ? 32'h0 : _GEN_197; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_199 = profilePin_41 ? _T_1544 : _GEN_198; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_200 = profilePin_42 ? _T_1944 : _GEN_199; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_20 = {{28'd0}, ctrl_wm_tx}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_201 = profilePin_43 ? _T_3319_20 : _GEN_200; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_21 = {{28'd0}, ctrl_wm_rx}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_202 = profilePin_44 ? _T_3319_21 : _GEN_201; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_203 = profilePin_45 ? 32'h0 : _GEN_202; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_204 = profilePin_46 ? 32'h0 : _GEN_203; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_205 = profilePin_47 ? 32'h0 : _GEN_204; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_206 = profilePin_48 ? 32'h0 : _GEN_205; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_207 = profilePin_49 ? 32'h0 : _GEN_206; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_208 = profilePin_50 ? 32'h0 : _GEN_207; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_28 = {{30'd0}, _T_1367}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_209 = profilePin_51 ? _T_3319_28 : _GEN_208; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _T_3319_29 = {{30'd0}, _T_1147}; // @[RegisterRouter.scala 62:24:TLSPI.fir@2400.4]
  assign _GEN_210 = profilePin_52 ? _T_3319_29 : _GEN_209; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_211 = profilePin_53 ? 32'h0 : _GEN_210; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign _GEN_212 = profilePin_54 ? 32'h0 : _GEN_211; // @[RegisterRouter.scala 62:24:TLSPI.fir@2434.4]
  assign auto_int_out_0 = _T_261 | _T_262;
  assign auto_r_in_a_ready = auto_r_in_d_ready;
  assign auto_r_in_b_valid = 1'h0;
  assign auto_r_in_b_bits_opcode = 3'h0;
  assign auto_r_in_b_bits_param = 2'h0;
  assign auto_r_in_b_bits_size = 2'h0;
  assign auto_r_in_b_bits_source = 7'h0;
  assign auto_r_in_b_bits_address = 29'h0;
  assign auto_r_in_b_bits_mask = 4'h0;
  assign auto_r_in_b_bits_data = 32'h0;
  assign auto_r_in_c_ready = 1'h1;
  assign auto_r_in_d_valid = auto_r_in_a_valid;
  assign auto_r_in_d_bits_opcode = {{2'd0}, _T_281};
  assign auto_r_in_d_bits_param = 2'h0;
  assign auto_r_in_d_bits_size = _T_283[1:0];
  assign auto_r_in_d_bits_source = _T_283[8:2];
  assign auto_r_in_d_bits_sink = 1'h0;
  assign auto_r_in_d_bits_data = profilePin_86 ? _GEN_212 : 32'h0;
  assign auto_r_in_d_bits_error = 1'h0;
  assign auto_r_in_e_ready = 1'h1;
  assign io_port_sck = mac_io_port_sck;
  assign io_port_dq_0_o = mac_io_port_dq_0_o;
  assign io_port_dq_0_oe = mac_io_port_dq_0_oe;
  assign io_port_dq_1_o = mac_io_port_dq_1_o;
  assign io_port_dq_1_oe = mac_io_port_dq_1_oe;
  assign io_port_dq_2_o = mac_io_port_dq_2_o;
  assign io_port_dq_2_oe = mac_io_port_dq_2_oe;
  assign io_port_dq_3_o = mac_io_port_dq_3_o;
  assign io_port_dq_3_oe = mac_io_port_dq_3_oe;
  assign io_port_cs_0 = mac_io_port_cs_0;
  assign io_port_cs_1 = mac_io_port_cs_1;
  assign io_port_cs_2 = mac_io_port_cs_2;
  assign io_port_cs_3 = mac_io_port_cs_3;
  assign assert_out = {_GEN_420,1'h0};
  assign auto_cover_out = {_GEN_1066,profilePin_405};
  assign TLMonitor_clock = clock;
  assign TLMonitor_reset = reset;
  assign TLMonitor_io_in_a_ready = auto_r_in_d_ready;
  assign TLMonitor_io_in_a_valid = auto_r_in_a_valid;
  assign TLMonitor_io_in_a_bits_opcode = auto_r_in_a_bits_opcode;
  assign TLMonitor_io_in_a_bits_param = auto_r_in_a_bits_param;
  assign TLMonitor_io_in_a_bits_size = auto_r_in_a_bits_size;
  assign TLMonitor_io_in_a_bits_source = auto_r_in_a_bits_source;
  assign TLMonitor_io_in_a_bits_address = auto_r_in_a_bits_address;
  assign TLMonitor_io_in_a_bits_mask = auto_r_in_a_bits_mask;
  assign TLMonitor_io_in_c_valid = auto_r_in_c_valid;
  assign TLMonitor_io_in_d_ready = auto_r_in_d_ready;
  assign TLMonitor_io_in_d_valid = auto_r_in_a_valid;
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_281};
  assign TLMonitor_io_in_d_bits_size = _T_283[1:0];
  assign TLMonitor_io_in_d_bits_source = _T_283[8:2];
  assign TLMonitor_io_in_e_valid = auto_r_in_e_valid;
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_ctrl_fmt_proto = ctrl_fmt_proto;
  assign fifo_io_ctrl_fmt_endian = ctrl_fmt_endian;
  assign fifo_io_ctrl_fmt_iodir = ctrl_fmt_iodir;
  assign fifo_io_ctrl_fmt_len = ctrl_fmt_len;
  assign fifo_io_ctrl_cs_mode = ctrl_cs_mode;
  assign fifo_io_ctrl_wm_tx = ctrl_wm_tx;
  assign fifo_io_ctrl_wm_rx = ctrl_wm_rx;
  assign fifo_io_link_tx_ready = mac_io_link_tx_ready;
  assign fifo_io_link_rx_valid = mac_io_link_rx_valid;
  assign fifo_io_link_rx_bits = mac_io_link_rx_bits;
  assign fifo_io_tx_valid = _T_1428 & _T_1435;
  assign fifo_io_tx_bits = auto_r_in_a_bits_data[7:0];
  assign fifo_io_rx_ready = _T_2242 & _T_930;
  assign mac_clock = clock;
  assign mac_reset = reset;
  assign mac_io_port_dq_0_i = io_port_dq_0_i;
  assign mac_io_port_dq_1_i = io_port_dq_1_i;
  assign mac_io_port_dq_2_i = io_port_dq_2_i;
  assign mac_io_port_dq_3_i = io_port_dq_3_i;
  assign mac_io_ctrl_sck_div = ctrl_sck_div;
  assign mac_io_ctrl_sck_pol = ctrl_sck_pol;
  assign mac_io_ctrl_sck_pha = ctrl_sck_pha;
  assign mac_io_ctrl_dla_cssck = ctrl_dla_cssck;
  assign mac_io_ctrl_dla_sckcs = ctrl_dla_sckcs;
  assign mac_io_ctrl_dla_intercs = ctrl_dla_intercs;
  assign mac_io_ctrl_dla_interxfr = ctrl_dla_interxfr;
  assign mac_io_ctrl_cs_id = ctrl_cs_id;
  assign mac_io_ctrl_cs_dflt_0 = ctrl_cs_dflt_0;
  assign mac_io_ctrl_cs_dflt_1 = ctrl_cs_dflt_1;
  assign mac_io_ctrl_cs_dflt_2 = ctrl_cs_dflt_2;
  assign mac_io_ctrl_cs_dflt_3 = ctrl_cs_dflt_3;
  assign mac_io_link_tx_valid = fifo_io_link_tx_valid;
  assign mac_io_link_tx_bits = fifo_io_link_tx_bits;
  assign mac_io_link_cnt = fifo_io_link_cnt;
  assign mac_io_link_fmt_proto = fifo_io_link_fmt_proto;
  assign mac_io_link_fmt_endian = fifo_io_link_fmt_endian;
  assign mac_io_link_fmt_iodir = fifo_io_link_fmt_iodir;
  assign mac_io_link_cs_set = fifo_io_link_cs_set;
  assign mac_io_link_cs_clear = fifo_io_link_cs_clear;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  ctrl_fmt_proto = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  ctrl_fmt_endian = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  ctrl_fmt_iodir = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  ctrl_fmt_len = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  ctrl_sck_div = _RAND_4[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  ctrl_sck_pol = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  ctrl_sck_pha = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  ctrl_cs_id = _RAND_7[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  ctrl_cs_dflt_0 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  ctrl_cs_dflt_1 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  ctrl_cs_dflt_2 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  ctrl_cs_dflt_3 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  ctrl_cs_mode = _RAND_12[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  ctrl_dla_cssck = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  ctrl_dla_sckcs = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  ctrl_dla_intercs = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  ctrl_dla_interxfr = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  ctrl_wm_tx = _RAND_17[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  ctrl_wm_rx = _RAND_18[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  ie_txwm = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  ie_rxwm = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      ctrl_fmt_proto <= 2'h0;
    end else begin
      if (reset) begin
        ctrl_fmt_proto <= 2'h0;
      end else begin
        if (profilePin_17) begin
          ctrl_fmt_proto <= _T_1256;
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_endian <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_fmt_endian <= 1'h0;
      end else begin
        if (profilePin_18) begin
          ctrl_fmt_endian <= _T_860;
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_iodir <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_fmt_iodir <= 1'h0;
      end else begin
        if (profilePin_19) begin
          ctrl_fmt_iodir <= _T_904;
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_len <= 4'h0;
    end else begin
      if (reset) begin
        ctrl_fmt_len <= 4'h8;
      end else begin
        if (profilePin_20) begin
          ctrl_fmt_len <= _T_1701;
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_div <= 12'h0;
    end else begin
      if (reset) begin
        ctrl_sck_div <= 12'h3;
      end else begin
        if (profilePin_3) begin
          ctrl_sck_div <= _T_728;
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_pol <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_sck_pol <= 1'h0;
      end else begin
        if (profilePin_12) begin
          ctrl_sck_pol <= _T_816;
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_pha <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_sck_pha <= 1'h0;
      end else begin
        if (profilePin_11) begin
          ctrl_sck_pha <= _T_772;
        end
      end
    end
    if (metaReset) begin
      ctrl_cs_id <= 2'h0;
    end else begin
      if (reset) begin
        ctrl_cs_id <= 2'h0;
      end else begin
        if (profilePin_23) begin
          ctrl_cs_id <= _T_1256;
        end
      end
    end
    if (metaReset) begin
      ctrl_cs_dflt_0 <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_cs_dflt_0 <= 1'h1;
      end else begin
        if (profilePin_4) begin
          ctrl_cs_dflt_0 <= _T_772;
        end
      end
    end
    if (metaReset) begin
      ctrl_cs_dflt_1 <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_cs_dflt_1 <= 1'h1;
      end else begin
        if (profilePin_5) begin
          ctrl_cs_dflt_1 <= _T_816;
        end
      end
    end
    if (metaReset) begin
      ctrl_cs_dflt_2 <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_cs_dflt_2 <= 1'h1;
      end else begin
        if (profilePin_6) begin
          ctrl_cs_dflt_2 <= _T_860;
        end
      end
    end
    if (metaReset) begin
      ctrl_cs_dflt_3 <= 1'h0;
    end else begin
      if (reset) begin
        ctrl_cs_dflt_3 <= 1'h1;
      end else begin
        if (profilePin_7) begin
          ctrl_cs_dflt_3 <= _T_904;
        end
      end
    end
    if (metaReset) begin
      ctrl_cs_mode <= 2'h0;
    end else begin
      if (reset) begin
        ctrl_cs_mode <= 2'h0;
      end else begin
        if (profilePin_13) begin
          ctrl_cs_mode <= _T_1256;
        end
      end
    end
    if (metaReset) begin
      ctrl_dla_cssck <= 8'h0;
    end else begin
      if (reset) begin
        ctrl_dla_cssck <= 8'h1;
      end else begin
        if (profilePin_8) begin
          ctrl_dla_cssck <= _T_948;
        end
      end
    end
    if (metaReset) begin
      ctrl_dla_sckcs <= 8'h0;
    end else begin
      if (reset) begin
        ctrl_dla_sckcs <= 8'h1;
      end else begin
        if (profilePin_9) begin
          ctrl_dla_sckcs <= _T_992;
        end
      end
    end
    if (metaReset) begin
      ctrl_dla_intercs <= 8'h0;
    end else begin
      if (reset) begin
        ctrl_dla_intercs <= 8'h1;
      end else begin
        if (profilePin_21) begin
          ctrl_dla_intercs <= _T_948;
        end
      end
    end
    if (metaReset) begin
      ctrl_dla_interxfr <= 8'h0;
    end else begin
      if (reset) begin
        ctrl_dla_interxfr <= 8'h0;
      end else begin
        if (profilePin_22) begin
          ctrl_dla_interxfr <= _T_992;
        end
      end
    end
    if (metaReset) begin
      ctrl_wm_tx <= 4'h0;
    end else begin
      if (reset) begin
        ctrl_wm_tx <= 4'h0;
      end else begin
        if (profilePin_10) begin
          ctrl_wm_tx <= _T_1036;
        end
      end
    end
    if (metaReset) begin
      ctrl_wm_rx <= 4'h0;
    end else begin
      if (reset) begin
        ctrl_wm_rx <= 4'h0;
      end else begin
        if (profilePin_16) begin
          ctrl_wm_rx <= _T_1036;
        end
      end
    end
    if (metaReset) begin
      ie_txwm <= 1'h0;
    end else begin
      if (reset) begin
        ie_txwm <= 1'h0;
      end else begin
        if (profilePin_14) begin
          ie_txwm <= _T_772;
        end
      end
    end
    if (metaReset) begin
      ie_rxwm <= 1'h0;
    end else begin
      if (reset) begin
        ie_rxwm <= 1'h0;
      end else begin
        if (profilePin_15) begin
          ie_rxwm <= _T_816;
        end
      end
    end
  end
endmodule
module TLMonitor_66( // @[:TLSPI.fir@2460.2]
  input         metaReset,
  input         clock, // @[:TLSPI.fir@2461.4]
  input         reset, // @[:TLSPI.fir@2462.4]
  input         io_in_a_ready, // @[:TLSPI.fir@2463.4]
  input         io_in_a_valid, // @[:TLSPI.fir@2463.4]
  input  [2:0]  io_in_a_bits_opcode, // @[:TLSPI.fir@2463.4]
  input  [2:0]  io_in_a_bits_param, // @[:TLSPI.fir@2463.4]
  input  [1:0]  io_in_a_bits_size, // @[:TLSPI.fir@2463.4]
  input  [6:0]  io_in_a_bits_source, // @[:TLSPI.fir@2463.4]
  input  [28:0] io_in_a_bits_address, // @[:TLSPI.fir@2463.4]
  input  [3:0]  io_in_a_bits_mask, // @[:TLSPI.fir@2463.4]
  input         io_in_c_valid, // @[:TLSPI.fir@2463.4]
  input         io_in_d_ready, // @[:TLSPI.fir@2463.4]
  input         io_in_d_valid, // @[:TLSPI.fir@2463.4]
  input  [2:0]  io_in_d_bits_opcode, // @[:TLSPI.fir@2463.4]
  input  [1:0]  io_in_d_bits_size, // @[:TLSPI.fir@2463.4]
  input  [6:0]  io_in_d_bits_source, // @[:TLSPI.fir@2463.4]
  input         io_in_e_valid, // @[:TLSPI.fir@2463.4]
  output        _GEN_118_0,
  output        _GEN_10_0,
  output        _GEN_43_0,
  output        _GEN_37_0,
  output        _GEN_109_0,
  output        _GEN_21_0,
  output        _GEN_3_0,
  output        _GEN_17_0,
  output        _GEN_96_0,
  output        _GEN_112_0,
  output        _GEN_24_0,
  output        _GEN_115_0,
  output        _GEN_7_0,
  output        _GEN_73_1,
  output        _GEN_121_1,
  output        _GEN_80_2,
  output        _GEN_59_0,
  output        _GEN_108_0,
  output        _GEN_53_0,
  output        _GEN_46_0,
  output        _GEN_70_0,
  output        _GEN_77_1,
  output        _GEN_39_1,
  output        _GEN_29_0,
  output        _GEN_56_0,
  output        _GEN_26_0,
  output        _GEN_5_1,
  output        _GEN_33_0,
  output        _GEN_63_0,
  output        _GEN_114_0,
  output        _GEN_9_0,
  output        _GEN_20_0,
  output        _GEN_36_0,
  output        _GEN_42_0,
  output        _GEN_2_3,
  output        _GEN_117_1,
  output        _GEN_111_1,
  output        _GEN_75_0,
  output        _GEN_23_0,
  output        _GEN_12_0,
  output        _GEN_79_2,
  output        _GEN_89_1,
  output        _GEN_58_1,
  output        _GEN_65_1,
  output        _GEN_35_0,
  output        _GEN_69_1,
  output        _GEN_62_0,
  output        _GEN_22_0,
  output        _GEN_51_0,
  output        _GEN_11_1,
  output        _GEN_38_0,
  output        _GEN_45_0,
  output        _GEN_113_0,
  output        _GEN_4_2,
  output        _GEN_32_0,
  output        _GEN_25_0,
  output        _GEN_48_0,
  output        _GEN_8_3,
  output        _GEN_122_1,
  output        _GEN_28_0,
  output        _GEN_1_2,
  output        _GEN_19_0,
  output        _GEN_74_1,
  output        _GEN_85_3,
  output        _GEN_110_1,
  output        _GEN_67_1,
  output        _GEN_71_1,
  output        _GEN_54_0,
  output        _GEN_47_0,
  output        _GEN_81_2,
  output        _GEN_40_0,
  output        _GEN_27_0,
  output        _GEN_64_1,
  output        _GEN_57_1,
  output        _GEN_50_0
);
  reg  _T_613; // @[Edges.scala 220:27:TLSPI.fir@3185.4]
  reg [31:0] _RAND_0;
  reg [2:0] _T_630; // @[Monitor.scala 316:22:TLSPI.fir@3200.4]
  reg [31:0] _RAND_1;
  reg [2:0] _T_632; // @[Monitor.scala 317:22:TLSPI.fir@3201.4]
  reg [31:0] _RAND_2;
  reg [1:0] _T_634; // @[Monitor.scala 318:22:TLSPI.fir@3202.4]
  reg [31:0] _RAND_3;
  reg [6:0] _T_636; // @[Monitor.scala 319:22:TLSPI.fir@3203.4]
  reg [31:0] _RAND_4;
  reg [28:0] _T_638; // @[Monitor.scala 320:22:TLSPI.fir@3204.4]
  reg [31:0] _RAND_5;
  reg  _T_681; // @[Edges.scala 220:27:TLSPI.fir@3266.4]
  reg [31:0] _RAND_6;
  reg [2:0] _T_698; // @[Monitor.scala 387:22:TLSPI.fir@3281.4]
  reg [31:0] _RAND_7;
  reg [1:0] _T_702; // @[Monitor.scala 389:22:TLSPI.fir@3283.4]
  reg [31:0] _RAND_8;
  reg [6:0] _T_704; // @[Monitor.scala 390:22:TLSPI.fir@3284.4]
  reg [31:0] _RAND_9;
  reg [127:0] _T_749; // @[Monitor.scala 420:27:TLSPI.fir@3353.4]
  reg [127:0] _RAND_10;
  reg  _T_764; // @[Edges.scala 220:27:TLSPI.fir@3363.4]
  reg [31:0] _RAND_11;
  reg  _T_792; // @[Edges.scala 220:27:TLSPI.fir@3386.4]
  reg [31:0] _RAND_12;
  wire [4:0] _T_42; // @[package.scala 104:77:TLSPI.fir@2490.6]
  wire [1:0] _T_43; // @[package.scala 104:82:TLSPI.fir@2491.6]
  wire [1:0] _T_44; // @[package.scala 104:46:TLSPI.fir@2492.6]
  wire [28:0] _GEN_124; // @[Edges.scala 21:16:TLSPI.fir@2493.6]
  wire [28:0] _T_45; // @[Edges.scala 21:16:TLSPI.fir@2493.6]
  wire  _T_47; // @[Edges.scala 21:24:TLSPI.fir@2494.6]
  wire  _T_48; // @[OneHot.scala 49:27:TLSPI.fir@2495.6]
  wire [1:0] _T_50; // @[OneHot.scala 50:12:TLSPI.fir@2496.6]
  wire [1:0] _T_53; // @[Misc.scala 237:54:TLSPI.fir@2498.6]
  wire  _T_55; // @[Misc.scala 241:21:TLSPI.fir@2499.6]
  wire  _T_57; // @[Misc.scala 244:26:TLSPI.fir@2500.6]
  wire  _T_58; // @[Misc.scala 245:26:TLSPI.fir@2501.6]
  wire  _T_60; // @[Misc.scala 246:20:TLSPI.fir@2502.6]
  wire  _T_62; // @[Misc.scala 250:38:TLSPI.fir@2504.6]
  wire  _T_63; // @[Misc.scala 250:29:TLSPI.fir@2505.6]
  wire  _T_65; // @[Misc.scala 250:38:TLSPI.fir@2507.6]
  wire  _T_66; // @[Misc.scala 250:29:TLSPI.fir@2508.6]
  wire  _T_67; // @[Misc.scala 244:26:TLSPI.fir@2509.6]
  wire  _T_68; // @[Misc.scala 245:26:TLSPI.fir@2510.6]
  wire  _T_70; // @[Misc.scala 246:20:TLSPI.fir@2511.6]
  wire  _T_71; // @[Misc.scala 249:27:TLSPI.fir@2512.6]
  wire  _T_72; // @[Misc.scala 250:38:TLSPI.fir@2513.6]
  wire  _T_73; // @[Misc.scala 250:29:TLSPI.fir@2514.6]
  wire  _T_74; // @[Misc.scala 249:27:TLSPI.fir@2515.6]
  wire  _T_75; // @[Misc.scala 250:38:TLSPI.fir@2516.6]
  wire  _T_76; // @[Misc.scala 250:29:TLSPI.fir@2517.6]
  wire  _T_77; // @[Misc.scala 249:27:TLSPI.fir@2518.6]
  wire  _T_78; // @[Misc.scala 250:38:TLSPI.fir@2519.6]
  wire  _T_79; // @[Misc.scala 250:29:TLSPI.fir@2520.6]
  wire  _T_80; // @[Misc.scala 249:27:TLSPI.fir@2521.6]
  wire  _T_81; // @[Misc.scala 250:38:TLSPI.fir@2522.6]
  wire  _T_82; // @[Misc.scala 250:29:TLSPI.fir@2523.6]
  wire [1:0] _T_83; // @[Cat.scala 30:58:TLSPI.fir@2524.6]
  wire [1:0] _T_84; // @[Cat.scala 30:58:TLSPI.fir@2525.6]
  wire [3:0] _T_85; // @[Cat.scala 30:58:TLSPI.fir@2526.6]
  wire  _T_87; // @[Monitor.scala 40:25:TLSPI.fir@2527.6]
  wire [28:0] _T_92; // @[Parameters.scala 119:31:TLSPI.fir@2530.8]
  wire [29:0] _T_93; // @[Parameters.scala 119:49:TLSPI.fir@2531.8]
  wire [29:0] _T_95; // @[Parameters.scala 119:52:TLSPI.fir@2532.8]
  wire [29:0] _T_96; // @[Parameters.scala 119:52:TLSPI.fir@2533.8]
  wire  _T_98; // @[Parameters.scala 119:67:TLSPI.fir@2534.8]
  wire  _T_105; // @[Monitor.scala 41:14:TLSPI.fir@2539.8]
  wire  _T_118; // @[Monitor.scala 44:14:TLSPI.fir@2560.8]
  wire  _T_120; // @[Monitor.scala 44:14:TLSPI.fir@2561.8]
  wire  _T_122; // @[Monitor.scala 45:14:TLSPI.fir@2567.8]
  wire  _T_124; // @[Monitor.scala 45:14:TLSPI.fir@2568.8]
  wire  _T_126; // @[Bundles.scala 71:27:TLSPI.fir@2573.8]
  wire  _T_128; // @[Monitor.scala 46:14:TLSPI.fir@2575.8]
  wire  _T_130; // @[Monitor.scala 46:14:TLSPI.fir@2576.8]
  wire [3:0] _T_131; // @[Monitor.scala 47:15:TLSPI.fir@2581.8]
  wire  _T_133; // @[Monitor.scala 47:28:TLSPI.fir@2582.8]
  wire  _T_135; // @[Monitor.scala 47:14:TLSPI.fir@2584.8]
  wire  _T_137; // @[Monitor.scala 47:14:TLSPI.fir@2585.8]
  wire  _T_139; // @[Monitor.scala 50:25:TLSPI.fir@2591.6]
  wire  _T_184; // @[Monitor.scala 57:28:TLSPI.fir@2645.8]
  wire  _T_186; // @[Monitor.scala 57:14:TLSPI.fir@2647.8]
  wire  _T_188; // @[Monitor.scala 57:14:TLSPI.fir@2648.8]
  wire  _T_197; // @[Monitor.scala 61:25:TLSPI.fir@2663.6]
  wire  _T_202; // @[Parameters.scala 88:42:TLSPI.fir@2666.8]
  wire  _T_213; // @[Parameters.scala 157:56:TLSPI.fir@2674.8]
  wire  _T_217; // @[Monitor.scala 62:14:TLSPI.fir@2677.8]
  wire  _T_219; // @[Monitor.scala 62:14:TLSPI.fir@2678.8]
  wire  _T_229; // @[Monitor.scala 65:28:TLSPI.fir@2697.8]
  wire  _T_231; // @[Monitor.scala 65:14:TLSPI.fir@2699.8]
  wire  _T_233; // @[Monitor.scala 65:14:TLSPI.fir@2700.8]
  wire  _T_234; // @[Monitor.scala 66:27:TLSPI.fir@2705.8]
  wire  _T_236; // @[Monitor.scala 66:14:TLSPI.fir@2707.8]
  wire  _T_238; // @[Monitor.scala 66:14:TLSPI.fir@2708.8]
  wire  _T_240; // @[Monitor.scala 69:25:TLSPI.fir@2714.6]
  wire  _T_283; // @[Monitor.scala 77:25:TLSPI.fir@2765.6]
  wire [3:0] _T_320; // @[Monitor.scala 82:30:TLSPI.fir@2807.8]
  wire [3:0] _T_321; // @[Monitor.scala 82:28:TLSPI.fir@2808.8]
  wire  _T_323; // @[Monitor.scala 82:37:TLSPI.fir@2809.8]
  wire  _T_325; // @[Monitor.scala 82:14:TLSPI.fir@2811.8]
  wire  _T_327; // @[Monitor.scala 82:14:TLSPI.fir@2812.8]
  wire  _T_329; // @[Monitor.scala 85:25:TLSPI.fir@2818.6]
  wire  _T_357; // @[Bundles.scala 96:33:TLSPI.fir@2849.8]
  wire  _T_359; // @[Monitor.scala 89:14:TLSPI.fir@2851.8]
  wire  _T_361; // @[Monitor.scala 89:14:TLSPI.fir@2852.8]
  wire  _T_368; // @[Monitor.scala 93:25:TLSPI.fir@2866.6]
  wire  _T_396; // @[Bundles.scala 103:30:TLSPI.fir@2897.8]
  wire  _T_398; // @[Monitor.scala 97:14:TLSPI.fir@2899.8]
  wire  _T_400; // @[Monitor.scala 97:14:TLSPI.fir@2900.8]
  wire  _T_407; // @[Monitor.scala 101:25:TLSPI.fir@2914.6]
  wire  _T_440; // @[Bundles.scala 43:24:TLSPI.fir@2956.6]
  wire  _T_442; // @[Monitor.scala 247:12:TLSPI.fir@2958.6]
  wire  _T_444; // @[Monitor.scala 247:12:TLSPI.fir@2959.6]
  wire  _T_468; // @[Monitor.scala 252:25:TLSPI.fir@2977.6]
  wire  _T_478; // @[Monitor.scala 255:27:TLSPI.fir@2993.8]
  wire  _T_480; // @[Monitor.scala 255:14:TLSPI.fir@2995.8]
  wire  _T_482; // @[Monitor.scala 255:14:TLSPI.fir@2996.8]
  wire  _T_490; // @[Monitor.scala 259:25:TLSPI.fir@3010.6]
  wire  _T_512; // @[Monitor.scala 266:25:TLSPI.fir@3043.6]
  wire  _T_588; // @[Monitor.scala 309:15:TLSPI.fir@3160.4]
  wire  _T_590; // @[Monitor.scala 309:14:TLSPI.fir@3162.4]
  wire  _T_594; // @[Monitor.scala 310:15:TLSPI.fir@3168.4]
  wire  _T_596; // @[Monitor.scala 310:14:TLSPI.fir@3170.4]
  wire  _T_599; // @[Bundles.scala 207:36:TLSPI.fir@3176.4]
  wire [1:0] _T_615; // @[Edges.scala 221:28:TLSPI.fir@3186.4]
  wire [1:0] _T_616; // @[Edges.scala 221:28:TLSPI.fir@3187.4]
  wire  _T_617; // @[Edges.scala 221:28:TLSPI.fir@3188.4]
  wire  _T_619; // @[Edges.scala 222:25:TLSPI.fir@3189.4]
  wire  _T_640; // @[Monitor.scala 321:22:TLSPI.fir@3205.4]
  wire  _T_641; // @[Monitor.scala 321:19:TLSPI.fir@3206.4]
  wire  _T_642; // @[Monitor.scala 322:29:TLSPI.fir@3208.6]
  wire  _T_644; // @[Monitor.scala 322:14:TLSPI.fir@3210.6]
  wire  _T_646; // @[Monitor.scala 322:14:TLSPI.fir@3211.6]
  wire  _T_647; // @[Monitor.scala 323:29:TLSPI.fir@3216.6]
  wire  _T_649; // @[Monitor.scala 323:14:TLSPI.fir@3218.6]
  wire  _T_651; // @[Monitor.scala 323:14:TLSPI.fir@3219.6]
  wire  _T_652; // @[Monitor.scala 324:29:TLSPI.fir@3224.6]
  wire  _T_654; // @[Monitor.scala 324:14:TLSPI.fir@3226.6]
  wire  _T_656; // @[Monitor.scala 324:14:TLSPI.fir@3227.6]
  wire  _T_657; // @[Monitor.scala 325:29:TLSPI.fir@3232.6]
  wire  _T_659; // @[Monitor.scala 325:14:TLSPI.fir@3234.6]
  wire  _T_661; // @[Monitor.scala 325:14:TLSPI.fir@3235.6]
  wire  _T_662; // @[Monitor.scala 326:29:TLSPI.fir@3240.6]
  wire  _T_664; // @[Monitor.scala 326:14:TLSPI.fir@3242.6]
  wire  _T_666; // @[Monitor.scala 326:14:TLSPI.fir@3243.6]
  wire  _T_668; // @[Monitor.scala 328:20:TLSPI.fir@3250.4]
  wire  _T_669; // @[Bundles.scala 207:36:TLSPI.fir@3258.4]
  wire [1:0] _T_683; // @[Edges.scala 221:28:TLSPI.fir@3267.4]
  wire [1:0] _T_684; // @[Edges.scala 221:28:TLSPI.fir@3268.4]
  wire  _T_685; // @[Edges.scala 221:28:TLSPI.fir@3269.4]
  wire  _T_687; // @[Edges.scala 222:25:TLSPI.fir@3270.4]
  wire  _T_711; // @[Monitor.scala 393:22:TLSPI.fir@3291.4]
  wire  _T_712; // @[Monitor.scala 393:19:TLSPI.fir@3292.4]
  wire  _T_713; // @[Monitor.scala 394:29:TLSPI.fir@3294.6]
  wire  _T_715; // @[Monitor.scala 394:14:TLSPI.fir@3296.6]
  wire  _T_717; // @[Monitor.scala 394:14:TLSPI.fir@3297.6]
  wire  _T_723; // @[Monitor.scala 396:29:TLSPI.fir@3310.6]
  wire  _T_725; // @[Monitor.scala 396:14:TLSPI.fir@3312.6]
  wire  _T_727; // @[Monitor.scala 396:14:TLSPI.fir@3313.6]
  wire  _T_728; // @[Monitor.scala 397:29:TLSPI.fir@3318.6]
  wire  _T_730; // @[Monitor.scala 397:14:TLSPI.fir@3320.6]
  wire  _T_732; // @[Monitor.scala 397:14:TLSPI.fir@3321.6]
  wire  _T_746; // @[Monitor.scala 401:20:TLSPI.fir@3345.4]
  wire [1:0] _T_766; // @[Edges.scala 221:28:TLSPI.fir@3364.4]
  wire [1:0] _T_767; // @[Edges.scala 221:28:TLSPI.fir@3365.4]
  wire  _T_768; // @[Edges.scala 221:28:TLSPI.fir@3366.4]
  wire  _T_770; // @[Edges.scala 222:25:TLSPI.fir@3367.4]
  wire [1:0] _T_794; // @[Edges.scala 221:28:TLSPI.fir@3387.4]
  wire [1:0] _T_795; // @[Edges.scala 221:28:TLSPI.fir@3388.4]
  wire  _T_796; // @[Edges.scala 221:28:TLSPI.fir@3389.4]
  wire  _T_798; // @[Edges.scala 222:25:TLSPI.fir@3390.4]
  wire  _T_812; // @[Monitor.scala 426:27:TLSPI.fir@3405.4]
  wire [127:0] _T_816; // @[OneHot.scala 45:35:TLSPI.fir@3408.6]
  wire [127:0] _T_817; // @[Monitor.scala 428:23:TLSPI.fir@3410.6]
  wire  _T_818; // @[Monitor.scala 428:23:TLSPI.fir@3411.6]
  wire  _T_820; // @[Monitor.scala 428:14:TLSPI.fir@3412.6]
  wire  _T_822; // @[Monitor.scala 428:13:TLSPI.fir@3414.6]
  wire  _T_824; // @[Monitor.scala 428:13:TLSPI.fir@3415.6]
  wire [127:0] _GEN_15; // @[Monitor.scala 426:72:TLSPI.fir@3407.4]
  wire  _T_831; // @[Monitor.scala 433:27:TLSPI.fir@3426.4]
  wire  _T_835; // @[Monitor.scala 433:75:TLSPI.fir@3428.4]
  wire  _T_836; // @[Monitor.scala 433:72:TLSPI.fir@3429.4]
  wire [127:0] _T_838; // @[OneHot.scala 45:35:TLSPI.fir@3431.6]
  wire [127:0] _T_839; // @[Monitor.scala 435:21:TLSPI.fir@3433.6]
  wire [127:0] _T_840; // @[Monitor.scala 435:32:TLSPI.fir@3434.6]
  wire  _T_841; // @[Monitor.scala 435:32:TLSPI.fir@3435.6]
  wire  _T_843; // @[Monitor.scala 435:13:TLSPI.fir@3437.6]
  wire  _T_845; // @[Monitor.scala 435:13:TLSPI.fir@3438.6]
  wire [127:0] _GEN_16; // @[Monitor.scala 433:91:TLSPI.fir@3430.4]
  wire [127:0] _T_846; // @[Monitor.scala 442:27:TLSPI.fir@3444.4]
  wire [127:0] _T_847; // @[Monitor.scala 442:38:TLSPI.fir@3445.4]
  wire [127:0] _T_848; // @[Monitor.scala 442:36:TLSPI.fir@3446.4]
  wire  _GEN_18; // @[Monitor.scala 41:14:TLSPI.fir@2541.10]
  wire  _GEN_30; // @[Monitor.scala 51:14:TLSPI.fir@2605.10]
  wire  _GEN_44; // @[Monitor.scala 62:14:TLSPI.fir@2680.10]
  wire  _GEN_52; // @[Monitor.scala 70:14:TLSPI.fir@2731.10]
  wire  _GEN_60; // @[Monitor.scala 78:14:TLSPI.fir@2782.10]
  wire  _GEN_68; // @[Monitor.scala 86:14:TLSPI.fir@2832.10]
  wire  _GEN_76; // @[Monitor.scala 94:14:TLSPI.fir@2880.10]
  wire  _GEN_84; // @[Monitor.scala 102:14:TLSPI.fir@2928.10]
  wire  _GEN_90; // @[Monitor.scala 255:14:TLSPI.fir@2998.10]
  wire  _GEN_92; // @[Monitor.scala 262:14:TLSPI.fir@3031.10]
  wire  _GEN_94; // @[Monitor.scala 269:14:TLSPI.fir@3064.10]
  assign _T_42 = 5'h3 << io_in_a_bits_size; // @[package.scala 104:77:TLSPI.fir@2490.6]
  assign _T_43 = _T_42[1:0]; // @[package.scala 104:82:TLSPI.fir@2491.6]
  assign _T_44 = ~ _T_43; // @[package.scala 104:46:TLSPI.fir@2492.6]
  assign _GEN_124 = {{27'd0}, _T_44}; // @[Edges.scala 21:16:TLSPI.fir@2493.6]
  assign _T_45 = io_in_a_bits_address & _GEN_124; // @[Edges.scala 21:16:TLSPI.fir@2493.6]
  assign _T_47 = _T_45 == 29'h0; // @[Edges.scala 21:24:TLSPI.fir@2494.6]
  assign _T_48 = io_in_a_bits_size[0]; // @[OneHot.scala 49:27:TLSPI.fir@2495.6]
  assign _T_50 = 2'h1 << _T_48; // @[OneHot.scala 50:12:TLSPI.fir@2496.6]
  assign _T_53 = _T_50 | 2'h1; // @[Misc.scala 237:54:TLSPI.fir@2498.6]
  assign _T_55 = io_in_a_bits_size >= 2'h2; // @[Misc.scala 241:21:TLSPI.fir@2499.6]
  assign _T_57 = _T_53[1]; // @[Misc.scala 244:26:TLSPI.fir@2500.6]
  assign _T_58 = io_in_a_bits_address[1]; // @[Misc.scala 245:26:TLSPI.fir@2501.6]
  assign _T_60 = _T_58 == 1'h0; // @[Misc.scala 246:20:TLSPI.fir@2502.6]
  assign _T_62 = _T_57 & _T_60; // @[Misc.scala 250:38:TLSPI.fir@2504.6]
  assign _T_63 = _T_55 | _T_62; // @[Misc.scala 250:29:TLSPI.fir@2505.6]
  assign _T_65 = _T_57 & _T_58; // @[Misc.scala 250:38:TLSPI.fir@2507.6]
  assign _T_66 = _T_55 | _T_65; // @[Misc.scala 250:29:TLSPI.fir@2508.6]
  assign _T_67 = _T_53[0]; // @[Misc.scala 244:26:TLSPI.fir@2509.6]
  assign _T_68 = io_in_a_bits_address[0]; // @[Misc.scala 245:26:TLSPI.fir@2510.6]
  assign _T_70 = _T_68 == 1'h0; // @[Misc.scala 246:20:TLSPI.fir@2511.6]
  assign _T_71 = _T_60 & _T_70; // @[Misc.scala 249:27:TLSPI.fir@2512.6]
  assign _T_72 = _T_67 & _T_71; // @[Misc.scala 250:38:TLSPI.fir@2513.6]
  assign _T_73 = _T_63 | _T_72; // @[Misc.scala 250:29:TLSPI.fir@2514.6]
  assign _T_74 = _T_60 & _T_68; // @[Misc.scala 249:27:TLSPI.fir@2515.6]
  assign _T_75 = _T_67 & _T_74; // @[Misc.scala 250:38:TLSPI.fir@2516.6]
  assign _T_76 = _T_63 | _T_75; // @[Misc.scala 250:29:TLSPI.fir@2517.6]
  assign _T_77 = _T_58 & _T_70; // @[Misc.scala 249:27:TLSPI.fir@2518.6]
  assign _T_78 = _T_67 & _T_77; // @[Misc.scala 250:38:TLSPI.fir@2519.6]
  assign _T_79 = _T_66 | _T_78; // @[Misc.scala 250:29:TLSPI.fir@2520.6]
  assign _T_80 = _T_58 & _T_68; // @[Misc.scala 249:27:TLSPI.fir@2521.6]
  assign _T_81 = _T_67 & _T_80; // @[Misc.scala 250:38:TLSPI.fir@2522.6]
  assign _T_82 = _T_66 | _T_81; // @[Misc.scala 250:29:TLSPI.fir@2523.6]
  assign _T_83 = {_T_76,_T_73}; // @[Cat.scala 30:58:TLSPI.fir@2524.6]
  assign _T_84 = {_T_82,_T_79}; // @[Cat.scala 30:58:TLSPI.fir@2525.6]
  assign _T_85 = {_T_84,_T_83}; // @[Cat.scala 30:58:TLSPI.fir@2526.6]
  assign _T_87 = io_in_a_bits_opcode == 3'h6; // @[Monitor.scala 40:25:TLSPI.fir@2527.6]
  assign _T_92 = io_in_a_bits_address ^ 29'h10024000; // @[Parameters.scala 119:31:TLSPI.fir@2530.8]
  assign _T_93 = {1'b0,$signed(_T_92)}; // @[Parameters.scala 119:49:TLSPI.fir@2531.8]
  assign _T_95 = $signed(_T_93) & $signed(-30'sh1000); // @[Parameters.scala 119:52:TLSPI.fir@2532.8]
  assign _T_96 = $signed(_T_95); // @[Parameters.scala 119:52:TLSPI.fir@2533.8]
  assign _T_98 = $signed(_T_96) == $signed(30'sh0); // @[Parameters.scala 119:67:TLSPI.fir@2534.8]
  assign _T_105 = reset == 1'h0; // @[Monitor.scala 41:14:TLSPI.fir@2539.8]
  assign _T_118 = _T_55 | reset; // @[Monitor.scala 44:14:TLSPI.fir@2560.8]
  assign _T_120 = _T_118 == 1'h0; // @[Monitor.scala 44:14:TLSPI.fir@2561.8]
  assign _T_122 = _T_47 | reset; // @[Monitor.scala 45:14:TLSPI.fir@2567.8]
  assign _T_124 = _T_122 == 1'h0; // @[Monitor.scala 45:14:TLSPI.fir@2568.8]
  assign _T_126 = io_in_a_bits_param <= 3'h2; // @[Bundles.scala 71:27:TLSPI.fir@2573.8]
  assign _T_128 = _T_126 | reset; // @[Monitor.scala 46:14:TLSPI.fir@2575.8]
  assign _T_130 = _T_128 == 1'h0; // @[Monitor.scala 46:14:TLSPI.fir@2576.8]
  assign _T_131 = ~ io_in_a_bits_mask; // @[Monitor.scala 47:15:TLSPI.fir@2581.8]
  assign _T_133 = _T_131 == 4'h0; // @[Monitor.scala 47:28:TLSPI.fir@2582.8]
  assign _T_135 = _T_133 | reset; // @[Monitor.scala 47:14:TLSPI.fir@2584.8]
  assign _T_137 = _T_135 == 1'h0; // @[Monitor.scala 47:14:TLSPI.fir@2585.8]
  assign _T_139 = io_in_a_bits_opcode == 3'h7; // @[Monitor.scala 50:25:TLSPI.fir@2591.6]
  assign _T_184 = io_in_a_bits_param != 3'h0; // @[Monitor.scala 57:28:TLSPI.fir@2645.8]
  assign _T_186 = _T_184 | reset; // @[Monitor.scala 57:14:TLSPI.fir@2647.8]
  assign _T_188 = _T_186 == 1'h0; // @[Monitor.scala 57:14:TLSPI.fir@2648.8]
  assign _T_197 = io_in_a_bits_opcode == 3'h4; // @[Monitor.scala 61:25:TLSPI.fir@2663.6]
  assign _T_202 = io_in_a_bits_size <= 2'h2; // @[Parameters.scala 88:42:TLSPI.fir@2666.8]
  assign _T_213 = _T_202 & _T_98; // @[Parameters.scala 157:56:TLSPI.fir@2674.8]
  assign _T_217 = _T_213 | reset; // @[Monitor.scala 62:14:TLSPI.fir@2677.8]
  assign _T_219 = _T_217 == 1'h0; // @[Monitor.scala 62:14:TLSPI.fir@2678.8]
  assign _T_229 = io_in_a_bits_param == 3'h0; // @[Monitor.scala 65:28:TLSPI.fir@2697.8]
  assign _T_231 = _T_229 | reset; // @[Monitor.scala 65:14:TLSPI.fir@2699.8]
  assign _T_233 = _T_231 == 1'h0; // @[Monitor.scala 65:14:TLSPI.fir@2700.8]
  assign _T_234 = io_in_a_bits_mask == _T_85; // @[Monitor.scala 66:27:TLSPI.fir@2705.8]
  assign _T_236 = _T_234 | reset; // @[Monitor.scala 66:14:TLSPI.fir@2707.8]
  assign _T_238 = _T_236 == 1'h0; // @[Monitor.scala 66:14:TLSPI.fir@2708.8]
  assign _T_240 = io_in_a_bits_opcode == 3'h0; // @[Monitor.scala 69:25:TLSPI.fir@2714.6]
  assign _T_283 = io_in_a_bits_opcode == 3'h1; // @[Monitor.scala 77:25:TLSPI.fir@2765.6]
  assign _T_320 = ~ _T_85; // @[Monitor.scala 82:30:TLSPI.fir@2807.8]
  assign _T_321 = io_in_a_bits_mask & _T_320; // @[Monitor.scala 82:28:TLSPI.fir@2808.8]
  assign _T_323 = _T_321 == 4'h0; // @[Monitor.scala 82:37:TLSPI.fir@2809.8]
  assign _T_325 = _T_323 | reset; // @[Monitor.scala 82:14:TLSPI.fir@2811.8]
  assign _T_327 = _T_325 == 1'h0; // @[Monitor.scala 82:14:TLSPI.fir@2812.8]
  assign _T_329 = io_in_a_bits_opcode == 3'h2; // @[Monitor.scala 85:25:TLSPI.fir@2818.6]
  assign _T_357 = io_in_a_bits_param <= 3'h4; // @[Bundles.scala 96:33:TLSPI.fir@2849.8]
  assign _T_359 = _T_357 | reset; // @[Monitor.scala 89:14:TLSPI.fir@2851.8]
  assign _T_361 = _T_359 == 1'h0; // @[Monitor.scala 89:14:TLSPI.fir@2852.8]
  assign _T_368 = io_in_a_bits_opcode == 3'h3; // @[Monitor.scala 93:25:TLSPI.fir@2866.6]
  assign _T_396 = io_in_a_bits_param <= 3'h3; // @[Bundles.scala 103:30:TLSPI.fir@2897.8]
  assign _T_398 = _T_396 | reset; // @[Monitor.scala 97:14:TLSPI.fir@2899.8]
  assign _T_400 = _T_398 == 1'h0; // @[Monitor.scala 97:14:TLSPI.fir@2900.8]
  assign _T_407 = io_in_a_bits_opcode == 3'h5; // @[Monitor.scala 101:25:TLSPI.fir@2914.6]
  assign _T_440 = io_in_d_bits_opcode <= 3'h6; // @[Bundles.scala 43:24:TLSPI.fir@2956.6]
  assign _T_442 = _T_440 | reset; // @[Monitor.scala 247:12:TLSPI.fir@2958.6]
  assign _T_444 = _T_442 == 1'h0; // @[Monitor.scala 247:12:TLSPI.fir@2959.6]
  assign _T_468 = io_in_d_bits_opcode == 3'h6; // @[Monitor.scala 252:25:TLSPI.fir@2977.6]
  assign _T_478 = io_in_d_bits_size >= 2'h2; // @[Monitor.scala 255:27:TLSPI.fir@2993.8]
  assign _T_480 = _T_478 | reset; // @[Monitor.scala 255:14:TLSPI.fir@2995.8]
  assign _T_482 = _T_480 == 1'h0; // @[Monitor.scala 255:14:TLSPI.fir@2996.8]
  assign _T_490 = io_in_d_bits_opcode == 3'h4; // @[Monitor.scala 259:25:TLSPI.fir@3010.6]
  assign _T_512 = io_in_d_bits_opcode == 3'h5; // @[Monitor.scala 266:25:TLSPI.fir@3043.6]
  assign _T_588 = io_in_c_valid == 1'h0; // @[Monitor.scala 309:15:TLSPI.fir@3160.4]
  assign _T_590 = _T_588 | reset; // @[Monitor.scala 309:14:TLSPI.fir@3162.4]
  assign _T_594 = io_in_e_valid == 1'h0; // @[Monitor.scala 310:15:TLSPI.fir@3168.4]
  assign _T_596 = _T_594 | reset; // @[Monitor.scala 310:14:TLSPI.fir@3170.4]
  assign _T_599 = io_in_a_ready & io_in_a_valid; // @[Bundles.scala 207:36:TLSPI.fir@3176.4]
  assign _T_615 = _T_613 - 1'h1; // @[Edges.scala 221:28:TLSPI.fir@3186.4]
  assign _T_616 = $unsigned(_T_615); // @[Edges.scala 221:28:TLSPI.fir@3187.4]
  assign _T_617 = _T_616[0:0]; // @[Edges.scala 221:28:TLSPI.fir@3188.4]
  assign _T_619 = _T_613 == 1'h0; // @[Edges.scala 222:25:TLSPI.fir@3189.4]
  assign _T_640 = _T_619 == 1'h0; // @[Monitor.scala 321:22:TLSPI.fir@3205.4]
  assign _T_641 = io_in_a_valid & _T_640; // @[Monitor.scala 321:19:TLSPI.fir@3206.4]
  assign _T_642 = io_in_a_bits_opcode == _T_630; // @[Monitor.scala 322:29:TLSPI.fir@3208.6]
  assign _T_644 = _T_642 | reset; // @[Monitor.scala 322:14:TLSPI.fir@3210.6]
  assign _T_646 = _T_644 == 1'h0; // @[Monitor.scala 322:14:TLSPI.fir@3211.6]
  assign _T_647 = io_in_a_bits_param == _T_632; // @[Monitor.scala 323:29:TLSPI.fir@3216.6]
  assign _T_649 = _T_647 | reset; // @[Monitor.scala 323:14:TLSPI.fir@3218.6]
  assign _T_651 = _T_649 == 1'h0; // @[Monitor.scala 323:14:TLSPI.fir@3219.6]
  assign _T_652 = io_in_a_bits_size == _T_634; // @[Monitor.scala 324:29:TLSPI.fir@3224.6]
  assign _T_654 = _T_652 | reset; // @[Monitor.scala 324:14:TLSPI.fir@3226.6]
  assign _T_656 = _T_654 == 1'h0; // @[Monitor.scala 324:14:TLSPI.fir@3227.6]
  assign _T_657 = io_in_a_bits_source == _T_636; // @[Monitor.scala 325:29:TLSPI.fir@3232.6]
  assign _T_659 = _T_657 | reset; // @[Monitor.scala 325:14:TLSPI.fir@3234.6]
  assign _T_661 = _T_659 == 1'h0; // @[Monitor.scala 325:14:TLSPI.fir@3235.6]
  assign _T_662 = io_in_a_bits_address == _T_638; // @[Monitor.scala 326:29:TLSPI.fir@3240.6]
  assign _T_664 = _T_662 | reset; // @[Monitor.scala 326:14:TLSPI.fir@3242.6]
  assign _T_666 = _T_664 == 1'h0; // @[Monitor.scala 326:14:TLSPI.fir@3243.6]
  assign _T_668 = _T_599 & _T_619; // @[Monitor.scala 328:20:TLSPI.fir@3250.4]
  assign _T_669 = io_in_d_ready & io_in_d_valid; // @[Bundles.scala 207:36:TLSPI.fir@3258.4]
  assign _T_683 = _T_681 - 1'h1; // @[Edges.scala 221:28:TLSPI.fir@3267.4]
  assign _T_684 = $unsigned(_T_683); // @[Edges.scala 221:28:TLSPI.fir@3268.4]
  assign _T_685 = _T_684[0:0]; // @[Edges.scala 221:28:TLSPI.fir@3269.4]
  assign _T_687 = _T_681 == 1'h0; // @[Edges.scala 222:25:TLSPI.fir@3270.4]
  assign _T_711 = _T_687 == 1'h0; // @[Monitor.scala 393:22:TLSPI.fir@3291.4]
  assign _T_712 = io_in_d_valid & _T_711; // @[Monitor.scala 393:19:TLSPI.fir@3292.4]
  assign _T_713 = io_in_d_bits_opcode == _T_698; // @[Monitor.scala 394:29:TLSPI.fir@3294.6]
  assign _T_715 = _T_713 | reset; // @[Monitor.scala 394:14:TLSPI.fir@3296.6]
  assign _T_717 = _T_715 == 1'h0; // @[Monitor.scala 394:14:TLSPI.fir@3297.6]
  assign _T_723 = io_in_d_bits_size == _T_702; // @[Monitor.scala 396:29:TLSPI.fir@3310.6]
  assign _T_725 = _T_723 | reset; // @[Monitor.scala 396:14:TLSPI.fir@3312.6]
  assign _T_727 = _T_725 == 1'h0; // @[Monitor.scala 396:14:TLSPI.fir@3313.6]
  assign _T_728 = io_in_d_bits_source == _T_704; // @[Monitor.scala 397:29:TLSPI.fir@3318.6]
  assign _T_730 = _T_728 | reset; // @[Monitor.scala 397:14:TLSPI.fir@3320.6]
  assign _T_732 = _T_730 == 1'h0; // @[Monitor.scala 397:14:TLSPI.fir@3321.6]
  assign _T_746 = _T_669 & _T_687; // @[Monitor.scala 401:20:TLSPI.fir@3345.4]
  assign _T_766 = _T_764 - 1'h1; // @[Edges.scala 221:28:TLSPI.fir@3364.4]
  assign _T_767 = $unsigned(_T_766); // @[Edges.scala 221:28:TLSPI.fir@3365.4]
  assign _T_768 = _T_767[0:0]; // @[Edges.scala 221:28:TLSPI.fir@3366.4]
  assign _T_770 = _T_764 == 1'h0; // @[Edges.scala 222:25:TLSPI.fir@3367.4]
  assign _T_794 = _T_792 - 1'h1; // @[Edges.scala 221:28:TLSPI.fir@3387.4]
  assign _T_795 = $unsigned(_T_794); // @[Edges.scala 221:28:TLSPI.fir@3388.4]
  assign _T_796 = _T_795[0:0]; // @[Edges.scala 221:28:TLSPI.fir@3389.4]
  assign _T_798 = _T_792 == 1'h0; // @[Edges.scala 222:25:TLSPI.fir@3390.4]
  assign _T_812 = _T_599 & _T_770; // @[Monitor.scala 426:27:TLSPI.fir@3405.4]
  assign _T_816 = 128'h1 << io_in_a_bits_source; // @[OneHot.scala 45:35:TLSPI.fir@3408.6]
  assign _T_817 = _T_749 >> io_in_a_bits_source; // @[Monitor.scala 428:23:TLSPI.fir@3410.6]
  assign _T_818 = _T_817[0]; // @[Monitor.scala 428:23:TLSPI.fir@3411.6]
  assign _T_820 = _T_818 == 1'h0; // @[Monitor.scala 428:14:TLSPI.fir@3412.6]
  assign _T_822 = _T_820 | reset; // @[Monitor.scala 428:13:TLSPI.fir@3414.6]
  assign _T_824 = _T_822 == 1'h0; // @[Monitor.scala 428:13:TLSPI.fir@3415.6]
  assign _GEN_15 = _T_812 ? _T_816 : 128'h0; // @[Monitor.scala 426:72:TLSPI.fir@3407.4]
  assign _T_831 = _T_669 & _T_798; // @[Monitor.scala 433:27:TLSPI.fir@3426.4]
  assign _T_835 = _T_468 == 1'h0; // @[Monitor.scala 433:75:TLSPI.fir@3428.4]
  assign _T_836 = _T_831 & _T_835; // @[Monitor.scala 433:72:TLSPI.fir@3429.4]
  assign _T_838 = 128'h1 << io_in_d_bits_source; // @[OneHot.scala 45:35:TLSPI.fir@3431.6]
  assign _T_839 = _GEN_15 | _T_749; // @[Monitor.scala 435:21:TLSPI.fir@3433.6]
  assign _T_840 = _T_839 >> io_in_d_bits_source; // @[Monitor.scala 435:32:TLSPI.fir@3434.6]
  assign _T_841 = _T_840[0]; // @[Monitor.scala 435:32:TLSPI.fir@3435.6]
  assign _T_843 = _T_841 | reset; // @[Monitor.scala 435:13:TLSPI.fir@3437.6]
  assign _T_845 = _T_843 == 1'h0; // @[Monitor.scala 435:13:TLSPI.fir@3438.6]
  assign _GEN_16 = _T_836 ? _T_838 : 128'h0; // @[Monitor.scala 433:91:TLSPI.fir@3430.4]
  assign _T_846 = _T_749 | _GEN_15; // @[Monitor.scala 442:27:TLSPI.fir@3444.4]
  assign _T_847 = ~ _GEN_16; // @[Monitor.scala 442:38:TLSPI.fir@3445.4]
  assign _T_848 = _T_846 & _T_847; // @[Monitor.scala 442:36:TLSPI.fir@3446.4]
  assign _GEN_18 = io_in_a_valid & _T_87; // @[Monitor.scala 41:14:TLSPI.fir@2541.10]
  assign _GEN_30 = io_in_a_valid & _T_139; // @[Monitor.scala 51:14:TLSPI.fir@2605.10]
  assign _GEN_44 = io_in_a_valid & _T_197; // @[Monitor.scala 62:14:TLSPI.fir@2680.10]
  assign _GEN_52 = io_in_a_valid & _T_240; // @[Monitor.scala 70:14:TLSPI.fir@2731.10]
  assign _GEN_60 = io_in_a_valid & _T_283; // @[Monitor.scala 78:14:TLSPI.fir@2782.10]
  assign _GEN_68 = io_in_a_valid & _T_329; // @[Monitor.scala 86:14:TLSPI.fir@2832.10]
  assign _GEN_76 = io_in_a_valid & _T_368; // @[Monitor.scala 94:14:TLSPI.fir@2880.10]
  assign _GEN_84 = io_in_a_valid & _T_407; // @[Monitor.scala 102:14:TLSPI.fir@2928.10]
  assign _GEN_90 = io_in_d_valid & _T_468; // @[Monitor.scala 255:14:TLSPI.fir@2998.10]
  assign _GEN_92 = io_in_d_valid & _T_490; // @[Monitor.scala 262:14:TLSPI.fir@3031.10]
  assign _GEN_94 = io_in_d_valid & _T_512; // @[Monitor.scala 269:14:TLSPI.fir@3064.10]
  assign _GEN_118_0 = _T_712 & _T_732;
  assign _GEN_10_0 = _T_599 & _T_770;
  assign _GEN_43_0 = _GEN_30 & _T_124;
  assign _GEN_37_0 = _GEN_18 & _T_130;
  assign _GEN_109_0 = _T_596 == 1'h0;
  assign _GEN_21_0 = _T_599 & _T_619;
  assign _GEN_3_0 = _T_681 == 1'h0;
  assign _GEN_17_0 = _T_599 & _T_619;
  assign _GEN_96_0 = _GEN_94 & _T_482;
  assign _GEN_112_0 = _T_641 & _T_656;
  assign _GEN_24_0 = _T_669 & _T_687;
  assign _GEN_115_0 = _T_712 & _T_717;
  assign _GEN_7_0 = io_in_a_ready & io_in_a_valid;
  assign _GEN_73_1 = _GEN_76 & _T_124;
  assign _GEN_121_1 = _T_812 & _T_824;
  assign _GEN_80_2 = _GEN_84 & _T_238;
  assign _GEN_59_0 = _GEN_60 & _T_219;
  assign _GEN_108_0 = _T_590 == 1'h0;
  assign _GEN_53_0 = _GEN_44 & _T_238;
  assign _GEN_46_0 = _GEN_30 & _T_188;
  assign _GEN_70_0 = _GEN_68 & _T_238;
  assign _GEN_77_1 = _GEN_84 & _T_105;
  assign _GEN_39_1 = _GEN_30 & _T_105;
  assign _GEN_29_0 = reset;
  assign _GEN_56_0 = _GEN_52 & _T_124;
  assign _GEN_26_0 = _T_669 & _T_687;
  assign _GEN_5_1 = _T_764 == 1'h0;
  assign _GEN_33_0 = _GEN_18 & _T_105;
  assign _GEN_63_0 = _GEN_60 & _T_233;
  assign _GEN_114_0 = _T_641 & _T_666;
  assign _GEN_9_0 = io_in_d_ready & io_in_d_valid;
  assign _GEN_20_0 = _T_599 & _T_619;
  assign _GEN_36_0 = _GEN_18 & _T_124;
  assign _GEN_42_0 = _GEN_30 & _T_120;
  assign _GEN_2_3 = io_in_a_ready & io_in_a_valid;
  assign _GEN_117_1 = _T_712 & _T_727;
  assign _GEN_111_1 = _T_641 & _T_651;
  assign _GEN_75_0 = _GEN_76 & _T_238;
  assign _GEN_23_0 = reset;
  assign _GEN_12_0 = reset;
  assign _GEN_79_2 = _GEN_84 & _T_124;
  assign _GEN_89_1 = _GEN_92 & _T_482;
  assign _GEN_58_1 = _GEN_52 & _T_238;
  assign _GEN_65_1 = _GEN_68 & _T_105;
  assign _GEN_35_0 = _GEN_18 & _T_120;
  assign _GEN_69_1 = _GEN_68 & _T_361;
  assign _GEN_62_0 = _GEN_60 & _T_124;
  assign _GEN_22_0 = _T_599 & _T_619;
  assign _GEN_51_0 = _GEN_44 & _T_233;
  assign _GEN_11_1 = _T_831 & _T_835;
  assign _GEN_38_0 = _GEN_18 & _T_137;
  assign _GEN_45_0 = _GEN_30 & _T_130;
  assign _GEN_113_0 = _T_641 & _T_661;
  assign _GEN_4_2 = io_in_d_ready & io_in_d_valid;
  assign _GEN_32_0 = _GEN_18 & _T_105;
  assign _GEN_25_0 = _T_669 & _T_687;
  assign _GEN_48_0 = _GEN_44 & _T_219;
  assign _GEN_8_3 = _T_792 == 1'h0;
  assign _GEN_122_1 = _T_836 & _T_845;
  assign _GEN_28_0 = reset;
  assign _GEN_1_2 = _T_613 == 1'h0;
  assign _GEN_19_0 = _T_599 & _T_619;
  assign _GEN_74_1 = _GEN_76 & _T_400;
  assign _GEN_85_3 = _GEN_90 & _T_482;
  assign _GEN_110_1 = _T_641 & _T_646;
  assign _GEN_67_1 = _GEN_68 & _T_124;
  assign _GEN_71_1 = _GEN_76 & _T_105;
  assign _GEN_54_0 = _GEN_52 & _T_219;
  assign _GEN_47_0 = _GEN_30 & _T_137;
  assign _GEN_81_2 = io_in_d_valid & _T_444;
  assign _GEN_40_0 = _GEN_30 & _T_105;
  assign _GEN_27_0 = reset;
  assign _GEN_64_1 = _GEN_60 & _T_327;
  assign _GEN_57_1 = _GEN_52 & _T_233;
  assign _GEN_50_0 = _GEN_44 & _T_124;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  _T_613 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_630 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_632 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_634 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_636 = _RAND_4[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_638 = _RAND_5[28:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_681 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_698 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_702 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  _T_704 = _RAND_9[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {4{$random}};
  _T_749 = _RAND_10[127:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_764 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_792 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      _T_613 <= 1'h0;
    end else begin
      if (reset) begin
        _T_613 <= 1'h0;
      end else begin
        if (_T_599) begin
          if (_T_619) begin
            _T_613 <= 1'h0;
          end else begin
            _T_613 <= _T_617;
          end
        end
      end
    end
    if (metaReset) begin
      _T_630 <= 3'h0;
    end else begin
      if (_T_668) begin
        _T_630 <= io_in_a_bits_opcode;
      end
    end
    if (metaReset) begin
      _T_632 <= 3'h0;
    end else begin
      if (_T_668) begin
        _T_632 <= io_in_a_bits_param;
      end
    end
    if (metaReset) begin
      _T_634 <= 2'h0;
    end else begin
      if (_T_668) begin
        _T_634 <= io_in_a_bits_size;
      end
    end
    if (metaReset) begin
      _T_636 <= 7'h0;
    end else begin
      if (_T_668) begin
        _T_636 <= io_in_a_bits_source;
      end
    end
    if (metaReset) begin
      _T_638 <= 29'h0;
    end else begin
      if (_T_668) begin
        _T_638 <= io_in_a_bits_address;
      end
    end
    if (metaReset) begin
      _T_681 <= 1'h0;
    end else begin
      if (reset) begin
        _T_681 <= 1'h0;
      end else begin
        if (_T_669) begin
          if (_T_687) begin
            _T_681 <= 1'h0;
          end else begin
            _T_681 <= _T_685;
          end
        end
      end
    end
    if (metaReset) begin
      _T_698 <= 3'h0;
    end else begin
      if (_T_746) begin
        _T_698 <= io_in_d_bits_opcode;
      end
    end
    if (metaReset) begin
      _T_702 <= 2'h0;
    end else begin
      if (_T_746) begin
        _T_702 <= io_in_d_bits_size;
      end
    end
    if (metaReset) begin
      _T_704 <= 7'h0;
    end else begin
      if (_T_746) begin
        _T_704 <= io_in_d_bits_source;
      end
    end
    if (metaReset) begin
      _T_749 <= 128'h0;
    end else begin
      if (reset) begin
        _T_749 <= 128'h0;
      end else begin
        _T_749 <= _T_848;
      end
    end
    if (metaReset) begin
      _T_764 <= 1'h0;
    end else begin
      if (reset) begin
        _T_764 <= 1'h0;
      end else begin
        if (_T_599) begin
          if (_T_770) begin
            _T_764 <= 1'h0;
          end else begin
            _T_764 <= _T_768;
          end
        end
      end
    end
    if (metaReset) begin
      _T_792 <= 1'h0;
    end else begin
      if (reset) begin
        _T_792 <= 1'h0;
      end else begin
        if (_T_669) begin
          if (_T_798) begin
            _T_792 <= 1'h0;
          end else begin
            _T_792 <= _T_796;
          end
        end
      end
    end
  end
endmodule
module SPIFIFO_1( // @[:TLSPI.fir@3476.2]
  input        metaReset,
  input        clock, // @[:TLSPI.fir@3477.4]
  input        reset, // @[:TLSPI.fir@3478.4]
  input  [1:0] io_ctrl_fmt_proto, // @[:TLSPI.fir@3479.4]
  input        io_ctrl_fmt_endian, // @[:TLSPI.fir@3479.4]
  input        io_ctrl_fmt_iodir, // @[:TLSPI.fir@3479.4]
  input  [3:0] io_ctrl_fmt_len, // @[:TLSPI.fir@3479.4]
  input  [1:0] io_ctrl_cs_mode, // @[:TLSPI.fir@3479.4]
  input  [3:0] io_ctrl_wm_tx, // @[:TLSPI.fir@3479.4]
  input  [3:0] io_ctrl_wm_rx, // @[:TLSPI.fir@3479.4]
  input        io_link_tx_ready, // @[:TLSPI.fir@3479.4]
  output       io_link_tx_valid, // @[:TLSPI.fir@3479.4]
  output [7:0] io_link_tx_bits, // @[:TLSPI.fir@3479.4]
  input        io_link_rx_valid, // @[:TLSPI.fir@3479.4]
  input  [7:0] io_link_rx_bits, // @[:TLSPI.fir@3479.4]
  output [7:0] io_link_cnt, // @[:TLSPI.fir@3479.4]
  output [1:0] io_link_fmt_proto, // @[:TLSPI.fir@3479.4]
  output       io_link_fmt_endian, // @[:TLSPI.fir@3479.4]
  output       io_link_fmt_iodir, // @[:TLSPI.fir@3479.4]
  output       io_link_cs_set, // @[:TLSPI.fir@3479.4]
  output       io_link_cs_clear, // @[:TLSPI.fir@3479.4]
  output       io_tx_ready, // @[:TLSPI.fir@3479.4]
  input        io_tx_valid, // @[:TLSPI.fir@3479.4]
  input  [7:0] io_tx_bits, // @[:TLSPI.fir@3479.4]
  input        io_rx_ready, // @[:TLSPI.fir@3479.4]
  output       io_rx_valid, // @[:TLSPI.fir@3479.4]
  output [7:0] io_rx_bits, // @[:TLSPI.fir@3479.4]
  output       io_ip_txwm, // @[:TLSPI.fir@3479.4]
  output       io_ip_rxwm, // @[:TLSPI.fir@3479.4]
  output       _GEN_2_0,
  output       _GEN_2_1,
  output       _GEN_8_0,
  output       _GEN_5_0,
  output       _GEN_2_2,
  output       _GEN_8_1,
  output       _GEN_8_2,
  output       _GEN_10_1,
  output       _GEN_7_1,
  output       _GEN_7_2,
  output       _GEN_7_3,
  output       _GEN_1_0,
  output       _GEN_4_1,
  output       _GEN_1_1,
  output       _GEN_9_1,
  output       _GEN_3_1,
  output       _GEN_3_2,
  output       _GEN_6_0,
  output       _GEN_0_0,
  output       _GEN_0_1,
  output       _GEN_3_3
);
  wire  txq_metaReset; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq_clock; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq_reset; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq_io_enq_ready; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq_io_enq_valid; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire [7:0] txq_io_enq_bits; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq_io_deq_ready; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq_io_deq_valid; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire [7:0] txq_io_deq_bits; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire [3:0] txq_io_count; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq__GEN_2_2; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq__GEN_8_1; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq__GEN_7_1; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq__GEN_1_1; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq__GEN_3_2; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  txq__GEN_0_1; // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
  wire  rxq_metaReset; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq_clock; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq_reset; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq_io_enq_ready; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq_io_enq_valid; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire [7:0] rxq_io_enq_bits; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq_io_deq_ready; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq_io_deq_valid; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire [7:0] rxq_io_deq_bits; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire [3:0] rxq_io_count; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq__GEN_2_1; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq__GEN_8_2; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq__GEN_7_2; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq__GEN_1_0; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq__GEN_0_0; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  wire  rxq__GEN_3_3; // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
  reg  rxen; // @[SPIFIFO.scala 29:17:TLSPI.fir@3495.4]
  reg [31:0] _RAND_0;
  reg [1:0] cs_mode; // @[SPIFIFO.scala 48:24:TLSPI.fir@3535.4]
  reg [31:0] _RAND_1;
  wire  fire_tx; // @[Decoupled.scala 37:37:TLSPI.fir@3494.4]
  wire  _T_34; // @[SPIFIFO.scala 39:32:TLSPI.fir@3504.6]
  wire  _T_38; // @[SPIConsts.scala 13:48:TLSPI.fir@3507.4]
  wire  _T_39; // @[SPIConsts.scala 13:48:TLSPI.fir@3508.4]
  wire  _T_40; // @[SPIConsts.scala 13:48:TLSPI.fir@3509.4]
  wire [2:0] _T_42; // @[SPIFIFO.scala 43:73:TLSPI.fir@3511.4]
  wire [1:0] _T_43; // @[SPIFIFO.scala 43:73:TLSPI.fir@3512.4]
  wire [3:0] _T_46; // @[Mux.scala 19:72:TLSPI.fir@3513.4]
  wire [2:0] _T_48; // @[Mux.scala 19:72:TLSPI.fir@3514.4]
  wire [1:0] _T_50; // @[Mux.scala 19:72:TLSPI.fir@3515.4]
  wire [3:0] _GEN_11; // @[Mux.scala 19:72:TLSPI.fir@3516.4]
  wire [3:0] _T_51; // @[Mux.scala 19:72:TLSPI.fir@3516.4]
  wire [3:0] _GEN_12; // @[Mux.scala 19:72:TLSPI.fir@3517.4]
  wire [3:0] cnt_quot; // @[Mux.scala 19:72:TLSPI.fir@3517.4]
  wire  _T_55; // @[SPIFIFO.scala 44:83:TLSPI.fir@3520.4]
  wire [1:0] _T_58; // @[SPIFIFO.scala 44:83:TLSPI.fir@3522.4]
  wire  _T_60; // @[SPIFIFO.scala 44:92:TLSPI.fir@3523.4]
  wire  _T_65; // @[Mux.scala 19:72:TLSPI.fir@3525.4]
  wire  _T_67; // @[Mux.scala 19:72:TLSPI.fir@3526.4]
  wire  cnt_rmdr; // @[Mux.scala 19:72:TLSPI.fir@3528.4]
  wire [3:0] _GEN_13; // @[SPIFIFO.scala 46:27:TLSPI.fir@3532.4]
  wire [4:0] _T_71; // @[SPIFIFO.scala 46:27:TLSPI.fir@3532.4]
  wire  cs_mode_hold; // @[SPIFIFO.scala 49:31:TLSPI.fir@3537.4]
  wire  cs_mode_off; // @[SPIFIFO.scala 50:30:TLSPI.fir@3538.4]
  wire  cs_update; // @[SPIFIFO.scala 51:28:TLSPI.fir@3539.4]
  wire  _T_77; // @[SPIFIFO.scala 52:33:TLSPI.fir@3540.4]
  wire  cs_clear; // @[SPIFIFO.scala 52:18:TLSPI.fir@3541.4]
  wire  _T_81; // @[SPIFIFO.scala 55:45:TLSPI.fir@3544.4]
  wire [3:0] _GEN_14;
  Queue_18 txq ( // @[SPIFIFO.scala 21:19:TLSPI.fir@3484.4]
    .metaReset(txq_metaReset),
    .clock(txq_clock),
    .reset(txq_reset),
    .io_enq_ready(txq_io_enq_ready),
    .io_enq_valid(txq_io_enq_valid),
    .io_enq_bits(txq_io_enq_bits),
    .io_deq_ready(txq_io_deq_ready),
    .io_deq_valid(txq_io_deq_valid),
    .io_deq_bits(txq_io_deq_bits),
    .io_count(txq_io_count),
    ._GEN_2_2(txq__GEN_2_2),
    ._GEN_8_1(txq__GEN_8_1),
    ._GEN_7_1(txq__GEN_7_1),
    ._GEN_1_1(txq__GEN_1_1),
    ._GEN_3_2(txq__GEN_3_2),
    ._GEN_0_1(txq__GEN_0_1)
  );
  Queue_19 rxq ( // @[SPIFIFO.scala 22:19:TLSPI.fir@3488.4]
    .metaReset(rxq_metaReset),
    .clock(rxq_clock),
    .reset(rxq_reset),
    .io_enq_ready(rxq_io_enq_ready),
    .io_enq_valid(rxq_io_enq_valid),
    .io_enq_bits(rxq_io_enq_bits),
    .io_deq_ready(rxq_io_deq_ready),
    .io_deq_valid(rxq_io_deq_valid),
    .io_deq_bits(rxq_io_deq_bits),
    .io_count(rxq_io_count),
    ._GEN_2_1(rxq__GEN_2_1),
    ._GEN_8_2(rxq__GEN_8_2),
    ._GEN_7_2(rxq__GEN_7_2),
    ._GEN_1_0(rxq__GEN_1_0),
    ._GEN_0_0(rxq__GEN_0_0),
    ._GEN_3_3(rxq__GEN_3_3)
  );
  assign txq_metaReset = metaReset;
  assign rxq_metaReset = metaReset;
  assign fire_tx = io_link_tx_ready & io_link_tx_valid; // @[Decoupled.scala 37:37:TLSPI.fir@3494.4]
  assign _T_34 = io_link_fmt_iodir == 1'h0; // @[SPIFIFO.scala 39:32:TLSPI.fir@3504.6]
  assign _T_38 = 2'h0 == io_link_fmt_proto; // @[SPIConsts.scala 13:48:TLSPI.fir@3507.4]
  assign _T_39 = 2'h1 == io_link_fmt_proto; // @[SPIConsts.scala 13:48:TLSPI.fir@3508.4]
  assign _T_40 = 2'h2 == io_link_fmt_proto; // @[SPIConsts.scala 13:48:TLSPI.fir@3509.4]
  assign _T_42 = io_ctrl_fmt_len[3:1]; // @[SPIFIFO.scala 43:73:TLSPI.fir@3511.4]
  assign _T_43 = io_ctrl_fmt_len[3:2]; // @[SPIFIFO.scala 43:73:TLSPI.fir@3512.4]
  assign _T_46 = _T_38 ? io_ctrl_fmt_len : 4'h0; // @[Mux.scala 19:72:TLSPI.fir@3513.4]
  assign _T_48 = _T_39 ? _T_42 : 3'h0; // @[Mux.scala 19:72:TLSPI.fir@3514.4]
  assign _T_50 = _T_40 ? _T_43 : 2'h0; // @[Mux.scala 19:72:TLSPI.fir@3515.4]
  assign _GEN_11 = {{1'd0}, _T_48}; // @[Mux.scala 19:72:TLSPI.fir@3516.4]
  assign _T_51 = _T_46 | _GEN_11; // @[Mux.scala 19:72:TLSPI.fir@3516.4]
  assign _GEN_12 = {{2'd0}, _T_50}; // @[Mux.scala 19:72:TLSPI.fir@3517.4]
  assign cnt_quot = _T_51 | _GEN_12; // @[Mux.scala 19:72:TLSPI.fir@3517.4]
  assign _T_55 = io_ctrl_fmt_len[0]; // @[SPIFIFO.scala 44:83:TLSPI.fir@3520.4]
  assign _T_58 = io_ctrl_fmt_len[1:0]; // @[SPIFIFO.scala 44:83:TLSPI.fir@3522.4]
  assign _T_60 = _T_58 != 2'h0; // @[SPIFIFO.scala 44:92:TLSPI.fir@3523.4]
  assign _T_65 = _T_39 ? _T_55 : 1'h0; // @[Mux.scala 19:72:TLSPI.fir@3525.4]
  assign _T_67 = _T_40 ? _T_60 : 1'h0; // @[Mux.scala 19:72:TLSPI.fir@3526.4]
  assign cnt_rmdr = _T_65 | _T_67; // @[Mux.scala 19:72:TLSPI.fir@3528.4]
  assign _GEN_13 = {{3'd0}, cnt_rmdr}; // @[SPIFIFO.scala 46:27:TLSPI.fir@3532.4]
  assign _T_71 = cnt_quot + _GEN_13; // @[SPIFIFO.scala 46:27:TLSPI.fir@3532.4]
  assign cs_mode_hold = cs_mode == 2'h2; // @[SPIFIFO.scala 49:31:TLSPI.fir@3537.4]
  assign cs_mode_off = cs_mode == 2'h3; // @[SPIFIFO.scala 50:30:TLSPI.fir@3538.4]
  assign cs_update = cs_mode != io_ctrl_cs_mode; // @[SPIFIFO.scala 51:28:TLSPI.fir@3539.4]
  assign _T_77 = cs_mode_hold | cs_mode_off; // @[SPIFIFO.scala 52:33:TLSPI.fir@3540.4]
  assign cs_clear = _T_77 == 1'h0; // @[SPIFIFO.scala 52:18:TLSPI.fir@3541.4]
  assign _T_81 = fire_tx & cs_clear; // @[SPIFIFO.scala 55:45:TLSPI.fir@3544.4]
  assign io_link_tx_valid = txq_io_deq_valid;
  assign io_link_tx_bits = txq_io_deq_bits;
  assign _GEN_14 = _T_71[3:0];
  assign io_link_cnt = {{4'd0}, _GEN_14};
  assign io_link_fmt_proto = io_ctrl_fmt_proto;
  assign io_link_fmt_endian = io_ctrl_fmt_endian;
  assign io_link_fmt_iodir = io_ctrl_fmt_iodir;
  assign io_link_cs_set = cs_mode_off == 1'h0;
  assign io_link_cs_clear = cs_update | _T_81;
  assign io_tx_ready = txq_io_enq_ready;
  assign io_rx_valid = rxq_io_deq_valid;
  assign io_rx_bits = rxq_io_deq_bits;
  assign io_ip_txwm = txq_io_count < io_ctrl_wm_tx;
  assign io_ip_rxwm = rxq_io_count > io_ctrl_wm_rx;
  assign _GEN_2_0 = io_link_rx_valid;
  assign _GEN_2_1 = rxq__GEN_2_1;
  assign _GEN_8_0 = 2'h2 == io_link_fmt_proto;
  assign _GEN_5_0 = 2'h1 == io_link_fmt_proto;
  assign _GEN_2_2 = txq__GEN_2_2;
  assign _GEN_8_1 = txq__GEN_8_1;
  assign _GEN_8_2 = rxq__GEN_8_2;
  assign _GEN_10_1 = reset;
  assign _GEN_7_1 = txq__GEN_7_1;
  assign _GEN_7_2 = rxq__GEN_7_2;
  assign _GEN_7_3 = 2'h1 == io_link_fmt_proto;
  assign _GEN_1_0 = rxq__GEN_1_0;
  assign _GEN_4_1 = 2'h0 == io_link_fmt_proto;
  assign _GEN_1_1 = txq__GEN_1_1;
  assign _GEN_9_1 = reset;
  assign _GEN_3_1 = io_link_tx_ready & io_link_tx_valid;
  assign _GEN_3_2 = txq__GEN_3_2;
  assign _GEN_6_0 = 2'h2 == io_link_fmt_proto;
  assign _GEN_0_0 = rxq__GEN_0_0;
  assign _GEN_0_1 = txq__GEN_0_1;
  assign _GEN_3_3 = rxq__GEN_3_3;
  assign txq_clock = clock;
  assign txq_reset = reset;
  assign txq_io_enq_valid = io_tx_valid;
  assign txq_io_enq_bits = io_tx_bits;
  assign txq_io_deq_ready = io_link_tx_ready;
  assign rxq_clock = clock;
  assign rxq_reset = reset;
  assign rxq_io_enq_valid = io_link_rx_valid & rxen;
  assign rxq_io_enq_bits = io_link_rx_bits;
  assign rxq_io_deq_ready = io_rx_ready;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  rxen = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  cs_mode = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      rxen <= 1'h0;
    end else begin
      if (reset) begin
        rxen <= 1'h0;
      end else begin
        if (fire_tx) begin
          rxen <= _T_34;
        end else begin
          if (io_link_rx_valid) begin
            rxen <= 1'h0;
          end
        end
      end
    end
    if (metaReset) begin
      cs_mode <= 2'h0;
    end else begin
      if (reset) begin
        cs_mode <= 2'h0;
      end else begin
        cs_mode <= io_ctrl_cs_mode;
      end
    end
  end
endmodule
module SPIMedia_1( // @[:TLSPI.fir@3555.2]
  input         metaReset,
  input         clock, // @[:TLSPI.fir@3556.4]
  input         reset, // @[:TLSPI.fir@3557.4]
  output        io_port_sck, // @[:TLSPI.fir@3558.4]
  input         io_port_dq_0_i, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_0_o, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_0_oe, // @[:TLSPI.fir@3558.4]
  input         io_port_dq_1_i, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_1_o, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_1_oe, // @[:TLSPI.fir@3558.4]
  input         io_port_dq_2_i, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_2_o, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_2_oe, // @[:TLSPI.fir@3558.4]
  input         io_port_dq_3_i, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_3_o, // @[:TLSPI.fir@3558.4]
  output        io_port_dq_3_oe, // @[:TLSPI.fir@3558.4]
  output        io_port_cs_0, // @[:TLSPI.fir@3558.4]
  output        io_port_cs_1, // @[:TLSPI.fir@3558.4]
  output        io_port_cs_2, // @[:TLSPI.fir@3558.4]
  output        io_port_cs_3, // @[:TLSPI.fir@3558.4]
  input  [11:0] io_ctrl_sck_div, // @[:TLSPI.fir@3558.4]
  input         io_ctrl_sck_pol, // @[:TLSPI.fir@3558.4]
  input         io_ctrl_sck_pha, // @[:TLSPI.fir@3558.4]
  input  [7:0]  io_ctrl_dla_cssck, // @[:TLSPI.fir@3558.4]
  input  [7:0]  io_ctrl_dla_sckcs, // @[:TLSPI.fir@3558.4]
  input  [7:0]  io_ctrl_dla_intercs, // @[:TLSPI.fir@3558.4]
  input  [7:0]  io_ctrl_dla_interxfr, // @[:TLSPI.fir@3558.4]
  input  [1:0]  io_ctrl_cs_id, // @[:TLSPI.fir@3558.4]
  input         io_ctrl_cs_dflt_0, // @[:TLSPI.fir@3558.4]
  input         io_ctrl_cs_dflt_1, // @[:TLSPI.fir@3558.4]
  input         io_ctrl_cs_dflt_2, // @[:TLSPI.fir@3558.4]
  input         io_ctrl_cs_dflt_3, // @[:TLSPI.fir@3558.4]
  output        io_link_tx_ready, // @[:TLSPI.fir@3558.4]
  input         io_link_tx_valid, // @[:TLSPI.fir@3558.4]
  input  [7:0]  io_link_tx_bits, // @[:TLSPI.fir@3558.4]
  output        io_link_rx_valid, // @[:TLSPI.fir@3558.4]
  output [7:0]  io_link_rx_bits, // @[:TLSPI.fir@3558.4]
  input  [7:0]  io_link_cnt, // @[:TLSPI.fir@3558.4]
  input  [1:0]  io_link_fmt_proto, // @[:TLSPI.fir@3558.4]
  input         io_link_fmt_endian, // @[:TLSPI.fir@3558.4]
  input         io_link_fmt_iodir, // @[:TLSPI.fir@3558.4]
  input         io_link_cs_set, // @[:TLSPI.fir@3558.4]
  input         io_link_cs_clear, // @[:TLSPI.fir@3558.4]
  output        _GEN_14_0,
  output        _GEN_95_0,
  output        _GEN_80_0,
  output        _GEN_80_1,
  output        _GEN_73_0,
  output        _GEN_74_0,
  output        _GEN_58_0,
  output        _GEN_68_0,
  output        _GEN_66_0,
  output        _GEN_4_0,
  output        _GEN_61_1,
  output        _GEN_130_0,
  output        _GEN_140,
  output        _GEN_130_1,
  output        _GEN_124_1,
  output        _GEN_39_0,
  output        _GEN_124_2,
  output        _GEN_77_0,
  output        _GEN_112_1,
  output        _GEN_106_1,
  output        _GEN_133_1,
  output        _GEN_118_2,
  output        _GEN_127_1,
  output        _GEN_133_2,
  output        _GEN_127_2,
  output        _GEN_143,
  output        _GEN_112_2,
  output        _GEN_106_2,
  output        _GEN_88_0,
  output        _GEN_94_1,
  output        _GEN_79_0,
  output        _GEN_121_2,
  output        _GEN_100_1,
  output        _GEN_79_1,
  output        _GEN_136_0,
  output        _GEN_115_2,
  output        _GEN_100_2,
  output        _GEN_121_3,
  output        _GEN_136_1,
  output        _GEN_94_2,
  output        _GEN_115_3,
  output        _GEN_103_1,
  output        _GEN_97_1,
  output        _GEN_88_1,
  output        _GEN_82_0,
  output        _GEN_97_2,
  output        _GEN_109_2,
  output        _GEN_60_0,
  output        _GEN_82_1,
  output        _GEN_109_3,
  output        _GEN_118_3,
  output        _GEN_76_0,
  output        _GEN_76_1,
  output        _GEN_103_2,
  output        _GEN_91_1,
  output        _GEN_142_0,
  output        _GEN_69_0,
  output        _GEN_70_1,
  output        _GEN_91_2,
  output        _GEN_85_0,
  output        _GEN_85_1,
  output        _GEN_57_0,
  output        _GEN_61_2,
  output        _GEN_63_1,
  output        _GEN_72_0,
  output        _GEN_73_2,
  output        _GEN_67_0,
  output        _GEN_135_1,
  output        _GEN_65_0,
  output        _GEN_135_2,
  output        _GEN_11_0,
  output        _GEN_129_1,
  output        _GEN_108_1,
  output        _GEN_117_2,
  output        _GEN_117_3,
  output        _GEN_139_0,
  output        _GEN_123_1,
  output        _GEN_129_2,
  output        _GEN_138_0,
  output        _GEN_21_1,
  output        _GEN_123_2,
  output        _GEN_105_2,
  output        _GEN_126_1,
  output        _GEN_111_2,
  output        _GEN_111_3,
  output        _GEN_126_2,
  output        _GEN_105_3,
  output        _GEN_132_1,
  output        _GEN_132_2,
  output        _GEN_90_0,
  output        _GEN_90_1,
  output        _GEN_71_0,
  output        _GEN_108_3,
  output        _GEN_99_2,
  output        _GEN_99_3,
  output        _GEN_93_0,
  output        _GEN_87_1,
  output        _GEN_120_2,
  output        _GEN_114_2,
  output        _GEN_78_0,
  output        _GEN_72_2,
  output        _GEN_87_2,
  output        _GEN_93_1,
  output        _GEN_120_3,
  output        _GEN_114_3,
  output        _GEN_102_2,
  output        _GEN_75_1,
  output        _GEN_75_2,
  output        _GEN_102_3,
  output        _GEN_96_2,
  output        _GEN_59_1,
  output        _GEN_96_3,
  output        _GEN_81_0,
  output        _GEN_20_1,
  output        _GEN_81_1,
  output        _GEN_68_1,
  output        _GEN_131_0,
  output        _GEN_78_1,
  output        _GEN_141_0,
  output        _GEN_84_0,
  output        _GEN_69_2,
  output        _GEN_84_1,
  output        _GEN_43_1,
  output        _GEN_62_1,
  output        _GEN_55_1,
  output        _GEN_134_1,
  output        _GEN_144_0,
  output        _GEN_10_2,
  output        _GEN_66_2,
  output        _GEN_119_1,
  output        _GEN_119_2,
  output        _GEN_128_1,
  output        _GEN_134_2,
  output        _GEN_113_1,
  output        _GEN_64_0,
  output        _GEN_137_1,
  output        _GEN_101_1,
  output        _GEN_122_2,
  output        _GEN_122_3,
  output        _GEN_116_2,
  output        _GEN_116_3,
  output        _GEN_128_2,
  output        _GEN_137_2,
  output        _GEN_101_2,
  output        _GEN_95_3,
  output        _GEN_89_2,
  output        _GEN_83_2,
  output        _GEN_104_2,
  output        _GEN_77_2,
  output        _GEN_104_3,
  output        _GEN_125_1,
  output        _GEN_83_3,
  output        _GEN_131_2,
  output        _GEN_89_3,
  output        _GEN_110_2,
  output        _GEN_98_2,
  output        _GEN_110_3,
  output        _GEN_125_2,
  output        _GEN_107_2,
  output        _GEN_113_3,
  output        _GEN_65_2,
  output        _GEN_92_1,
  output        _GEN_70_2,
  output        _GEN_86_2,
  output        _GEN_86_3,
  output        _GEN_92_2,
  output        _GEN_71_2,
  output        _GEN_63_2,
  output        _GEN_98_3,
  output        _GEN_107_3
);
  wire  phy_metaReset; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_clock; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_reset; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_sck; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_0_i; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_0_o; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_0_oe; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_1_i; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_1_o; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_1_oe; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_2_i; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_2_o; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_2_oe; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_3_i; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_3_o; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_port_dq_3_oe; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire [11:0] phy_io_ctrl_sck_div; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_ctrl_sck_pol; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_ctrl_sck_pha; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire [1:0] phy_io_ctrl_fmt_proto; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_ctrl_fmt_endian; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_ctrl_fmt_iodir; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_op_ready; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_op_valid; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_op_bits_fn; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_op_bits_stb; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire [7:0] phy_io_op_bits_cnt; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire [7:0] phy_io_op_bits_data; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy_io_rx_valid; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire [7:0] phy_io_rx_bits; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_14_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_80_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_74_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_58_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_68_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_61_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_140_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_130_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_39_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_124_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_106_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_133_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_127_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_143_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_112_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_88_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_94_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_79_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_100_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_115_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_121_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_136_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_103_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_97_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_60_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_82_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_109_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_118_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_76_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_91_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_142_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_70_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_85_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_57_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_63_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_73_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_67_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_135_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_11_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_129_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_117_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_139_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_138_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_21_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_123_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_105_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_111_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_126_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_132_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_90_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_108_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_99_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_93_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_114_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_72_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_87_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_120_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_75_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_102_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_59_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_96_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_20_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_81_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_131_0; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_78_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_141_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_69_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_84_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_62_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_55_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_134_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_144_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_10_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_66_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_119_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_128_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_113_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_101_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_122_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_116_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_137_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_95_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_89_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_83_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_77_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_104_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_110_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_98_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_125_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_107_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_65_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_92_1; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_86_3; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  wire  phy__GEN_71_2; // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
  reg [1:0] cs_id; // @[SPIMedia.scala 42:15:TLSPI.fir@3574.4]
  reg [31:0] _RAND_0;
  reg  cs_dflt_0; // @[SPIMedia.scala 42:15:TLSPI.fir@3574.4]
  reg [31:0] _RAND_1;
  reg  cs_dflt_1; // @[SPIMedia.scala 42:15:TLSPI.fir@3574.4]
  reg [31:0] _RAND_2;
  reg  cs_dflt_2; // @[SPIMedia.scala 42:15:TLSPI.fir@3574.4]
  reg [31:0] _RAND_3;
  reg  cs_dflt_3; // @[SPIMedia.scala 42:15:TLSPI.fir@3574.4]
  reg [31:0] _RAND_4;
  reg  cs_set; // @[SPIMedia.scala 43:19:TLSPI.fir@3575.4]
  reg [31:0] _RAND_5;
  reg  clear; // @[SPIMedia.scala 47:18:TLSPI.fir@3598.4]
  reg [31:0] _RAND_6;
  reg  cs_assert; // @[SPIMedia.scala 48:22:TLSPI.fir@3599.4]
  reg [31:0] _RAND_7;
  reg [1:0] state; // @[SPIMedia.scala 64:18:TLSPI.fir@3613.4]
  reg [31:0] _RAND_8;
  wire [3:0] _GEN_138; // @[SPIBundle.scala 47:19:TLSPI.fir@3576.4]
  wire [3:0] _T_68; // @[SPIBundle.scala 47:19:TLSPI.fir@3576.4]
  wire [1:0] _T_69; // @[Cat.scala 30:58:TLSPI.fir@3577.4]
  wire [1:0] _T_70; // @[Cat.scala 30:58:TLSPI.fir@3578.4]
  wire [3:0] _T_71; // @[Cat.scala 30:58:TLSPI.fir@3579.4]
  wire [3:0] _T_72; // @[SPIBundle.scala 48:33:TLSPI.fir@3580.4]
  wire  cs_active_0; // @[SPIBundle.scala 49:32:TLSPI.fir@3581.4]
  wire  cs_active_1; // @[SPIBundle.scala 49:32:TLSPI.fir@3582.4]
  wire  cs_active_2; // @[SPIBundle.scala 49:32:TLSPI.fir@3583.4]
  wire  cs_active_3; // @[SPIBundle.scala 49:32:TLSPI.fir@3584.4]
  wire [1:0] _T_85; // @[SPIMedia.scala 45:30:TLSPI.fir@3591.4]
  wire [1:0] _T_86; // @[SPIMedia.scala 45:30:TLSPI.fir@3592.4]
  wire [3:0] _T_87; // @[SPIMedia.scala 45:30:TLSPI.fir@3593.4]
  wire [1:0] _T_88; // @[SPIMedia.scala 45:49:TLSPI.fir@3594.4]
  wire [1:0] _T_89; // @[SPIMedia.scala 45:49:TLSPI.fir@3595.4]
  wire [3:0] _T_90; // @[SPIMedia.scala 45:49:TLSPI.fir@3596.4]
  wire  cs_update; // @[SPIMedia.scala 45:37:TLSPI.fir@3597.4]
  wire  cs_deassert; // @[SPIMedia.scala 49:27:TLSPI.fir@3602.4]
  wire  _T_98; // @[SPIMedia.scala 51:39:TLSPI.fir@3603.4]
  wire  _T_99; // @[SPIMedia.scala 51:18:TLSPI.fir@3604.4]
  wire  continuous; // @[SPIMedia.scala 53:42:TLSPI.fir@3606.4]
  wire  _T_104; // @[Conditional.scala 37:30:TLSPI.fir@3614.4]
  wire  _T_107; // @[Decoupled.scala 37:37:TLSPI.fir@3628.10]
  wire [7:0] _GEN_2; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  wire  _GEN_5; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  wire  _GEN_6; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  wire  _GEN_7; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  wire [7:0] _GEN_14; // @[SPIMedia.scala 84:38:TLSPI.fir@3635.8]
  wire  _GEN_21; // @[SPIMedia.scala 84:38:TLSPI.fir@3635.8]
  wire [7:0] _GEN_23; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  wire  _GEN_25; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  wire  _GEN_26; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  wire  _GEN_27; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  wire  _GEN_28; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  wire  _T_111; // @[Conditional.scala 37:30:TLSPI.fir@3650.6]
  wire  _T_113; // @[SPIMedia.scala 102:19:TLSPI.fir@3652.8]
  wire  _T_114; // @[SPIMedia.scala 104:22:TLSPI.fir@3655.8]
  wire  _T_115; // @[Conditional.scala 37:30:TLSPI.fir@3661.8]
  wire [3:0] _GEN_139; // @[SPIBundle.scala 47:19:TLSPI.fir@3668.12]
  wire [3:0] _T_119; // @[SPIBundle.scala 47:19:TLSPI.fir@3668.12]
  wire [3:0] _T_123; // @[SPIBundle.scala 48:33:TLSPI.fir@3672.12]
  wire  _T_124; // @[SPIBundle.scala 49:32:TLSPI.fir@3673.12]
  wire  _T_125; // @[SPIBundle.scala 49:32:TLSPI.fir@3674.12]
  wire  _T_126; // @[SPIBundle.scala 49:32:TLSPI.fir@3675.12]
  wire  _T_127; // @[SPIBundle.scala 49:32:TLSPI.fir@3676.12]
  wire [7:0] _GEN_42; // @[Conditional.scala 39:67:TLSPI.fir@3662.8]
  wire  _GEN_51; // @[Conditional.scala 39:67:TLSPI.fir@3651.6]
  wire [7:0] _GEN_52; // @[Conditional.scala 39:67:TLSPI.fir@3651.6]
  wire  _GEN_54; // @[Conditional.scala 39:67:TLSPI.fir@3651.6]
  SPIPhysical_1 phy ( // @[SPIMedia.scala 31:19:TLSPI.fir@3563.4]
    .metaReset(phy_metaReset),
    .clock(phy_clock),
    .reset(phy_reset),
    .io_port_sck(phy_io_port_sck),
    .io_port_dq_0_i(phy_io_port_dq_0_i),
    .io_port_dq_0_o(phy_io_port_dq_0_o),
    .io_port_dq_0_oe(phy_io_port_dq_0_oe),
    .io_port_dq_1_i(phy_io_port_dq_1_i),
    .io_port_dq_1_o(phy_io_port_dq_1_o),
    .io_port_dq_1_oe(phy_io_port_dq_1_oe),
    .io_port_dq_2_i(phy_io_port_dq_2_i),
    .io_port_dq_2_o(phy_io_port_dq_2_o),
    .io_port_dq_2_oe(phy_io_port_dq_2_oe),
    .io_port_dq_3_i(phy_io_port_dq_3_i),
    .io_port_dq_3_o(phy_io_port_dq_3_o),
    .io_port_dq_3_oe(phy_io_port_dq_3_oe),
    .io_ctrl_sck_div(phy_io_ctrl_sck_div),
    .io_ctrl_sck_pol(phy_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(phy_io_ctrl_sck_pha),
    .io_ctrl_fmt_proto(phy_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(phy_io_ctrl_fmt_endian),
    .io_ctrl_fmt_iodir(phy_io_ctrl_fmt_iodir),
    .io_op_ready(phy_io_op_ready),
    .io_op_valid(phy_io_op_valid),
    .io_op_bits_fn(phy_io_op_bits_fn),
    .io_op_bits_stb(phy_io_op_bits_stb),
    .io_op_bits_cnt(phy_io_op_bits_cnt),
    .io_op_bits_data(phy_io_op_bits_data),
    .io_rx_valid(phy_io_rx_valid),
    .io_rx_bits(phy_io_rx_bits),
    ._GEN_14_0(phy__GEN_14_0),
    ._GEN_80_1(phy__GEN_80_1),
    ._GEN_74_0(phy__GEN_74_0),
    ._GEN_58_0(phy__GEN_58_0),
    ._GEN_68_0(phy__GEN_68_0),
    ._GEN_61_1(phy__GEN_61_1),
    ._GEN_140_0(phy__GEN_140_0),
    ._GEN_130_1(phy__GEN_130_1),
    ._GEN_39_0(phy__GEN_39_0),
    ._GEN_124_2(phy__GEN_124_2),
    ._GEN_106_1(phy__GEN_106_1),
    ._GEN_133_1(phy__GEN_133_1),
    ._GEN_127_2(phy__GEN_127_2),
    ._GEN_143_0(phy__GEN_143_0),
    ._GEN_112_2(phy__GEN_112_2),
    ._GEN_88_0(phy__GEN_88_0),
    ._GEN_94_1(phy__GEN_94_1),
    ._GEN_79_0(phy__GEN_79_0),
    ._GEN_100_1(phy__GEN_100_1),
    ._GEN_115_2(phy__GEN_115_2),
    ._GEN_121_3(phy__GEN_121_3),
    ._GEN_136_1(phy__GEN_136_1),
    ._GEN_103_1(phy__GEN_103_1),
    ._GEN_97_2(phy__GEN_97_2),
    ._GEN_60_0(phy__GEN_60_0),
    ._GEN_82_1(phy__GEN_82_1),
    ._GEN_109_3(phy__GEN_109_3),
    ._GEN_118_3(phy__GEN_118_3),
    ._GEN_76_0(phy__GEN_76_0),
    ._GEN_91_1(phy__GEN_91_1),
    ._GEN_142_1(phy__GEN_142_1),
    ._GEN_70_1(phy__GEN_70_1),
    ._GEN_85_1(phy__GEN_85_1),
    ._GEN_57_0(phy__GEN_57_0),
    ._GEN_63_1(phy__GEN_63_1),
    ._GEN_73_2(phy__GEN_73_2),
    ._GEN_67_0(phy__GEN_67_0),
    ._GEN_135_1(phy__GEN_135_1),
    ._GEN_11_0(phy__GEN_11_0),
    ._GEN_129_1(phy__GEN_129_1),
    ._GEN_117_3(phy__GEN_117_3),
    ._GEN_139_1(phy__GEN_139_1),
    ._GEN_138_1(phy__GEN_138_1),
    ._GEN_21_1(phy__GEN_21_1),
    ._GEN_123_2(phy__GEN_123_2),
    ._GEN_105_2(phy__GEN_105_2),
    ._GEN_111_3(phy__GEN_111_3),
    ._GEN_126_2(phy__GEN_126_2),
    ._GEN_132_2(phy__GEN_132_2),
    ._GEN_90_1(phy__GEN_90_1),
    ._GEN_108_3(phy__GEN_108_3),
    ._GEN_99_3(phy__GEN_99_3),
    ._GEN_93_0(phy__GEN_93_0),
    ._GEN_114_2(phy__GEN_114_2),
    ._GEN_72_2(phy__GEN_72_2),
    ._GEN_87_2(phy__GEN_87_2),
    ._GEN_120_3(phy__GEN_120_3),
    ._GEN_75_2(phy__GEN_75_2),
    ._GEN_102_3(phy__GEN_102_3),
    ._GEN_59_1(phy__GEN_59_1),
    ._GEN_96_3(phy__GEN_96_3),
    ._GEN_20_1(phy__GEN_20_1),
    ._GEN_81_1(phy__GEN_81_1),
    ._GEN_131_0(phy__GEN_131_0),
    ._GEN_78_1(phy__GEN_78_1),
    ._GEN_141_1(phy__GEN_141_1),
    ._GEN_69_2(phy__GEN_69_2),
    ._GEN_84_1(phy__GEN_84_1),
    ._GEN_62_1(phy__GEN_62_1),
    ._GEN_55_1(phy__GEN_55_1),
    ._GEN_134_1(phy__GEN_134_1),
    ._GEN_144_1(phy__GEN_144_1),
    ._GEN_10_2(phy__GEN_10_2),
    ._GEN_66_2(phy__GEN_66_2),
    ._GEN_119_1(phy__GEN_119_1),
    ._GEN_128_1(phy__GEN_128_1),
    ._GEN_113_1(phy__GEN_113_1),
    ._GEN_101_1(phy__GEN_101_1),
    ._GEN_122_3(phy__GEN_122_3),
    ._GEN_116_2(phy__GEN_116_2),
    ._GEN_137_2(phy__GEN_137_2),
    ._GEN_95_3(phy__GEN_95_3),
    ._GEN_89_2(phy__GEN_89_2),
    ._GEN_83_2(phy__GEN_83_2),
    ._GEN_77_2(phy__GEN_77_2),
    ._GEN_104_3(phy__GEN_104_3),
    ._GEN_110_2(phy__GEN_110_2),
    ._GEN_98_2(phy__GEN_98_2),
    ._GEN_125_2(phy__GEN_125_2),
    ._GEN_107_2(phy__GEN_107_2),
    ._GEN_65_2(phy__GEN_65_2),
    ._GEN_92_1(phy__GEN_92_1),
    ._GEN_86_3(phy__GEN_86_3),
    ._GEN_71_2(phy__GEN_71_2)
  );
  assign phy_metaReset = metaReset;
  assign _GEN_138 = {{3'd0}, io_link_cs_set}; // @[SPIBundle.scala 47:19:TLSPI.fir@3576.4]
  assign _T_68 = _GEN_138 << io_ctrl_cs_id; // @[SPIBundle.scala 47:19:TLSPI.fir@3576.4]
  assign _T_69 = {io_ctrl_cs_dflt_1,io_ctrl_cs_dflt_0}; // @[Cat.scala 30:58:TLSPI.fir@3577.4]
  assign _T_70 = {io_ctrl_cs_dflt_3,io_ctrl_cs_dflt_2}; // @[Cat.scala 30:58:TLSPI.fir@3578.4]
  assign _T_71 = {_T_70,_T_69}; // @[Cat.scala 30:58:TLSPI.fir@3579.4]
  assign _T_72 = _T_71 ^ _T_68; // @[SPIBundle.scala 48:33:TLSPI.fir@3580.4]
  assign cs_active_0 = _T_72[0]; // @[SPIBundle.scala 49:32:TLSPI.fir@3581.4]
  assign cs_active_1 = _T_72[1]; // @[SPIBundle.scala 49:32:TLSPI.fir@3582.4]
  assign cs_active_2 = _T_72[2]; // @[SPIBundle.scala 49:32:TLSPI.fir@3583.4]
  assign cs_active_3 = _T_72[3]; // @[SPIBundle.scala 49:32:TLSPI.fir@3584.4]
  assign _T_85 = {cs_active_1,cs_active_0}; // @[SPIMedia.scala 45:30:TLSPI.fir@3591.4]
  assign _T_86 = {cs_active_3,cs_active_2}; // @[SPIMedia.scala 45:30:TLSPI.fir@3592.4]
  assign _T_87 = {_T_86,_T_85}; // @[SPIMedia.scala 45:30:TLSPI.fir@3593.4]
  assign _T_88 = {cs_dflt_1,cs_dflt_0}; // @[SPIMedia.scala 45:49:TLSPI.fir@3594.4]
  assign _T_89 = {cs_dflt_3,cs_dflt_2}; // @[SPIMedia.scala 45:49:TLSPI.fir@3595.4]
  assign _T_90 = {_T_89,_T_88}; // @[SPIMedia.scala 45:49:TLSPI.fir@3596.4]
  assign cs_update = _T_87 != _T_90; // @[SPIMedia.scala 45:37:TLSPI.fir@3597.4]
  assign cs_deassert = clear | cs_update; // @[SPIMedia.scala 49:27:TLSPI.fir@3602.4]
  assign _T_98 = io_link_cs_clear & cs_assert; // @[SPIMedia.scala 51:39:TLSPI.fir@3603.4]
  assign _T_99 = clear | _T_98; // @[SPIMedia.scala 51:18:TLSPI.fir@3604.4]
  assign continuous = io_ctrl_dla_interxfr == 8'h0; // @[SPIMedia.scala 53:42:TLSPI.fir@3606.4]
  assign _T_104 = 2'h0 == state; // @[Conditional.scala 37:30:TLSPI.fir@3614.4]
  assign _T_107 = phy_io_op_ready & phy_io_op_valid; // @[Decoupled.scala 37:37:TLSPI.fir@3628.10]
  assign _GEN_2 = cs_deassert ? io_ctrl_dla_sckcs : io_link_cnt; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  assign _GEN_5 = cs_deassert ? 1'h0 : 1'h1; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  assign _GEN_6 = cs_deassert ? 1'h1 : io_link_tx_valid; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  assign _GEN_7 = cs_deassert ? 1'h0 : phy_io_op_ready; // @[SPIMedia.scala 69:28:TLSPI.fir@3617.8]
  assign _GEN_14 = io_link_tx_valid ? io_ctrl_dla_cssck : 8'h0; // @[SPIMedia.scala 84:38:TLSPI.fir@3635.8]
  assign _GEN_21 = io_link_tx_valid ? 1'h0 : 1'h1; // @[SPIMedia.scala 84:38:TLSPI.fir@3635.8]
  assign _GEN_23 = cs_assert ? _GEN_2 : _GEN_14; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  assign _GEN_25 = cs_assert ? cs_deassert : 1'h1; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  assign _GEN_26 = cs_assert ? _GEN_5 : _GEN_21; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  assign _GEN_27 = cs_assert ? _GEN_6 : 1'h1; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  assign _GEN_28 = cs_assert ? _GEN_7 : 1'h0; // @[SPIMedia.scala 68:24:TLSPI.fir@3616.6]
  assign _T_111 = 2'h1 == state; // @[Conditional.scala 37:30:TLSPI.fir@3650.6]
  assign _T_113 = continuous == 1'h0; // @[SPIMedia.scala 102:19:TLSPI.fir@3652.8]
  assign _T_114 = phy_io_op_ready | continuous; // @[SPIMedia.scala 104:22:TLSPI.fir@3655.8]
  assign _T_115 = 2'h2 == state; // @[Conditional.scala 37:30:TLSPI.fir@3661.8]
  assign _GEN_139 = {{3'd0}, cs_set}; // @[SPIBundle.scala 47:19:TLSPI.fir@3668.12]
  assign _T_119 = _GEN_139 << cs_id; // @[SPIBundle.scala 47:19:TLSPI.fir@3668.12]
  assign _T_123 = _T_90 ^ _T_119; // @[SPIBundle.scala 48:33:TLSPI.fir@3672.12]
  assign _T_124 = _T_123[0]; // @[SPIBundle.scala 49:32:TLSPI.fir@3673.12]
  assign _T_125 = _T_123[1]; // @[SPIBundle.scala 49:32:TLSPI.fir@3674.12]
  assign _T_126 = _T_123[2]; // @[SPIBundle.scala 49:32:TLSPI.fir@3675.12]
  assign _T_127 = _T_123[3]; // @[SPIBundle.scala 49:32:TLSPI.fir@3676.12]
  assign _GEN_42 = _T_115 ? io_ctrl_dla_intercs : io_link_cnt; // @[Conditional.scala 39:67:TLSPI.fir@3662.8]
  assign _GEN_51 = _T_111 ? _T_113 : 1'h1; // @[Conditional.scala 39:67:TLSPI.fir@3651.6]
  assign _GEN_52 = _T_111 ? io_ctrl_dla_interxfr : _GEN_42; // @[Conditional.scala 39:67:TLSPI.fir@3651.6]
  assign _GEN_54 = _T_111 ? 1'h0 : _T_115; // @[Conditional.scala 39:67:TLSPI.fir@3651.6]
  assign io_port_sck = phy_io_port_sck;
  assign io_port_dq_0_o = phy_io_port_dq_0_o;
  assign io_port_dq_0_oe = phy_io_port_dq_0_oe;
  assign io_port_dq_1_o = phy_io_port_dq_1_o;
  assign io_port_dq_1_oe = phy_io_port_dq_1_oe;
  assign io_port_dq_2_o = phy_io_port_dq_2_o;
  assign io_port_dq_2_oe = phy_io_port_dq_2_oe;
  assign io_port_dq_3_o = phy_io_port_dq_3_o;
  assign io_port_dq_3_oe = phy_io_port_dq_3_oe;
  assign io_port_cs_0 = cs_dflt_0;
  assign io_port_cs_1 = cs_dflt_1;
  assign io_port_cs_2 = cs_dflt_2;
  assign io_port_cs_3 = cs_dflt_3;
  assign io_link_tx_ready = _T_104 ? _GEN_28 : 1'h0;
  assign io_link_rx_valid = phy_io_rx_valid;
  assign io_link_rx_bits = phy_io_rx_bits;
  assign _GEN_14_0 = phy__GEN_14_0;
  assign _GEN_95_0 = cs_assert;
  assign _GEN_80_0 = io_link_tx_valid;
  assign _GEN_80_1 = phy__GEN_80_1;
  assign _GEN_73_0 = phy_io_op_ready;
  assign _GEN_74_0 = phy__GEN_74_0;
  assign _GEN_58_0 = phy__GEN_58_0;
  assign _GEN_68_0 = phy__GEN_68_0;
  assign _GEN_66_0 = clear | cs_update;
  assign _GEN_4_0 = phy_io_op_ready;
  assign _GEN_61_1 = phy__GEN_61_1;
  assign _GEN_130_0 = 2'h0 == state;
  assign _GEN_140 = phy__GEN_140_0;
  assign _GEN_130_1 = phy__GEN_130_1;
  assign _GEN_124_1 = 2'h0 == state;
  assign _GEN_39_0 = phy__GEN_39_0;
  assign _GEN_124_2 = phy__GEN_124_2;
  assign _GEN_77_0 = io_link_tx_valid;
  assign _GEN_112_1 = 2'h1 == state;
  assign _GEN_106_1 = phy__GEN_106_1;
  assign _GEN_133_1 = phy__GEN_133_1;
  assign _GEN_118_2 = 2'h1 == state;
  assign _GEN_127_1 = 2'h0 == state;
  assign _GEN_133_2 = 2'h0 == state;
  assign _GEN_127_2 = phy__GEN_127_2;
  assign _GEN_143 = phy__GEN_143_0;
  assign _GEN_112_2 = phy__GEN_112_2;
  assign _GEN_106_2 = 2'h2 == state;
  assign _GEN_88_0 = phy__GEN_88_0;
  assign _GEN_94_1 = phy__GEN_94_1;
  assign _GEN_79_0 = phy__GEN_79_0;
  assign _GEN_121_2 = 2'h0 == state;
  assign _GEN_100_1 = phy__GEN_100_1;
  assign _GEN_79_1 = io_link_tx_valid;
  assign _GEN_136_0 = reset;
  assign _GEN_115_2 = phy__GEN_115_2;
  assign _GEN_100_2 = phy_io_op_ready;
  assign _GEN_121_3 = phy__GEN_121_3;
  assign _GEN_136_1 = phy__GEN_136_1;
  assign _GEN_94_2 = cs_assert;
  assign _GEN_115_3 = 2'h1 == state;
  assign _GEN_103_1 = phy__GEN_103_1;
  assign _GEN_97_1 = phy_io_op_ready | continuous;
  assign _GEN_88_1 = cs_assert;
  assign _GEN_82_0 = io_link_tx_valid;
  assign _GEN_97_2 = phy__GEN_97_2;
  assign _GEN_109_2 = 2'h2 == state;
  assign _GEN_60_0 = phy__GEN_60_0;
  assign _GEN_82_1 = phy__GEN_82_1;
  assign _GEN_109_3 = phy__GEN_109_3;
  assign _GEN_118_3 = phy__GEN_118_3;
  assign _GEN_76_0 = phy__GEN_76_0;
  assign _GEN_76_1 = io_link_tx_valid;
  assign _GEN_103_2 = 2'h2 == state;
  assign _GEN_91_1 = phy__GEN_91_1;
  assign _GEN_142_0 = phy__GEN_142_1;
  assign _GEN_69_0 = phy_io_op_ready;
  assign _GEN_70_1 = phy__GEN_70_1;
  assign _GEN_91_2 = cs_assert;
  assign _GEN_85_0 = cs_assert;
  assign _GEN_85_1 = phy__GEN_85_1;
  assign _GEN_57_0 = phy__GEN_57_0;
  assign _GEN_61_2 = clear | cs_update;
  assign _GEN_63_1 = phy__GEN_63_1;
  assign _GEN_72_0 = phy_io_op_ready;
  assign _GEN_73_2 = phy__GEN_73_2;
  assign _GEN_67_0 = phy__GEN_67_0;
  assign _GEN_135_1 = phy__GEN_135_1;
  assign _GEN_65_0 = clear | cs_update;
  assign _GEN_135_2 = reset;
  assign _GEN_11_0 = phy__GEN_11_0;
  assign _GEN_129_1 = phy__GEN_129_1;
  assign _GEN_108_1 = 2'h2 == state;
  assign _GEN_117_2 = 2'h1 == state;
  assign _GEN_117_3 = phy__GEN_117_3;
  assign _GEN_139_0 = phy__GEN_139_1;
  assign _GEN_123_1 = 2'h0 == state;
  assign _GEN_129_2 = 2'h0 == state;
  assign _GEN_138_0 = phy__GEN_138_1;
  assign _GEN_21_1 = phy__GEN_21_1;
  assign _GEN_123_2 = phy__GEN_123_2;
  assign _GEN_105_2 = phy__GEN_105_2;
  assign _GEN_126_1 = 2'h0 == state;
  assign _GEN_111_2 = 2'h1 == state;
  assign _GEN_111_3 = phy__GEN_111_3;
  assign _GEN_126_2 = phy__GEN_126_2;
  assign _GEN_105_3 = 2'h2 == state;
  assign _GEN_132_1 = 2'h0 == state;
  assign _GEN_132_2 = phy__GEN_132_2;
  assign _GEN_90_0 = cs_assert;
  assign _GEN_90_1 = phy__GEN_90_1;
  assign _GEN_71_0 = phy_io_op_ready;
  assign _GEN_108_3 = phy__GEN_108_3;
  assign _GEN_99_2 = phy_io_op_ready;
  assign _GEN_99_3 = phy__GEN_99_3;
  assign _GEN_93_0 = phy__GEN_93_0;
  assign _GEN_87_1 = cs_assert;
  assign _GEN_120_2 = 2'h1 == state;
  assign _GEN_114_2 = phy__GEN_114_2;
  assign _GEN_78_0 = io_link_tx_valid;
  assign _GEN_72_2 = phy__GEN_72_2;
  assign _GEN_87_2 = phy__GEN_87_2;
  assign _GEN_93_1 = cs_assert;
  assign _GEN_120_3 = phy__GEN_120_3;
  assign _GEN_114_3 = 2'h1 == state;
  assign _GEN_102_2 = phy_io_op_ready;
  assign _GEN_75_1 = io_link_tx_valid;
  assign _GEN_75_2 = phy__GEN_75_2;
  assign _GEN_102_3 = phy__GEN_102_3;
  assign _GEN_96_2 = cs_assert;
  assign _GEN_59_1 = phy__GEN_59_1;
  assign _GEN_96_3 = phy__GEN_96_3;
  assign _GEN_81_0 = io_link_tx_valid;
  assign _GEN_20_1 = phy__GEN_20_1;
  assign _GEN_81_1 = phy__GEN_81_1;
  assign _GEN_68_1 = phy_io_op_ready;
  assign _GEN_131_0 = phy__GEN_131_0;
  assign _GEN_78_1 = phy__GEN_78_1;
  assign _GEN_141_0 = phy__GEN_141_1;
  assign _GEN_84_0 = cs_assert;
  assign _GEN_69_2 = phy__GEN_69_2;
  assign _GEN_84_1 = phy__GEN_84_1;
  assign _GEN_43_1 = phy_io_op_ready & phy_io_op_valid;
  assign _GEN_62_1 = phy__GEN_62_1;
  assign _GEN_55_1 = phy__GEN_55_1;
  assign _GEN_134_1 = phy__GEN_134_1;
  assign _GEN_144_0 = phy__GEN_144_1;
  assign _GEN_10_2 = phy__GEN_10_2;
  assign _GEN_66_2 = phy__GEN_66_2;
  assign _GEN_119_1 = phy__GEN_119_1;
  assign _GEN_119_2 = 2'h1 == state;
  assign _GEN_128_1 = phy__GEN_128_1;
  assign _GEN_134_2 = 2'h0 == state;
  assign _GEN_113_1 = phy__GEN_113_1;
  assign _GEN_64_0 = clear | cs_update;
  assign _GEN_137_1 = reset;
  assign _GEN_101_1 = phy__GEN_101_1;
  assign _GEN_122_2 = 2'h0 == state;
  assign _GEN_122_3 = phy__GEN_122_3;
  assign _GEN_116_2 = phy__GEN_116_2;
  assign _GEN_116_3 = 2'h1 == state;
  assign _GEN_128_2 = 2'h0 == state;
  assign _GEN_137_2 = phy__GEN_137_2;
  assign _GEN_101_2 = phy_io_op_ready;
  assign _GEN_95_3 = phy__GEN_95_3;
  assign _GEN_89_2 = phy__GEN_89_2;
  assign _GEN_83_2 = phy__GEN_83_2;
  assign _GEN_104_2 = 2'h2 == state;
  assign _GEN_77_2 = phy__GEN_77_2;
  assign _GEN_104_3 = phy__GEN_104_3;
  assign _GEN_125_1 = 2'h0 == state;
  assign _GEN_83_3 = io_link_tx_valid;
  assign _GEN_131_2 = 2'h0 == state;
  assign _GEN_89_3 = cs_assert;
  assign _GEN_110_2 = phy__GEN_110_2;
  assign _GEN_98_2 = phy__GEN_98_2;
  assign _GEN_110_3 = 2'h2 == state;
  assign _GEN_125_2 = phy__GEN_125_2;
  assign _GEN_107_2 = phy__GEN_107_2;
  assign _GEN_113_3 = 2'h1 == state;
  assign _GEN_65_2 = phy__GEN_65_2;
  assign _GEN_92_1 = phy__GEN_92_1;
  assign _GEN_70_2 = phy_io_op_ready;
  assign _GEN_86_2 = cs_assert;
  assign _GEN_86_3 = phy__GEN_86_3;
  assign _GEN_92_2 = cs_assert;
  assign _GEN_71_2 = phy__GEN_71_2;
  assign _GEN_63_2 = clear | cs_update;
  assign _GEN_98_3 = phy_io_op_ready;
  assign _GEN_107_3 = 2'h2 == state;
  assign phy_clock = clock;
  assign phy_reset = reset;
  assign phy_io_port_dq_0_i = io_port_dq_0_i;
  assign phy_io_port_dq_1_i = io_port_dq_1_i;
  assign phy_io_port_dq_2_i = io_port_dq_2_i;
  assign phy_io_port_dq_3_i = io_port_dq_3_i;
  assign phy_io_ctrl_sck_div = io_ctrl_sck_div;
  assign phy_io_ctrl_sck_pol = io_ctrl_sck_pol;
  assign phy_io_ctrl_sck_pha = io_ctrl_sck_pha;
  assign phy_io_ctrl_fmt_proto = io_link_fmt_proto;
  assign phy_io_ctrl_fmt_endian = io_link_fmt_endian;
  assign phy_io_ctrl_fmt_iodir = io_link_fmt_iodir;
  assign phy_io_op_valid = _T_104 ? _GEN_27 : _GEN_51;
  assign phy_io_op_bits_fn = _T_104 ? _GEN_25 : 1'h1;
  assign phy_io_op_bits_stb = _T_104 ? _GEN_26 : _GEN_54;
  assign phy_io_op_bits_cnt = _T_104 ? _GEN_23 : _GEN_52;
  assign phy_io_op_bits_data = io_link_tx_bits;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  cs_id = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  cs_dflt_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  cs_dflt_1 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  cs_dflt_2 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  cs_dflt_3 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  cs_set = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  clear = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  cs_assert = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  state = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      cs_id <= 2'h0;
    end else begin
      if (_T_104) begin
        if (!(cs_assert)) begin
          if (!(io_link_tx_valid)) begin
            cs_id <= io_ctrl_cs_id;
          end
        end
      end
    end
    if (metaReset) begin
      cs_dflt_0 <= 1'h0;
    end else begin
      if (_T_104) begin
        if (!(cs_assert)) begin
          if (io_link_tx_valid) begin
            if (phy_io_op_ready) begin
              cs_dflt_0 <= cs_active_0;
            end
          end else begin
            cs_dflt_0 <= io_ctrl_cs_dflt_0;
          end
        end
      end else begin
        if (!(_T_111)) begin
          if (_T_115) begin
            if (phy_io_op_ready) begin
              cs_dflt_0 <= _T_124;
            end
          end
        end
      end
    end
    if (metaReset) begin
      cs_dflt_1 <= 1'h0;
    end else begin
      if (_T_104) begin
        if (!(cs_assert)) begin
          if (io_link_tx_valid) begin
            if (phy_io_op_ready) begin
              cs_dflt_1 <= cs_active_1;
            end
          end else begin
            cs_dflt_1 <= io_ctrl_cs_dflt_1;
          end
        end
      end else begin
        if (!(_T_111)) begin
          if (_T_115) begin
            if (phy_io_op_ready) begin
              cs_dflt_1 <= _T_125;
            end
          end
        end
      end
    end
    if (metaReset) begin
      cs_dflt_2 <= 1'h0;
    end else begin
      if (_T_104) begin
        if (!(cs_assert)) begin
          if (io_link_tx_valid) begin
            if (phy_io_op_ready) begin
              cs_dflt_2 <= cs_active_2;
            end
          end else begin
            cs_dflt_2 <= io_ctrl_cs_dflt_2;
          end
        end
      end else begin
        if (!(_T_111)) begin
          if (_T_115) begin
            if (phy_io_op_ready) begin
              cs_dflt_2 <= _T_126;
            end
          end
        end
      end
    end
    if (metaReset) begin
      cs_dflt_3 <= 1'h0;
    end else begin
      if (_T_104) begin
        if (!(cs_assert)) begin
          if (io_link_tx_valid) begin
            if (phy_io_op_ready) begin
              cs_dflt_3 <= cs_active_3;
            end
          end else begin
            cs_dflt_3 <= io_ctrl_cs_dflt_3;
          end
        end
      end else begin
        if (!(_T_111)) begin
          if (_T_115) begin
            if (phy_io_op_ready) begin
              cs_dflt_3 <= _T_127;
            end
          end
        end
      end
    end
    if (metaReset) begin
      cs_set <= 1'h0;
    end else begin
      if (_T_104) begin
        if (!(cs_assert)) begin
          if (io_link_tx_valid) begin
            if (phy_io_op_ready) begin
              cs_set <= io_link_cs_set;
            end
          end
        end
      end
    end
    if (metaReset) begin
      clear <= 1'h0;
    end else begin
      if (reset) begin
        clear <= 1'h0;
      end else begin
        if (_T_104) begin
          clear <= _T_99;
        end else begin
          if (_T_111) begin
            clear <= _T_99;
          end else begin
            if (_T_115) begin
              clear <= 1'h0;
            end else begin
              clear <= _T_99;
            end
          end
        end
      end
    end
    if (metaReset) begin
      cs_assert <= 1'h0;
    end else begin
      if (reset) begin
        cs_assert <= 1'h0;
      end else begin
        if (_T_104) begin
          if (!(cs_assert)) begin
            if (io_link_tx_valid) begin
              if (phy_io_op_ready) begin
                cs_assert <= 1'h1;
              end
            end
          end
        end else begin
          if (!(_T_111)) begin
            if (_T_115) begin
              cs_assert <= 1'h0;
            end
          end
        end
      end
    end
    if (metaReset) begin
      state <= 2'h0;
    end else begin
      if (reset) begin
        state <= 2'h0;
      end else begin
        if (_T_104) begin
          if (cs_assert) begin
            if (cs_deassert) begin
              if (phy_io_op_ready) begin
                state <= 2'h2;
              end
            end else begin
              if (_T_107) begin
                state <= 2'h1;
              end
            end
          end
        end else begin
          if (_T_111) begin
            if (_T_114) begin
              state <= 2'h0;
            end
          end else begin
            if (_T_115) begin
              if (phy_io_op_ready) begin
                state <= 2'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
module Queue_18( // @[:TLSPI.fir@3698.2]
  input        metaReset,
  input        clock, // @[:TLSPI.fir@3699.4]
  input        reset, // @[:TLSPI.fir@3700.4]
  output       io_enq_ready, // @[:TLSPI.fir@3701.4]
  input        io_enq_valid, // @[:TLSPI.fir@3701.4]
  input  [7:0] io_enq_bits, // @[:TLSPI.fir@3701.4]
  input        io_deq_ready, // @[:TLSPI.fir@3701.4]
  output       io_deq_valid, // @[:TLSPI.fir@3701.4]
  output [7:0] io_deq_bits, // @[:TLSPI.fir@3701.4]
  output [3:0] io_count, // @[:TLSPI.fir@3701.4]
  output       _GEN_2_2,
  output       _GEN_8_1,
  output       _GEN_7_1,
  output       _GEN_1_1,
  output       _GEN_3_2,
  output       _GEN_0_1
);
  wire  mem_sparse_metaReset; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire  mem_sparse_clock; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire  mem_sparse_reset; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire [2:0] mem_sparse_io_w_0_addr; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire  mem_sparse_io_w_0_en; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire [7:0] mem_sparse_io_w_0_data; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire [2:0] mem_sparse_io_r_0_addr; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  wire [7:0] mem_sparse_io_r_0_data; // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
  reg [2:0] value; // @[Counter.scala 26:33:TLSPI.fir@3707.4]
  reg [31:0] _RAND_0;
  reg [2:0] value_1; // @[Counter.scala 26:33:TLSPI.fir@3708.4]
  reg [31:0] _RAND_1;
  reg  maybe_full; // @[Decoupled.scala 217:35:TLSPI.fir@3709.4]
  reg [31:0] _RAND_2;
  wire  _T_41; // @[Decoupled.scala 219:41:TLSPI.fir@3710.4]
  wire  _T_43; // @[Decoupled.scala 220:36:TLSPI.fir@3711.4]
  wire  empty; // @[Decoupled.scala 220:33:TLSPI.fir@3712.4]
  wire  _T_44; // @[Decoupled.scala 221:32:TLSPI.fir@3713.4]
  wire  do_enq; // @[Decoupled.scala 37:37:TLSPI.fir@3714.4]
  wire  do_deq; // @[Decoupled.scala 37:37:TLSPI.fir@3718.4]
  wire [3:0] _T_52; // @[Counter.scala 35:22:TLSPI.fir@3726.6]
  wire [2:0] _T_53; // @[Counter.scala 35:22:TLSPI.fir@3727.6]
  wire [3:0] _T_56; // @[Counter.scala 35:22:TLSPI.fir@3732.6]
  wire [2:0] _T_57; // @[Counter.scala 35:22:TLSPI.fir@3733.6]
  wire  _T_58; // @[Decoupled.scala 232:16:TLSPI.fir@3736.4]
  wire [3:0] _T_64; // @[Decoupled.scala 253:40:TLSPI.fir@3746.4]
  wire [3:0] _T_65; // @[Decoupled.scala 253:40:TLSPI.fir@3747.4]
  wire [2:0] _T_66; // @[Decoupled.scala 253:40:TLSPI.fir@3748.4]
  wire  _T_67; // @[Decoupled.scala 255:32:TLSPI.fir@3749.4]
  SparseMem mem_sparse ( // @[Decoupled.scala 214:24:TLSPI.fir@3706.4]
    .metaReset(mem_sparse_metaReset),
    .clock(mem_sparse_clock),
    .reset(mem_sparse_reset),
    .io_w_0_addr(mem_sparse_io_w_0_addr),
    .io_w_0_en(mem_sparse_io_w_0_en),
    .io_w_0_data(mem_sparse_io_w_0_data),
    .io_r_0_addr(mem_sparse_io_r_0_addr),
    .io_r_0_data(mem_sparse_io_r_0_data)
  );
  assign mem_sparse_metaReset = metaReset;
  assign _T_41 = value == value_1; // @[Decoupled.scala 219:41:TLSPI.fir@3710.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 220:36:TLSPI.fir@3711.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 220:33:TLSPI.fir@3712.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 221:32:TLSPI.fir@3713.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:TLSPI.fir@3714.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:TLSPI.fir@3718.4]
  assign _T_52 = value + 3'h1; // @[Counter.scala 35:22:TLSPI.fir@3726.6]
  assign _T_53 = _T_52[2:0]; // @[Counter.scala 35:22:TLSPI.fir@3727.6]
  assign _T_56 = value_1 + 3'h1; // @[Counter.scala 35:22:TLSPI.fir@3732.6]
  assign _T_57 = _T_56[2:0]; // @[Counter.scala 35:22:TLSPI.fir@3733.6]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 232:16:TLSPI.fir@3736.4]
  assign _T_64 = value - value_1; // @[Decoupled.scala 253:40:TLSPI.fir@3746.4]
  assign _T_65 = $unsigned(_T_64); // @[Decoupled.scala 253:40:TLSPI.fir@3747.4]
  assign _T_66 = _T_65[2:0]; // @[Decoupled.scala 253:40:TLSPI.fir@3748.4]
  assign _T_67 = maybe_full & _T_41; // @[Decoupled.scala 255:32:TLSPI.fir@3749.4]
  assign io_enq_ready = _T_44 == 1'h0;
  assign io_deq_valid = empty == 1'h0;
  assign io_deq_bits = mem_sparse_io_r_0_data;
  assign io_count = {_T_67,_T_66};
  assign _GEN_2_2 = do_enq != do_deq;
  assign _GEN_8_1 = reset;
  assign _GEN_7_1 = reset;
  assign _GEN_1_1 = io_deq_ready & io_deq_valid;
  assign _GEN_3_2 = reset;
  assign _GEN_0_1 = io_enq_ready & io_enq_valid;
  assign mem_sparse_clock = clock;
  assign mem_sparse_reset = reset;
  assign mem_sparse_io_w_0_addr = value;
  assign mem_sparse_io_w_0_en = io_enq_ready & io_enq_valid;
  assign mem_sparse_io_w_0_data = io_enq_bits;
  assign mem_sparse_io_r_0_addr = value_1;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  value = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  value_1 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  maybe_full = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      value <= 3'h0;
    end else begin
      if (reset) begin
        value <= 3'h0;
      end else begin
        if (do_enq) begin
          value <= _T_53;
        end
      end
    end
    if (metaReset) begin
      value_1 <= 3'h0;
    end else begin
      if (reset) begin
        value_1 <= 3'h0;
      end else begin
        if (do_deq) begin
          value_1 <= _T_57;
        end
      end
    end
    if (metaReset) begin
      maybe_full <= 1'h0;
    end else begin
      if (reset) begin
        maybe_full <= 1'h0;
      end else begin
        if (_T_58) begin
          maybe_full <= do_enq;
        end
      end
    end
  end
endmodule
module SparseMem(
  input        metaReset,
  input        clock,
  input        reset,
  input  [2:0] io_w_0_addr,
  input        io_w_0_en,
  input  [7:0] io_w_0_data,
  input  [2:0] io_r_0_addr,
  output [7:0] io_r_0_data
);
  reg [7:0] mem [0:7];
  reg [31:0] _RAND_0;
  wire [7:0] mem__T_303_data;
  wire [2:0] mem__T_303_addr;
  wire [7:0] mem__T_386_data;
  wire [2:0] mem__T_386_addr;
  wire  mem__T_386_mask;
  wire  mem__T_386_en;
  wire [2:0] _GEN_56;
  reg  addresses_0_valid;
  reg [31:0] _RAND_1;
  reg [2:0] addresses_0_bits;
  reg [31:0] _RAND_2;
  reg  addresses_1_valid;
  reg [31:0] _RAND_3;
  reg [2:0] addresses_1_bits;
  reg [31:0] _RAND_4;
  reg  addresses_2_valid;
  reg [31:0] _RAND_5;
  reg [2:0] addresses_2_bits;
  reg [31:0] _RAND_6;
  reg  addresses_3_valid;
  reg [31:0] _RAND_7;
  reg [2:0] addresses_3_bits;
  reg [31:0] _RAND_8;
  reg  addresses_4_valid;
  reg [31:0] _RAND_9;
  reg [2:0] addresses_4_bits;
  reg [31:0] _RAND_10;
  reg  addresses_5_valid;
  reg [31:0] _RAND_11;
  reg [2:0] addresses_5_bits;
  reg [31:0] _RAND_12;
  reg  addresses_6_valid;
  reg [31:0] _RAND_13;
  reg [2:0] addresses_6_bits;
  reg [31:0] _RAND_14;
  reg  addresses_7_valid;
  reg [31:0] _RAND_15;
  reg [2:0] addresses_7_bits;
  reg [31:0] _RAND_16;
  reg [3:0] nextAddr;
  reg [31:0] _RAND_17;
  wire  _T_251;
  wire  _T_252;
  wire  _T_253;
  wire  _T_254;
  wire  _T_255;
  wire  _T_256;
  wire  _T_257;
  wire  _T_258;
  wire  _T_259;
  wire  _T_260;
  wire  _T_261;
  wire  _T_262;
  wire  _T_263;
  wire  _T_264;
  wire  _T_265;
  wire  _T_266;
  wire [1:0] _T_280;
  wire [1:0] _T_281;
  wire [3:0] _T_282;
  wire [1:0] _T_283;
  wire [1:0] _T_284;
  wire [3:0] _T_285;
  wire [7:0] _T_286;
  wire  _T_288;
  wire [3:0] _T_289;
  wire [3:0] _T_290;
  wire  _T_292;
  wire [3:0] _T_293;
  wire [1:0] _T_294;
  wire [1:0] _T_295;
  wire  _T_297;
  wire [1:0] _T_298;
  wire  _T_299;
  wire [1:0] _T_300;
  wire [4:0] _T_311;
  wire [3:0] _T_312;
  wire  _T_313;
  wire  _T_314;
  wire  _T_315;
  wire  _T_316;
  wire  _T_317;
  wire  _T_318;
  wire  _T_319;
  wire  _T_320;
  wire  _T_321;
  wire  _T_322;
  wire  _T_323;
  wire  _T_324;
  wire  _T_325;
  wire  _T_326;
  wire  _T_327;
  wire  _T_328;
  wire [1:0] _T_342;
  wire [1:0] _T_343;
  wire [3:0] _T_344;
  wire [1:0] _T_345;
  wire [1:0] _T_346;
  wire [3:0] _T_347;
  wire [7:0] _T_348;
  wire  _T_350;
  wire [3:0] _T_351;
  wire [3:0] _T_352;
  wire  _T_354;
  wire [3:0] _T_355;
  wire [1:0] _T_356;
  wire [1:0] _T_357;
  wire  _T_359;
  wire [1:0] _T_360;
  wire  _T_361;
  wire [1:0] _T_362;
  wire [2:0] _T_363;
  wire  _T_365;
  wire  _T_366;
  wire [3:0] _T_367;
  wire  _GEN_36;
  wire  _GEN_37;
  wire  _GEN_38;
  wire  _GEN_39;
  wire  _GEN_40;
  wire  _GEN_41;
  wire  _GEN_42;
  wire  _GEN_43;
  wire [3:0] nextAddrUpdate;
  wire  _T_391;
  wire  _T_394;
  wire  _T_396;
  assign mem__T_303_addr = {_T_292,_T_300};
  assign mem__T_303_data = mem[mem__T_303_addr];
  assign mem__T_386_data = io_w_0_data;
  assign mem__T_386_addr = _T_367[2:0];
  assign mem__T_386_mask = io_w_0_en;
  assign mem__T_386_en = io_w_0_en;
  assign _GEN_56 = _T_367[2:0];
  assign _T_251 = addresses_0_bits == io_r_0_addr;
  assign _T_252 = addresses_0_valid & _T_251;
  assign _T_253 = addresses_1_bits == io_r_0_addr;
  assign _T_254 = addresses_1_valid & _T_253;
  assign _T_255 = addresses_2_bits == io_r_0_addr;
  assign _T_256 = addresses_2_valid & _T_255;
  assign _T_257 = addresses_3_bits == io_r_0_addr;
  assign _T_258 = addresses_3_valid & _T_257;
  assign _T_259 = addresses_4_bits == io_r_0_addr;
  assign _T_260 = addresses_4_valid & _T_259;
  assign _T_261 = addresses_5_bits == io_r_0_addr;
  assign _T_262 = addresses_5_valid & _T_261;
  assign _T_263 = addresses_6_bits == io_r_0_addr;
  assign _T_264 = addresses_6_valid & _T_263;
  assign _T_265 = addresses_7_bits == io_r_0_addr;
  assign _T_266 = addresses_7_valid & _T_265;
  assign _T_280 = {_T_254,_T_252};
  assign _T_281 = {_T_258,_T_256};
  assign _T_282 = {_T_281,_T_280};
  assign _T_283 = {_T_262,_T_260};
  assign _T_284 = {_T_266,_T_264};
  assign _T_285 = {_T_284,_T_283};
  assign _T_286 = {_T_285,_T_282};
  assign _T_288 = _T_286 != 8'h0;
  assign _T_289 = _T_286[7:4];
  assign _T_290 = _T_286[3:0];
  assign _T_292 = _T_289 != 4'h0;
  assign _T_293 = _T_289 | _T_290;
  assign _T_294 = _T_293[3:2];
  assign _T_295 = _T_293[1:0];
  assign _T_297 = _T_294 != 2'h0;
  assign _T_298 = _T_294 | _T_295;
  assign _T_299 = _T_298[1];
  assign _T_300 = {_T_297,_T_299};
  assign _T_311 = nextAddr + 4'h1;
  assign _T_312 = _T_311[3:0];
  assign _T_313 = addresses_0_bits == io_w_0_addr;
  assign _T_314 = addresses_0_valid & _T_313;
  assign _T_315 = addresses_1_bits == io_w_0_addr;
  assign _T_316 = addresses_1_valid & _T_315;
  assign _T_317 = addresses_2_bits == io_w_0_addr;
  assign _T_318 = addresses_2_valid & _T_317;
  assign _T_319 = addresses_3_bits == io_w_0_addr;
  assign _T_320 = addresses_3_valid & _T_319;
  assign _T_321 = addresses_4_bits == io_w_0_addr;
  assign _T_322 = addresses_4_valid & _T_321;
  assign _T_323 = addresses_5_bits == io_w_0_addr;
  assign _T_324 = addresses_5_valid & _T_323;
  assign _T_325 = addresses_6_bits == io_w_0_addr;
  assign _T_326 = addresses_6_valid & _T_325;
  assign _T_327 = addresses_7_bits == io_w_0_addr;
  assign _T_328 = addresses_7_valid & _T_327;
  assign _T_342 = {_T_316,_T_314};
  assign _T_343 = {_T_320,_T_318};
  assign _T_344 = {_T_343,_T_342};
  assign _T_345 = {_T_324,_T_322};
  assign _T_346 = {_T_328,_T_326};
  assign _T_347 = {_T_346,_T_345};
  assign _T_348 = {_T_347,_T_344};
  assign _T_350 = _T_348 != 8'h0;
  assign _T_351 = _T_348[7:4];
  assign _T_352 = _T_348[3:0];
  assign _T_354 = _T_351 != 4'h0;
  assign _T_355 = _T_351 | _T_352;
  assign _T_356 = _T_355[3:2];
  assign _T_357 = _T_355[1:0];
  assign _T_359 = _T_356 != 2'h0;
  assign _T_360 = _T_356 | _T_357;
  assign _T_361 = _T_360[1];
  assign _T_362 = {_T_359,_T_361};
  assign _T_363 = {_T_354,_T_362};
  assign _T_365 = _T_350 == 1'h0;
  assign _T_366 = io_w_0_en & _T_365;
  assign _T_367 = _T_350 ? {{1'd0}, _T_363} : nextAddr;
  assign _GEN_36 = 3'h0 == _GEN_56;
  assign _GEN_37 = 3'h1 == _GEN_56;
  assign _GEN_38 = 3'h2 == _GEN_56;
  assign _GEN_39 = 3'h3 == _GEN_56;
  assign _GEN_40 = 3'h4 == _GEN_56;
  assign _GEN_41 = 3'h5 == _GEN_56;
  assign _GEN_42 = 3'h6 == _GEN_56;
  assign _GEN_43 = 3'h7 == _GEN_56;
  assign nextAddrUpdate = _T_366 ? _T_312 : nextAddr;
  assign _T_391 = nextAddrUpdate <= 4'h8;
  assign _T_394 = _T_391 | reset;
  assign _T_396 = _T_394 == 1'h0;
  assign io_r_0_data = _T_288 ? mem__T_303_data : 8'h0;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  addresses_0_valid = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  addresses_0_bits = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  addresses_1_valid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  addresses_1_bits = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  addresses_2_valid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  addresses_2_bits = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  addresses_3_valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  addresses_3_bits = _RAND_8[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  addresses_4_valid = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  addresses_4_bits = _RAND_10[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  addresses_5_valid = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  addresses_5_bits = _RAND_12[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  addresses_6_valid = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  addresses_6_bits = _RAND_14[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  addresses_7_valid = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  addresses_7_bits = _RAND_16[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  nextAddr = _RAND_17[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem__T_386_en & mem__T_386_mask) begin
      mem[mem__T_386_addr] <= mem__T_386_data;
    end
    if (metaReset) begin
      addresses_0_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_0_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_36) begin
            addresses_0_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_0_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_0_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_36) begin
            addresses_0_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_1_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_1_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_37) begin
            addresses_1_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_1_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_1_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_37) begin
            addresses_1_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_2_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_2_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_38) begin
            addresses_2_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_2_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_2_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_38) begin
            addresses_2_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_3_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_3_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_39) begin
            addresses_3_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_3_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_3_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_39) begin
            addresses_3_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_4_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_4_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_40) begin
            addresses_4_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_4_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_4_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_40) begin
            addresses_4_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_5_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_5_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_41) begin
            addresses_5_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_5_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_5_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_41) begin
            addresses_5_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_6_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_6_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_42) begin
            addresses_6_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_6_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_6_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_42) begin
            addresses_6_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_7_valid <= 1'h0;
    end else begin
      if (reset) begin
        addresses_7_valid <= 1'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_43) begin
            addresses_7_valid <= 1'h1;
          end
        end
      end
    end
    if (metaReset) begin
      addresses_7_bits <= 3'h0;
    end else begin
      if (reset) begin
        addresses_7_bits <= 3'h0;
      end else begin
        if (io_w_0_en) begin
          if (_GEN_43) begin
            addresses_7_bits <= io_w_0_addr;
          end
        end
      end
    end
    if (metaReset) begin
      nextAddr <= 4'h0;
    end else begin
      if (reset) begin
        nextAddr <= 4'h0;
      end else begin
        if (_T_366) begin
          nextAddr <= _T_312;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_396) begin
          $fwrite(32'h80000002,"Assertion failed: SparseMem ran out of space with size %d, increase size in ReplaceMemsTransform!\n    at SparseMem.scala:103 assert(nextAddrUpdate <= depth.U,\n",4'h8);
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_396) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Queue_19( // @[:TLSPI.fir@3753.2]
  input        metaReset,
  input        clock, // @[:TLSPI.fir@3754.4]
  input        reset, // @[:TLSPI.fir@3755.4]
  output       io_enq_ready, // @[:TLSPI.fir@3756.4]
  input        io_enq_valid, // @[:TLSPI.fir@3756.4]
  input  [7:0] io_enq_bits, // @[:TLSPI.fir@3756.4]
  input        io_deq_ready, // @[:TLSPI.fir@3756.4]
  output       io_deq_valid, // @[:TLSPI.fir@3756.4]
  output [7:0] io_deq_bits, // @[:TLSPI.fir@3756.4]
  output [3:0] io_count, // @[:TLSPI.fir@3756.4]
  output       _GEN_2_1,
  output       _GEN_8_2,
  output       _GEN_7_2,
  output       _GEN_1_0,
  output       _GEN_0_0,
  output       _GEN_3_3
);
  wire  mem_sparse_metaReset; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire  mem_sparse_clock; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire  mem_sparse_reset; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire [2:0] mem_sparse_io_w_0_addr; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire  mem_sparse_io_w_0_en; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire [7:0] mem_sparse_io_w_0_data; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire [2:0] mem_sparse_io_r_0_addr; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  wire [7:0] mem_sparse_io_r_0_data; // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
  reg [2:0] value; // @[Counter.scala 26:33:TLSPI.fir@3762.4]
  reg [31:0] _RAND_0;
  reg [2:0] value_1; // @[Counter.scala 26:33:TLSPI.fir@3763.4]
  reg [31:0] _RAND_1;
  reg  maybe_full; // @[Decoupled.scala 217:35:TLSPI.fir@3764.4]
  reg [31:0] _RAND_2;
  wire  _T_41; // @[Decoupled.scala 219:41:TLSPI.fir@3765.4]
  wire  _T_43; // @[Decoupled.scala 220:36:TLSPI.fir@3766.4]
  wire  empty; // @[Decoupled.scala 220:33:TLSPI.fir@3767.4]
  wire  _T_44; // @[Decoupled.scala 221:32:TLSPI.fir@3768.4]
  wire  do_enq; // @[Decoupled.scala 37:37:TLSPI.fir@3769.4]
  wire  do_deq; // @[Decoupled.scala 37:37:TLSPI.fir@3773.4]
  wire [3:0] _T_52; // @[Counter.scala 35:22:TLSPI.fir@3781.6]
  wire [2:0] _T_53; // @[Counter.scala 35:22:TLSPI.fir@3782.6]
  wire [3:0] _T_56; // @[Counter.scala 35:22:TLSPI.fir@3787.6]
  wire [2:0] _T_57; // @[Counter.scala 35:22:TLSPI.fir@3788.6]
  wire  _T_58; // @[Decoupled.scala 232:16:TLSPI.fir@3791.4]
  wire [3:0] _T_64; // @[Decoupled.scala 253:40:TLSPI.fir@3801.4]
  wire [3:0] _T_65; // @[Decoupled.scala 253:40:TLSPI.fir@3802.4]
  wire [2:0] _T_66; // @[Decoupled.scala 253:40:TLSPI.fir@3803.4]
  wire  _T_67; // @[Decoupled.scala 255:32:TLSPI.fir@3804.4]
  SparseMem mem_sparse ( // @[Decoupled.scala 214:24:TLSPI.fir@3761.4]
    .metaReset(mem_sparse_metaReset),
    .clock(mem_sparse_clock),
    .reset(mem_sparse_reset),
    .io_w_0_addr(mem_sparse_io_w_0_addr),
    .io_w_0_en(mem_sparse_io_w_0_en),
    .io_w_0_data(mem_sparse_io_w_0_data),
    .io_r_0_addr(mem_sparse_io_r_0_addr),
    .io_r_0_data(mem_sparse_io_r_0_data)
  );
  assign mem_sparse_metaReset = metaReset;
  assign _T_41 = value == value_1; // @[Decoupled.scala 219:41:TLSPI.fir@3765.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 220:36:TLSPI.fir@3766.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 220:33:TLSPI.fir@3767.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 221:32:TLSPI.fir@3768.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:TLSPI.fir@3769.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:TLSPI.fir@3773.4]
  assign _T_52 = value + 3'h1; // @[Counter.scala 35:22:TLSPI.fir@3781.6]
  assign _T_53 = _T_52[2:0]; // @[Counter.scala 35:22:TLSPI.fir@3782.6]
  assign _T_56 = value_1 + 3'h1; // @[Counter.scala 35:22:TLSPI.fir@3787.6]
  assign _T_57 = _T_56[2:0]; // @[Counter.scala 35:22:TLSPI.fir@3788.6]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 232:16:TLSPI.fir@3791.4]
  assign _T_64 = value - value_1; // @[Decoupled.scala 253:40:TLSPI.fir@3801.4]
  assign _T_65 = $unsigned(_T_64); // @[Decoupled.scala 253:40:TLSPI.fir@3802.4]
  assign _T_66 = _T_65[2:0]; // @[Decoupled.scala 253:40:TLSPI.fir@3803.4]
  assign _T_67 = maybe_full & _T_41; // @[Decoupled.scala 255:32:TLSPI.fir@3804.4]
  assign io_enq_ready = _T_44 == 1'h0;
  assign io_deq_valid = empty == 1'h0;
  assign io_deq_bits = mem_sparse_io_r_0_data;
  assign io_count = {_T_67,_T_66};
  assign _GEN_2_1 = do_enq != do_deq;
  assign _GEN_8_2 = reset;
  assign _GEN_7_2 = reset;
  assign _GEN_1_0 = io_deq_ready & io_deq_valid;
  assign _GEN_0_0 = io_enq_ready & io_enq_valid;
  assign _GEN_3_3 = reset;
  assign mem_sparse_clock = clock;
  assign mem_sparse_reset = reset;
  assign mem_sparse_io_w_0_addr = value;
  assign mem_sparse_io_w_0_en = io_enq_ready & io_enq_valid;
  assign mem_sparse_io_w_0_data = io_enq_bits;
  assign mem_sparse_io_r_0_addr = value_1;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  value = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  value_1 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  maybe_full = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      value <= 3'h0;
    end else begin
      if (reset) begin
        value <= 3'h0;
      end else begin
        if (do_enq) begin
          value <= _T_53;
        end
      end
    end
    if (metaReset) begin
      value_1 <= 3'h0;
    end else begin
      if (reset) begin
        value_1 <= 3'h0;
      end else begin
        if (do_deq) begin
          value_1 <= _T_57;
        end
      end
    end
    if (metaReset) begin
      maybe_full <= 1'h0;
    end else begin
      if (reset) begin
        maybe_full <= 1'h0;
      end else begin
        if (_T_58) begin
          maybe_full <= do_enq;
        end
      end
    end
  end
endmodule
module SPIPhysical_1( // @[:TLSPI.fir@3808.2]
  input         metaReset,
  input         clock, // @[:TLSPI.fir@3809.4]
  input         reset, // @[:TLSPI.fir@3810.4]
  output        io_port_sck, // @[:TLSPI.fir@3811.4]
  input         io_port_dq_0_i, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_0_o, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_0_oe, // @[:TLSPI.fir@3811.4]
  input         io_port_dq_1_i, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_1_o, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_1_oe, // @[:TLSPI.fir@3811.4]
  input         io_port_dq_2_i, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_2_o, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_2_oe, // @[:TLSPI.fir@3811.4]
  input         io_port_dq_3_i, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_3_o, // @[:TLSPI.fir@3811.4]
  output        io_port_dq_3_oe, // @[:TLSPI.fir@3811.4]
  input  [11:0] io_ctrl_sck_div, // @[:TLSPI.fir@3811.4]
  input         io_ctrl_sck_pol, // @[:TLSPI.fir@3811.4]
  input         io_ctrl_sck_pha, // @[:TLSPI.fir@3811.4]
  input  [1:0]  io_ctrl_fmt_proto, // @[:TLSPI.fir@3811.4]
  input         io_ctrl_fmt_endian, // @[:TLSPI.fir@3811.4]
  input         io_ctrl_fmt_iodir, // @[:TLSPI.fir@3811.4]
  output        io_op_ready, // @[:TLSPI.fir@3811.4]
  input         io_op_valid, // @[:TLSPI.fir@3811.4]
  input         io_op_bits_fn, // @[:TLSPI.fir@3811.4]
  input         io_op_bits_stb, // @[:TLSPI.fir@3811.4]
  input  [7:0]  io_op_bits_cnt, // @[:TLSPI.fir@3811.4]
  input  [7:0]  io_op_bits_data, // @[:TLSPI.fir@3811.4]
  output        io_rx_valid, // @[:TLSPI.fir@3811.4]
  output [7:0]  io_rx_bits, // @[:TLSPI.fir@3811.4]
  output        _GEN_14_0,
  output        _GEN_80_1,
  output        _GEN_74_0,
  output        _GEN_58_0,
  output        _GEN_68_0,
  output        _GEN_61_1,
  output        _GEN_140_0,
  output        _GEN_130_1,
  output        _GEN_39_0,
  output        _GEN_124_2,
  output        _GEN_106_1,
  output        _GEN_133_1,
  output        _GEN_127_2,
  output        _GEN_143_0,
  output        _GEN_112_2,
  output        _GEN_88_0,
  output        _GEN_94_1,
  output        _GEN_79_0,
  output        _GEN_100_1,
  output        _GEN_115_2,
  output        _GEN_121_3,
  output        _GEN_136_1,
  output        _GEN_103_1,
  output        _GEN_97_2,
  output        _GEN_60_0,
  output        _GEN_82_1,
  output        _GEN_109_3,
  output        _GEN_118_3,
  output        _GEN_76_0,
  output        _GEN_91_1,
  output        _GEN_142_1,
  output        _GEN_70_1,
  output        _GEN_85_1,
  output        _GEN_57_0,
  output        _GEN_63_1,
  output        _GEN_73_2,
  output        _GEN_67_0,
  output        _GEN_135_1,
  output        _GEN_11_0,
  output        _GEN_129_1,
  output        _GEN_117_3,
  output        _GEN_139_1,
  output        _GEN_138_1,
  output        _GEN_21_1,
  output        _GEN_123_2,
  output        _GEN_105_2,
  output        _GEN_111_3,
  output        _GEN_126_2,
  output        _GEN_132_2,
  output        _GEN_90_1,
  output        _GEN_108_3,
  output        _GEN_99_3,
  output        _GEN_93_0,
  output        _GEN_114_2,
  output        _GEN_72_2,
  output        _GEN_87_2,
  output        _GEN_120_3,
  output        _GEN_75_2,
  output        _GEN_102_3,
  output        _GEN_59_1,
  output        _GEN_96_3,
  output        _GEN_20_1,
  output        _GEN_81_1,
  output        _GEN_131_0,
  output        _GEN_78_1,
  output        _GEN_141_1,
  output        _GEN_69_2,
  output        _GEN_84_1,
  output        _GEN_62_1,
  output        _GEN_55_1,
  output        _GEN_134_1,
  output        _GEN_144_1,
  output        _GEN_10_2,
  output        _GEN_66_2,
  output        _GEN_119_1,
  output        _GEN_128_1,
  output        _GEN_113_1,
  output        _GEN_101_1,
  output        _GEN_122_3,
  output        _GEN_116_2,
  output        _GEN_137_2,
  output        _GEN_95_3,
  output        _GEN_89_2,
  output        _GEN_83_2,
  output        _GEN_77_2,
  output        _GEN_104_3,
  output        _GEN_110_2,
  output        _GEN_98_2,
  output        _GEN_125_2,
  output        _GEN_107_2,
  output        _GEN_65_2,
  output        _GEN_92_1,
  output        _GEN_86_3,
  output        _GEN_71_2
);
  reg [11:0] ctrl_sck_div; // @[SPIPhysical.scala 33:17:TLSPI.fir@3816.4]
  reg [31:0] _RAND_0;
  reg  ctrl_sck_pol; // @[SPIPhysical.scala 33:17:TLSPI.fir@3816.4]
  reg [31:0] _RAND_1;
  reg  ctrl_sck_pha; // @[SPIPhysical.scala 33:17:TLSPI.fir@3816.4]
  reg [31:0] _RAND_2;
  reg [1:0] ctrl_fmt_proto; // @[SPIPhysical.scala 33:17:TLSPI.fir@3816.4]
  reg [31:0] _RAND_3;
  reg  ctrl_fmt_endian; // @[SPIPhysical.scala 33:17:TLSPI.fir@3816.4]
  reg [31:0] _RAND_4;
  reg  ctrl_fmt_iodir; // @[SPIPhysical.scala 33:17:TLSPI.fir@3816.4]
  reg [31:0] _RAND_5;
  reg  setup_d; // @[SPIPhysical.scala 41:20:TLSPI.fir@3832.4]
  reg [31:0] _RAND_6;
  reg  _T_50; // @[ShiftReg.scala 15:18:TLSPI.fir@3834.4]
  reg [31:0] _RAND_7;
  reg  _T_51; // @[ShiftReg.scala 15:18:TLSPI.fir@3836.4]
  reg [31:0] _RAND_8;
  reg  sample_d; // @[ShiftReg.scala 15:18:TLSPI.fir@3838.4]
  reg [31:0] _RAND_9;
  reg  _T_53; // @[ShiftReg.scala 15:18:TLSPI.fir@3840.4]
  reg [31:0] _RAND_10;
  reg  _T_54; // @[ShiftReg.scala 15:18:TLSPI.fir@3842.4]
  reg [31:0] _RAND_11;
  reg  last_d; // @[ShiftReg.scala 15:18:TLSPI.fir@3844.4]
  reg [31:0] _RAND_12;
  reg [7:0] scnt; // @[SPIPhysical.scala 45:17:TLSPI.fir@3846.4]
  reg [31:0] _RAND_13;
  reg [11:0] tcnt; // @[SPIPhysical.scala 46:17:TLSPI.fir@3847.4]
  reg [31:0] _RAND_14;
  reg  sck; // @[SPIPhysical.scala 54:16:TLSPI.fir@3859.4]
  reg [31:0] _RAND_15;
  reg  cref; // @[SPIPhysical.scala 55:17:TLSPI.fir@3860.4]
  reg [31:0] _RAND_16;
  reg [7:0] buffer; // @[SPIPhysical.scala 64:19:TLSPI.fir@3867.4]
  reg [31:0] _RAND_17;
  reg [3:0] txd; // @[SPIPhysical.scala 76:16:TLSPI.fir@3913.4]
  reg [31:0] _RAND_18;
  reg  done; // @[SPIPhysical.scala 97:17:TLSPI.fir@3961.4]
  reg [31:0] _RAND_19;
  reg  xfr; // @[SPIPhysical.scala 103:16:TLSPI.fir@3983.4]
  reg [31:0] _RAND_20;
  wire  proto_0; // @[SPIConsts.scala 13:48:TLSPI.fir@3817.4]
  wire  proto_1; // @[SPIConsts.scala 13:48:TLSPI.fir@3818.4]
  wire  proto_2; // @[SPIConsts.scala 13:48:TLSPI.fir@3819.4]
  wire  stop; // @[SPIPhysical.scala 48:20:TLSPI.fir@3848.4]
  wire  beat; // @[SPIPhysical.scala 49:20:TLSPI.fir@3849.4]
  wire [11:0] _T_59; // @[SPIPhysical.scala 50:17:TLSPI.fir@3850.4]
  wire [12:0] _T_61; // @[SPIPhysical.scala 50:36:TLSPI.fir@3851.4]
  wire [12:0] _T_62; // @[SPIPhysical.scala 50:36:TLSPI.fir@3852.4]
  wire [11:0] decr; // @[SPIPhysical.scala 50:36:TLSPI.fir@3853.4]
  wire  sched; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  wire  cinv; // @[SPIPhysical.scala 56:27:TLSPI.fir@3861.4]
  wire [1:0] _T_68; // @[Cat.scala 30:58:TLSPI.fir@3862.4]
  wire [1:0] _T_69; // @[Cat.scala 30:58:TLSPI.fir@3863.4]
  wire [3:0] rxd; // @[Cat.scala 30:58:TLSPI.fir@3864.4]
  wire  samples_0; // @[SPIPhysical.scala 62:24:TLSPI.fir@3865.4]
  wire [1:0] samples_1; // @[SPIPhysical.scala 62:32:TLSPI.fir@3866.4]
  wire  _T_71; // @[SPIPhysical.scala 59:20:TLSPI.fir@3868.4]
  wire  _T_72; // @[SPIPhysical.scala 59:54:TLSPI.fir@3869.4]
  wire  _T_73; // @[SPIPhysical.scala 59:54:TLSPI.fir@3870.4]
  wire  _T_74; // @[SPIPhysical.scala 59:54:TLSPI.fir@3871.4]
  wire  _T_75; // @[SPIPhysical.scala 59:54:TLSPI.fir@3872.4]
  wire  _T_76; // @[SPIPhysical.scala 59:54:TLSPI.fir@3873.4]
  wire  _T_77; // @[SPIPhysical.scala 59:54:TLSPI.fir@3874.4]
  wire  _T_78; // @[SPIPhysical.scala 59:54:TLSPI.fir@3875.4]
  wire  _T_79; // @[SPIPhysical.scala 59:54:TLSPI.fir@3876.4]
  wire [1:0] _T_80; // @[Cat.scala 30:58:TLSPI.fir@3877.4]
  wire [1:0] _T_81; // @[Cat.scala 30:58:TLSPI.fir@3878.4]
  wire [3:0] _T_82; // @[Cat.scala 30:58:TLSPI.fir@3879.4]
  wire [1:0] _T_83; // @[Cat.scala 30:58:TLSPI.fir@3880.4]
  wire [1:0] _T_84; // @[Cat.scala 30:58:TLSPI.fir@3881.4]
  wire [3:0] _T_85; // @[Cat.scala 30:58:TLSPI.fir@3882.4]
  wire [7:0] _T_86; // @[Cat.scala 30:58:TLSPI.fir@3883.4]
  wire [7:0] buffer_in; // @[SPIPhysical.scala 59:8:TLSPI.fir@3884.4]
  wire  _T_87; // @[SPIPhysical.scala 66:59:TLSPI.fir@3885.4]
  wire  shift; // @[SPIPhysical.scala 66:46:TLSPI.fir@3886.4]
  wire [6:0] _T_88; // @[SPIPhysical.scala 70:26:TLSPI.fir@3887.4]
  wire [6:0] _T_89; // @[SPIPhysical.scala 70:42:TLSPI.fir@3888.4]
  wire [6:0] _T_90; // @[SPIPhysical.scala 70:12:TLSPI.fir@3889.4]
  wire  _T_91; // @[SPIPhysical.scala 71:35:TLSPI.fir@3890.4]
  wire  _T_92; // @[SPIPhysical.scala 71:12:TLSPI.fir@3891.4]
  wire [7:0] _T_93; // @[Cat.scala 30:58:TLSPI.fir@3892.4]
  wire [5:0] _T_94; // @[SPIPhysical.scala 70:26:TLSPI.fir@3893.4]
  wire [5:0] _T_95; // @[SPIPhysical.scala 70:42:TLSPI.fir@3894.4]
  wire [5:0] _T_96; // @[SPIPhysical.scala 70:12:TLSPI.fir@3895.4]
  wire [1:0] _T_97; // @[SPIPhysical.scala 71:35:TLSPI.fir@3896.4]
  wire [1:0] _T_98; // @[SPIPhysical.scala 71:12:TLSPI.fir@3897.4]
  wire [7:0] _T_99; // @[Cat.scala 30:58:TLSPI.fir@3898.4]
  wire [3:0] _T_100; // @[SPIPhysical.scala 70:26:TLSPI.fir@3899.4]
  wire [3:0] _T_101; // @[SPIPhysical.scala 70:42:TLSPI.fir@3900.4]
  wire [3:0] _T_102; // @[SPIPhysical.scala 70:12:TLSPI.fir@3901.4]
  wire [3:0] _T_104; // @[SPIPhysical.scala 71:12:TLSPI.fir@3903.4]
  wire [7:0] _T_105; // @[Cat.scala 30:58:TLSPI.fir@3904.4]
  wire [7:0] _T_108; // @[Mux.scala 19:72:TLSPI.fir@3905.4]
  wire [7:0] _T_110; // @[Mux.scala 19:72:TLSPI.fir@3906.4]
  wire [7:0] _T_112; // @[Mux.scala 19:72:TLSPI.fir@3907.4]
  wire [7:0] _T_113; // @[Mux.scala 19:72:TLSPI.fir@3908.4]
  wire [7:0] _T_114; // @[Mux.scala 19:72:TLSPI.fir@3909.4]
  wire [3:0] _T_119; // @[SPIPhysical.scala 74:41:TLSPI.fir@3914.4]
  wire  _T_190; // @[SPIPhysical.scala 122:14:TLSPI.fir@4005.4]
  wire  _T_194; // @[SPIPhysical.scala 124:19:TLSPI.fir@4010.6]
  wire  _T_195; // @[SPIPhysical.scala 124:16:TLSPI.fir@4011.6]
  wire  _GEN_17; // @[SPIPhysical.scala 124:26:TLSPI.fir@4012.6]
  wire  accept; // @[SPIPhysical.scala 122:27:TLSPI.fir@4006.4]
  wire [3:0] txd_in; // @[SPIPhysical.scala 77:19:TLSPI.fir@3916.4]
  wire [1:0] _T_121; // @[SPIPhysical.scala 78:39:TLSPI.fir@3917.4]
  wire  txd_sel_0; // @[SPIConsts.scala 13:48:TLSPI.fir@3918.4]
  wire  txd_sel_1; // @[SPIConsts.scala 13:48:TLSPI.fir@3919.4]
  wire  txd_sel_2; // @[SPIConsts.scala 13:48:TLSPI.fir@3920.4]
  wire  txd_shf_0; // @[SPIPhysical.scala 79:55:TLSPI.fir@3921.4]
  wire [1:0] txd_shf_1; // @[SPIPhysical.scala 79:55:TLSPI.fir@3922.4]
  wire  _T_127; // @[Mux.scala 19:72:TLSPI.fir@3925.6]
  wire [1:0] _T_129; // @[Mux.scala 19:72:TLSPI.fir@3926.6]
  wire [3:0] _T_131; // @[Mux.scala 19:72:TLSPI.fir@3927.6]
  wire [1:0] _GEN_145; // @[Mux.scala 19:72:TLSPI.fir@3928.6]
  wire [1:0] _T_132; // @[Mux.scala 19:72:TLSPI.fir@3928.6]
  wire [3:0] _GEN_146; // @[Mux.scala 19:72:TLSPI.fir@3929.6]
  wire [3:0] _T_133; // @[Mux.scala 19:72:TLSPI.fir@3929.6]
  wire  _T_198; // @[SPIPhysical.scala 131:16:TLSPI.fir@4018.4]
  wire  _T_202; // @[Conditional.scala 37:30:TLSPI.fir@4027.8]
  wire  _GEN_3; // @[SPIPhysical.scala 111:18:TLSPI.fir@3992.8]
  wire  _GEN_8; // @[SPIPhysical.scala 109:17:TLSPI.fir@3989.6]
  wire  _GEN_15; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  wire  _GEN_18; // @[SPIPhysical.scala 124:26:TLSPI.fir@4012.6]
  wire  _GEN_22; // @[SPIPhysical.scala 122:27:TLSPI.fir@4006.4]
  wire  _GEN_37; // @[Conditional.scala 40:58:TLSPI.fir@4028.8]
  wire  _GEN_50; // @[SPIPhysical.scala 133:24:TLSPI.fir@4021.6]
  wire  setup; // @[SPIPhysical.scala 131:25:TLSPI.fir@4019.4]
  wire  _T_137; // @[SPIPhysical.scala 85:49:TLSPI.fir@3935.4]
  wire  txen_2; // @[SPIPhysical.scala 85:49:TLSPI.fir@3936.4]
  wire  txen_1; // @[SPIPhysical.scala 85:82:TLSPI.fir@3938.4]
  wire  _T_160; // @[SPIPhysical.scala 98:16:TLSPI.fir@3962.4]
  wire  _T_162; // @[SPIPhysical.scala 59:20:TLSPI.fir@3965.4]
  wire  _T_164; // @[SPIPhysical.scala 59:54:TLSPI.fir@3967.4]
  wire  _T_165; // @[SPIPhysical.scala 59:54:TLSPI.fir@3968.4]
  wire  _T_166; // @[SPIPhysical.scala 59:54:TLSPI.fir@3969.4]
  wire  _T_167; // @[SPIPhysical.scala 59:54:TLSPI.fir@3970.4]
  wire  _T_168; // @[SPIPhysical.scala 59:54:TLSPI.fir@3971.4]
  wire  _T_169; // @[SPIPhysical.scala 59:54:TLSPI.fir@3972.4]
  wire  _T_170; // @[SPIPhysical.scala 59:54:TLSPI.fir@3973.4]
  wire [1:0] _T_171; // @[Cat.scala 30:58:TLSPI.fir@3974.4]
  wire [1:0] _T_172; // @[Cat.scala 30:58:TLSPI.fir@3975.4]
  wire [3:0] _T_173; // @[Cat.scala 30:58:TLSPI.fir@3976.4]
  wire [1:0] _T_174; // @[Cat.scala 30:58:TLSPI.fir@3977.4]
  wire [1:0] _T_175; // @[Cat.scala 30:58:TLSPI.fir@3978.4]
  wire [3:0] _T_176; // @[Cat.scala 30:58:TLSPI.fir@3979.4]
  wire [7:0] _T_177; // @[Cat.scala 30:58:TLSPI.fir@3980.4]
  wire  _T_184; // @[SPIPhysical.scala 112:21:TLSPI.fir@3993.10]
  wire  _GEN_1; // @[SPIPhysical.scala 111:18:TLSPI.fir@3992.8]
  wire [11:0] _GEN_4; // @[SPIPhysical.scala 116:20:TLSPI.fir@4000.8]
  wire  _GEN_6; // @[SPIPhysical.scala 109:17:TLSPI.fir@3989.6]
  wire [11:0] _GEN_9; // @[SPIPhysical.scala 109:17:TLSPI.fir@3989.6]
  wire  _GEN_13; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  wire [11:0] _GEN_16; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  wire  _T_191; // @[SPIPhysical.scala 123:18:TLSPI.fir@4007.6]
  wire  _T_192; // @[SPIPhysical.scala 123:26:TLSPI.fir@4008.6]
  wire  _T_205; // @[SPIPhysical.scala 145:27:TLSPI.fir@4032.10]
  wire [11:0] _GEN_43; // @[SPIPhysical.scala 133:24:TLSPI.fir@4021.6]
  wire [11:0] _GEN_56; // @[SPIPhysical.scala 131:25:TLSPI.fir@4019.4]
  assign proto_0 = 2'h0 == ctrl_fmt_proto; // @[SPIConsts.scala 13:48:TLSPI.fir@3817.4]
  assign proto_1 = 2'h1 == ctrl_fmt_proto; // @[SPIConsts.scala 13:48:TLSPI.fir@3818.4]
  assign proto_2 = 2'h2 == ctrl_fmt_proto; // @[SPIConsts.scala 13:48:TLSPI.fir@3819.4]
  assign stop = scnt == 8'h0; // @[SPIPhysical.scala 48:20:TLSPI.fir@3848.4]
  assign beat = tcnt == 12'h0; // @[SPIPhysical.scala 49:20:TLSPI.fir@3849.4]
  assign _T_59 = beat ? {{4'd0}, scnt} : tcnt; // @[SPIPhysical.scala 50:17:TLSPI.fir@3850.4]
  assign _T_61 = _T_59 - 12'h1; // @[SPIPhysical.scala 50:36:TLSPI.fir@3851.4]
  assign _T_62 = $unsigned(_T_61); // @[SPIPhysical.scala 50:36:TLSPI.fir@3852.4]
  assign decr = _T_62[11:0]; // @[SPIPhysical.scala 50:36:TLSPI.fir@3853.4]
  assign sched = stop ? 1'h1 : beat; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  assign cinv = ctrl_sck_pha ^ ctrl_sck_pol; // @[SPIPhysical.scala 56:27:TLSPI.fir@3861.4]
  assign _T_68 = {io_port_dq_1_i,io_port_dq_0_i}; // @[Cat.scala 30:58:TLSPI.fir@3862.4]
  assign _T_69 = {io_port_dq_3_i,io_port_dq_2_i}; // @[Cat.scala 30:58:TLSPI.fir@3863.4]
  assign rxd = {_T_69,_T_68}; // @[Cat.scala 30:58:TLSPI.fir@3864.4]
  assign samples_0 = rxd[1]; // @[SPIPhysical.scala 62:24:TLSPI.fir@3865.4]
  assign samples_1 = rxd[1:0]; // @[SPIPhysical.scala 62:32:TLSPI.fir@3866.4]
  assign _T_71 = io_ctrl_fmt_endian == 1'h0; // @[SPIPhysical.scala 59:20:TLSPI.fir@3868.4]
  assign _T_72 = io_op_bits_data[0]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3869.4]
  assign _T_73 = io_op_bits_data[1]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3870.4]
  assign _T_74 = io_op_bits_data[2]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3871.4]
  assign _T_75 = io_op_bits_data[3]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3872.4]
  assign _T_76 = io_op_bits_data[4]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3873.4]
  assign _T_77 = io_op_bits_data[5]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3874.4]
  assign _T_78 = io_op_bits_data[6]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3875.4]
  assign _T_79 = io_op_bits_data[7]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3876.4]
  assign _T_80 = {_T_78,_T_79}; // @[Cat.scala 30:58:TLSPI.fir@3877.4]
  assign _T_81 = {_T_76,_T_77}; // @[Cat.scala 30:58:TLSPI.fir@3878.4]
  assign _T_82 = {_T_81,_T_80}; // @[Cat.scala 30:58:TLSPI.fir@3879.4]
  assign _T_83 = {_T_74,_T_75}; // @[Cat.scala 30:58:TLSPI.fir@3880.4]
  assign _T_84 = {_T_72,_T_73}; // @[Cat.scala 30:58:TLSPI.fir@3881.4]
  assign _T_85 = {_T_84,_T_83}; // @[Cat.scala 30:58:TLSPI.fir@3882.4]
  assign _T_86 = {_T_85,_T_82}; // @[Cat.scala 30:58:TLSPI.fir@3883.4]
  assign buffer_in = _T_71 ? io_op_bits_data : _T_86; // @[SPIPhysical.scala 59:8:TLSPI.fir@3884.4]
  assign _T_87 = sample_d & stop; // @[SPIPhysical.scala 66:59:TLSPI.fir@3885.4]
  assign shift = setup_d | _T_87; // @[SPIPhysical.scala 66:46:TLSPI.fir@3886.4]
  assign _T_88 = buffer[6:0]; // @[SPIPhysical.scala 70:26:TLSPI.fir@3887.4]
  assign _T_89 = buffer[7:1]; // @[SPIPhysical.scala 70:42:TLSPI.fir@3888.4]
  assign _T_90 = shift ? _T_88 : _T_89; // @[SPIPhysical.scala 70:12:TLSPI.fir@3889.4]
  assign _T_91 = buffer[0]; // @[SPIPhysical.scala 71:35:TLSPI.fir@3890.4]
  assign _T_92 = sample_d ? samples_0 : _T_91; // @[SPIPhysical.scala 71:12:TLSPI.fir@3891.4]
  assign _T_93 = {_T_90,_T_92}; // @[Cat.scala 30:58:TLSPI.fir@3892.4]
  assign _T_94 = buffer[5:0]; // @[SPIPhysical.scala 70:26:TLSPI.fir@3893.4]
  assign _T_95 = buffer[7:2]; // @[SPIPhysical.scala 70:42:TLSPI.fir@3894.4]
  assign _T_96 = shift ? _T_94 : _T_95; // @[SPIPhysical.scala 70:12:TLSPI.fir@3895.4]
  assign _T_97 = buffer[1:0]; // @[SPIPhysical.scala 71:35:TLSPI.fir@3896.4]
  assign _T_98 = sample_d ? samples_1 : _T_97; // @[SPIPhysical.scala 71:12:TLSPI.fir@3897.4]
  assign _T_99 = {_T_96,_T_98}; // @[Cat.scala 30:58:TLSPI.fir@3898.4]
  assign _T_100 = buffer[3:0]; // @[SPIPhysical.scala 70:26:TLSPI.fir@3899.4]
  assign _T_101 = buffer[7:4]; // @[SPIPhysical.scala 70:42:TLSPI.fir@3900.4]
  assign _T_102 = shift ? _T_100 : _T_101; // @[SPIPhysical.scala 70:12:TLSPI.fir@3901.4]
  assign _T_104 = sample_d ? rxd : _T_100; // @[SPIPhysical.scala 71:12:TLSPI.fir@3903.4]
  assign _T_105 = {_T_102,_T_104}; // @[Cat.scala 30:58:TLSPI.fir@3904.4]
  assign _T_108 = proto_0 ? _T_93 : 8'h0; // @[Mux.scala 19:72:TLSPI.fir@3905.4]
  assign _T_110 = proto_1 ? _T_99 : 8'h0; // @[Mux.scala 19:72:TLSPI.fir@3906.4]
  assign _T_112 = proto_2 ? _T_105 : 8'h0; // @[Mux.scala 19:72:TLSPI.fir@3907.4]
  assign _T_113 = _T_108 | _T_110; // @[Mux.scala 19:72:TLSPI.fir@3908.4]
  assign _T_114 = _T_113 | _T_112; // @[Mux.scala 19:72:TLSPI.fir@3909.4]
  assign _T_119 = buffer_in[7:4]; // @[SPIPhysical.scala 74:41:TLSPI.fir@3914.4]
  assign _T_190 = scnt == 8'h1; // @[SPIPhysical.scala 122:14:TLSPI.fir@4005.4]
  assign _T_194 = cref == 1'h0; // @[SPIPhysical.scala 124:19:TLSPI.fir@4010.6]
  assign _T_195 = beat & _T_194; // @[SPIPhysical.scala 124:16:TLSPI.fir@4011.6]
  assign _GEN_17 = _T_195 ? 1'h1 : stop; // @[SPIPhysical.scala 124:26:TLSPI.fir@4012.6]
  assign accept = _T_190 ? _GEN_17 : stop; // @[SPIPhysical.scala 122:27:TLSPI.fir@4006.4]
  assign txd_in = accept ? _T_119 : _T_101; // @[SPIPhysical.scala 77:19:TLSPI.fir@3916.4]
  assign _T_121 = accept ? io_ctrl_fmt_proto : ctrl_fmt_proto; // @[SPIPhysical.scala 78:39:TLSPI.fir@3917.4]
  assign txd_sel_0 = 2'h0 == _T_121; // @[SPIConsts.scala 13:48:TLSPI.fir@3918.4]
  assign txd_sel_1 = 2'h1 == _T_121; // @[SPIConsts.scala 13:48:TLSPI.fir@3919.4]
  assign txd_sel_2 = 2'h2 == _T_121; // @[SPIConsts.scala 13:48:TLSPI.fir@3920.4]
  assign txd_shf_0 = txd_in[3]; // @[SPIPhysical.scala 79:55:TLSPI.fir@3921.4]
  assign txd_shf_1 = txd_in[3:2]; // @[SPIPhysical.scala 79:55:TLSPI.fir@3922.4]
  assign _T_127 = txd_sel_0 ? txd_shf_0 : 1'h0; // @[Mux.scala 19:72:TLSPI.fir@3925.6]
  assign _T_129 = txd_sel_1 ? txd_shf_1 : 2'h0; // @[Mux.scala 19:72:TLSPI.fir@3926.6]
  assign _T_131 = txd_sel_2 ? txd_in : 4'h0; // @[Mux.scala 19:72:TLSPI.fir@3927.6]
  assign _GEN_145 = {{1'd0}, _T_127}; // @[Mux.scala 19:72:TLSPI.fir@3928.6]
  assign _T_132 = _GEN_145 | _T_129; // @[Mux.scala 19:72:TLSPI.fir@3928.6]
  assign _GEN_146 = {{2'd0}, _T_132}; // @[Mux.scala 19:72:TLSPI.fir@3929.6]
  assign _T_133 = _GEN_146 | _T_131; // @[Mux.scala 19:72:TLSPI.fir@3929.6]
  assign _T_198 = accept & done; // @[SPIPhysical.scala 131:16:TLSPI.fir@4018.4]
  assign _T_202 = 1'h0 == io_op_bits_fn; // @[Conditional.scala 37:30:TLSPI.fir@4027.8]
  assign _GEN_3 = xfr ? _T_194 : 1'h0; // @[SPIPhysical.scala 111:18:TLSPI.fir@3992.8]
  assign _GEN_8 = beat ? _GEN_3 : 1'h0; // @[SPIPhysical.scala 109:17:TLSPI.fir@3989.6]
  assign _GEN_15 = stop ? 1'h0 : _GEN_8; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  assign _GEN_18 = _T_195 ? 1'h0 : _GEN_15; // @[SPIPhysical.scala 124:26:TLSPI.fir@4012.6]
  assign _GEN_22 = _T_190 ? _GEN_18 : _GEN_15; // @[SPIPhysical.scala 122:27:TLSPI.fir@4006.4]
  assign _GEN_37 = _T_202 ? 1'h1 : _GEN_22; // @[Conditional.scala 40:58:TLSPI.fir@4028.8]
  assign _GEN_50 = io_op_valid ? _GEN_37 : _GEN_22; // @[SPIPhysical.scala 133:24:TLSPI.fir@4021.6]
  assign setup = _T_198 ? _GEN_50 : _GEN_22; // @[SPIPhysical.scala 131:25:TLSPI.fir@4019.4]
  assign _T_137 = proto_1 & ctrl_fmt_iodir; // @[SPIPhysical.scala 85:49:TLSPI.fir@3935.4]
  assign txen_2 = proto_2 & ctrl_fmt_iodir; // @[SPIPhysical.scala 85:49:TLSPI.fir@3936.4]
  assign txen_1 = _T_137 | txen_2; // @[SPIPhysical.scala 85:82:TLSPI.fir@3938.4]
  assign _T_160 = done | last_d; // @[SPIPhysical.scala 98:16:TLSPI.fir@3962.4]
  assign _T_162 = ctrl_fmt_endian == 1'h0; // @[SPIPhysical.scala 59:20:TLSPI.fir@3965.4]
  assign _T_164 = buffer[1]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3967.4]
  assign _T_165 = buffer[2]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3968.4]
  assign _T_166 = buffer[3]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3969.4]
  assign _T_167 = buffer[4]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3970.4]
  assign _T_168 = buffer[5]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3971.4]
  assign _T_169 = buffer[6]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3972.4]
  assign _T_170 = buffer[7]; // @[SPIPhysical.scala 59:54:TLSPI.fir@3973.4]
  assign _T_171 = {_T_169,_T_170}; // @[Cat.scala 30:58:TLSPI.fir@3974.4]
  assign _T_172 = {_T_167,_T_168}; // @[Cat.scala 30:58:TLSPI.fir@3975.4]
  assign _T_173 = {_T_172,_T_171}; // @[Cat.scala 30:58:TLSPI.fir@3976.4]
  assign _T_174 = {_T_165,_T_166}; // @[Cat.scala 30:58:TLSPI.fir@3977.4]
  assign _T_175 = {_T_91,_T_164}; // @[Cat.scala 30:58:TLSPI.fir@3978.4]
  assign _T_176 = {_T_175,_T_174}; // @[Cat.scala 30:58:TLSPI.fir@3979.4]
  assign _T_177 = {_T_176,_T_173}; // @[Cat.scala 30:58:TLSPI.fir@3980.4]
  assign _T_184 = cref ^ cinv; // @[SPIPhysical.scala 112:21:TLSPI.fir@3993.10]
  assign _GEN_1 = xfr ? _T_184 : sck; // @[SPIPhysical.scala 111:18:TLSPI.fir@3992.8]
  assign _GEN_4 = _T_194 ? decr : {{4'd0}, scnt}; // @[SPIPhysical.scala 116:20:TLSPI.fir@4000.8]
  assign _GEN_6 = beat ? _GEN_1 : sck; // @[SPIPhysical.scala 109:17:TLSPI.fir@3989.6]
  assign _GEN_9 = beat ? _GEN_4 : {{4'd0}, scnt}; // @[SPIPhysical.scala 109:17:TLSPI.fir@3989.6]
  assign _GEN_13 = stop ? sck : _GEN_6; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  assign _GEN_16 = stop ? {{4'd0}, scnt} : _GEN_9; // @[SPIPhysical.scala 105:15:TLSPI.fir@3984.4]
  assign _T_191 = beat & cref; // @[SPIPhysical.scala 123:18:TLSPI.fir@4007.6]
  assign _T_192 = _T_191 & xfr; // @[SPIPhysical.scala 123:26:TLSPI.fir@4008.6]
  assign _T_205 = io_op_bits_cnt == 8'h0; // @[SPIPhysical.scala 145:27:TLSPI.fir@4032.10]
  assign _GEN_43 = io_op_valid ? {{4'd0}, io_op_bits_cnt} : _GEN_16; // @[SPIPhysical.scala 133:24:TLSPI.fir@4021.6]
  assign _GEN_56 = _T_198 ? _GEN_43 : _GEN_16; // @[SPIPhysical.scala 131:25:TLSPI.fir@4019.4]
  assign io_port_sck = sck;
  assign io_port_dq_0_o = txd[0];
  assign io_port_dq_0_oe = proto_0 | txen_1;
  assign io_port_dq_1_o = txd[1];
  assign io_port_dq_1_oe = _T_137 | txen_2;
  assign io_port_dq_2_o = txd[2];
  assign io_port_dq_2_oe = proto_2 & ctrl_fmt_iodir;
  assign io_port_dq_3_o = txd[3];
  assign io_port_dq_3_oe = proto_2 & ctrl_fmt_iodir;
  assign io_op_ready = accept & done;
  assign io_rx_valid = done;
  assign io_rx_bits = _T_162 ? buffer : _T_177;
  assign _GEN_14_0 = io_ctrl_fmt_endian == 1'h0;
  assign _GEN_80_1 = xfr;
  assign _GEN_74_0 = scnt == 8'h1;
  assign _GEN_58_0 = sample_d;
  assign _GEN_68_0 = 2'h1 == _T_121;
  assign _GEN_61_1 = 2'h2 == ctrl_fmt_proto;
  assign _GEN_140_0 = reset;
  assign _GEN_130_1 = accept & done;
  assign _GEN_39_0 = setup_d | _T_87;
  assign _GEN_124_2 = accept & done;
  assign _GEN_106_1 = 1'h0 == io_op_bits_fn;
  assign _GEN_133_1 = reset;
  assign _GEN_127_2 = accept & done;
  assign _GEN_143_0 = reset;
  assign _GEN_112_2 = io_op_valid;
  assign _GEN_88_0 = scnt == 8'h0;
  assign _GEN_94_1 = io_op_bits_stb;
  assign _GEN_79_0 = xfr;
  assign _GEN_100_1 = io_op_bits_fn;
  assign _GEN_115_2 = io_op_valid;
  assign _GEN_121_3 = accept & done;
  assign _GEN_136_1 = reset;
  assign _GEN_103_1 = io_op_bits_fn;
  assign _GEN_97_2 = io_op_bits_stb;
  assign _GEN_60_0 = 2'h1 == ctrl_fmt_proto;
  assign _GEN_82_1 = tcnt == 12'h0;
  assign _GEN_109_3 = 1'h0 == io_op_bits_fn;
  assign _GEN_118_3 = io_op_valid;
  assign _GEN_76_0 = io_op_valid;
  assign _GEN_91_1 = scnt == 8'h1;
  assign _GEN_142_1 = reset;
  assign _GEN_70_1 = xfr;
  assign _GEN_85_1 = tcnt == 12'h0;
  assign _GEN_57_0 = setup_d | _T_87;
  assign _GEN_63_1 = scnt == 8'h1;
  assign _GEN_73_2 = beat & _T_194;
  assign _GEN_67_0 = 2'h0 == _T_121;
  assign _GEN_135_1 = reset;
  assign _GEN_11_0 = scnt == 8'h0;
  assign _GEN_129_1 = accept & done;
  assign _GEN_117_3 = io_op_valid;
  assign _GEN_139_1 = accept & done;
  assign _GEN_138_1 = stop ? 1'h1 : beat;
  assign _GEN_21_1 = sample_d;
  assign _GEN_123_2 = ctrl_fmt_endian == 1'h0;
  assign _GEN_105_2 = 1'h0 == io_op_bits_fn;
  assign _GEN_111_3 = io_op_valid;
  assign _GEN_126_2 = accept & done;
  assign _GEN_132_2 = reset;
  assign _GEN_90_1 = beat & _T_194;
  assign _GEN_108_3 = 1'h0 == io_op_bits_fn;
  assign _GEN_99_3 = io_op_bits_stb;
  assign _GEN_93_0 = io_op_bits_stb;
  assign _GEN_114_2 = io_op_valid;
  assign _GEN_72_2 = scnt == 8'h0;
  assign _GEN_87_2 = scnt == 8'h0;
  assign _GEN_120_3 = io_op_valid;
  assign _GEN_75_2 = 1'h0 == io_op_bits_fn;
  assign _GEN_102_3 = io_op_bits_fn;
  assign _GEN_59_1 = 2'h0 == ctrl_fmt_proto;
  assign _GEN_96_3 = io_op_bits_stb;
  assign _GEN_20_1 = setup_d | _T_87;
  assign _GEN_81_1 = cref == 1'h0;
  assign _GEN_131_0 = reset;
  assign _GEN_78_1 = _T_198 ? _GEN_50 : _GEN_22;
  assign _GEN_141_1 = accept & done;
  assign _GEN_69_2 = 2'h2 == _T_121;
  assign _GEN_84_1 = tcnt == 12'h0;
  assign _GEN_62_1 = beat & _T_194;
  assign _GEN_55_1 = sample_d;
  assign _GEN_134_1 = reset;
  assign _GEN_144_1 = accept & done;
  assign _GEN_10_2 = tcnt == 12'h0;
  assign _GEN_66_2 = _T_190 ? _GEN_17 : stop;
  assign _GEN_119_1 = io_op_valid;
  assign _GEN_128_1 = accept & done;
  assign _GEN_113_1 = io_op_valid;
  assign _GEN_101_1 = io_op_bits_fn;
  assign _GEN_122_3 = accept & done;
  assign _GEN_116_2 = io_op_valid;
  assign _GEN_137_2 = reset;
  assign _GEN_95_3 = io_op_bits_stb;
  assign _GEN_89_2 = scnt == 8'h0;
  assign _GEN_83_2 = tcnt == 12'h0;
  assign _GEN_77_2 = accept & done;
  assign _GEN_104_3 = 1'h0 == io_op_bits_fn;
  assign _GEN_110_2 = io_op_valid;
  assign _GEN_98_2 = io_op_bits_stb;
  assign _GEN_125_2 = accept & done;
  assign _GEN_107_2 = 1'h0 == io_op_bits_fn;
  assign _GEN_65_2 = _T_190 ? _GEN_17 : stop;
  assign _GEN_92_1 = scnt == 8'h1;
  assign _GEN_86_3 = scnt == 8'h0;
  assign _GEN_71_2 = tcnt == 12'h0;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  ctrl_sck_div = _RAND_0[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  ctrl_sck_pol = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  ctrl_sck_pha = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  ctrl_fmt_proto = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  ctrl_fmt_endian = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  ctrl_fmt_iodir = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  setup_d = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_50 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_51 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  sample_d = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  _T_53 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_54 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  last_d = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  scnt = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  tcnt = _RAND_14[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  sck = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  cref = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  buffer = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  txd = _RAND_18[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  done = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  xfr = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (metaReset) begin
      ctrl_sck_div <= 12'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (!(_T_202)) begin
            if (io_op_bits_fn) begin
              if (io_op_bits_stb) begin
                ctrl_sck_div <= io_ctrl_sck_div;
              end
            end
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_pol <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (!(_T_202)) begin
            if (io_op_bits_fn) begin
              if (io_op_bits_stb) begin
                ctrl_sck_pol <= io_ctrl_sck_pol;
              end
            end
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_sck_pha <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (!(_T_202)) begin
            if (io_op_bits_fn) begin
              if (io_op_bits_stb) begin
                ctrl_sck_pha <= io_ctrl_sck_pha;
              end
            end
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_proto <= 2'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (io_op_bits_stb) begin
            ctrl_fmt_proto <= io_ctrl_fmt_proto;
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_endian <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (io_op_bits_stb) begin
            ctrl_fmt_endian <= io_ctrl_fmt_endian;
          end
        end
      end
    end
    if (metaReset) begin
      ctrl_fmt_iodir <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (io_op_bits_stb) begin
            ctrl_fmt_iodir <= io_ctrl_fmt_iodir;
          end
        end
      end
    end
    if (metaReset) begin
      setup_d <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (_T_202) begin
            setup_d <= 1'h1;
          end else begin
            if (_T_190) begin
              if (_T_195) begin
                setup_d <= 1'h0;
              end else begin
                if (stop) begin
                  setup_d <= 1'h0;
                end else begin
                  if (beat) begin
                    if (xfr) begin
                      setup_d <= _T_194;
                    end else begin
                      setup_d <= 1'h0;
                    end
                  end else begin
                    setup_d <= 1'h0;
                  end
                end
              end
            end else begin
              if (stop) begin
                setup_d <= 1'h0;
              end else begin
                if (beat) begin
                  if (xfr) begin
                    setup_d <= _T_194;
                  end else begin
                    setup_d <= 1'h0;
                  end
                end else begin
                  setup_d <= 1'h0;
                end
              end
            end
          end
        end else begin
          if (_T_190) begin
            if (_T_195) begin
              setup_d <= 1'h0;
            end else begin
              if (stop) begin
                setup_d <= 1'h0;
              end else begin
                if (beat) begin
                  if (xfr) begin
                    setup_d <= _T_194;
                  end else begin
                    setup_d <= 1'h0;
                  end
                end else begin
                  setup_d <= 1'h0;
                end
              end
            end
          end else begin
            if (stop) begin
              setup_d <= 1'h0;
            end else begin
              if (beat) begin
                if (xfr) begin
                  setup_d <= _T_194;
                end else begin
                  setup_d <= 1'h0;
                end
              end else begin
                setup_d <= 1'h0;
              end
            end
          end
        end
      end else begin
        if (_T_190) begin
          if (_T_195) begin
            setup_d <= 1'h0;
          end else begin
            setup_d <= _GEN_15;
          end
        end else begin
          setup_d <= _GEN_15;
        end
      end
    end
    if (metaReset) begin
      _T_50 <= 1'h0;
    end else begin
      if (reset) begin
        _T_50 <= 1'h0;
      end else begin
        if (stop) begin
          _T_50 <= 1'h0;
        end else begin
          if (beat) begin
            if (xfr) begin
              _T_50 <= cref;
            end else begin
              _T_50 <= 1'h0;
            end
          end else begin
            _T_50 <= 1'h0;
          end
        end
      end
    end
    if (metaReset) begin
      _T_51 <= 1'h0;
    end else begin
      if (reset) begin
        _T_51 <= 1'h0;
      end else begin
        _T_51 <= _T_50;
      end
    end
    if (metaReset) begin
      sample_d <= 1'h0;
    end else begin
      if (reset) begin
        sample_d <= 1'h0;
      end else begin
        sample_d <= _T_51;
      end
    end
    if (metaReset) begin
      _T_53 <= 1'h0;
    end else begin
      if (reset) begin
        _T_53 <= 1'h0;
      end else begin
        if (_T_190) begin
          _T_53 <= _T_192;
        end else begin
          _T_53 <= 1'h0;
        end
      end
    end
    if (metaReset) begin
      _T_54 <= 1'h0;
    end else begin
      if (reset) begin
        _T_54 <= 1'h0;
      end else begin
        _T_54 <= _T_53;
      end
    end
    if (metaReset) begin
      last_d <= 1'h0;
    end else begin
      if (reset) begin
        last_d <= 1'h0;
      end else begin
        last_d <= _T_54;
      end
    end
    if (metaReset) begin
      scnt <= 8'h0;
    end else begin
      if (reset) begin
        scnt <= 8'h0;
      end else begin
        scnt <= _GEN_56[7:0];
      end
    end
    if (metaReset) begin
      tcnt <= 12'h0;
    end else begin
      if (sched) begin
        tcnt <= ctrl_sck_div;
      end else begin
        tcnt <= decr;
      end
    end
    if (metaReset) begin
      sck <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (_T_202) begin
            sck <= cinv;
          end else begin
            if (io_op_bits_fn) begin
              if (io_op_bits_stb) begin
                sck <= io_ctrl_sck_pol;
              end else begin
                if (_T_190) begin
                  if (_T_195) begin
                    sck <= ctrl_sck_pol;
                  end else begin
                    if (!(stop)) begin
                      if (beat) begin
                        if (xfr) begin
                          sck <= _T_184;
                        end
                      end
                    end
                  end
                end else begin
                  if (!(stop)) begin
                    if (beat) begin
                      if (xfr) begin
                        sck <= _T_184;
                      end
                    end
                  end
                end
              end
            end else begin
              if (_T_190) begin
                if (_T_195) begin
                  sck <= ctrl_sck_pol;
                end else begin
                  if (!(stop)) begin
                    if (beat) begin
                      if (xfr) begin
                        sck <= _T_184;
                      end
                    end
                  end
                end
              end else begin
                if (!(stop)) begin
                  if (beat) begin
                    if (xfr) begin
                      sck <= _T_184;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_190) begin
            if (_T_195) begin
              sck <= ctrl_sck_pol;
            end else begin
              sck <= _GEN_13;
            end
          end else begin
            sck <= _GEN_13;
          end
        end
      end else begin
        if (_T_190) begin
          if (_T_195) begin
            sck <= ctrl_sck_pol;
          end else begin
            sck <= _GEN_13;
          end
        end else begin
          sck <= _GEN_13;
        end
      end
    end
    if (metaReset) begin
      cref <= 1'h0;
    end else begin
      if (reset) begin
        cref <= 1'h1;
      end else begin
        if (!(stop)) begin
          if (beat) begin
            cref <= _T_194;
          end
        end
      end
    end
    if (metaReset) begin
      buffer <= 8'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          if (_T_202) begin
            if (_T_71) begin
              buffer <= io_op_bits_data;
            end else begin
              buffer <= _T_86;
            end
          end else begin
            buffer <= _T_114;
          end
        end else begin
          buffer <= _T_114;
        end
      end else begin
        buffer <= _T_114;
      end
    end
    if (metaReset) begin
      txd <= 4'h0;
    end else begin
      if (reset) begin
        txd <= 4'h0;
      end else begin
        if (setup) begin
          txd <= _T_133;
        end
      end
    end
    if (metaReset) begin
      done <= 1'h0;
    end else begin
      if (reset) begin
        done <= 1'h1;
      end else begin
        if (_T_198) begin
          if (io_op_valid) begin
            if (_T_202) begin
              done <= _T_205;
            end else begin
              done <= _T_160;
            end
          end else begin
            done <= _T_160;
          end
        end else begin
          done <= _T_160;
        end
      end
    end
    if (metaReset) begin
      xfr <= 1'h0;
    end else begin
      if (_T_198) begin
        if (io_op_valid) begin
          xfr <= _T_202;
        end
      end
    end
  end
endmodule
