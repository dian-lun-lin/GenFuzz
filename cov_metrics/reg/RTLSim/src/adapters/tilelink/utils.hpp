#pragma once

#include <rtlflow.h>
#include "definitions.h"
#include <utility>
#include <unordered_map>
#include <vector>
#include <queue>
#include <tuple>
#include <list>
#include <random>

// Tilelink ports and real name mappings 
//

namespace gf {

//void RisingEdge(RF::RTLflow& rtlflow, RF::Top* dut) {
  //rtlflow.get(dut->clock, 0);
  //rtlflow.run();
  //rtlflow.get(dut->clock, 1);
  //rtlflow.run();
//}

struct Ports {

  public:

    virtual uint8_t fire() = 0;
    virtual void clear() = 0;
};

struct APorts: public Ports {

  public:

    // c++ is static
    // currently I hard-coded for RocketCore
    // TODO: needs to support boom
    struct connections {
      uint8_t ready;
      uint8_t valid;
      uint8_t opcode;
      uint8_t param;
      uint8_t size;
      uint8_t source;
      uint32_t address;
      uint8_t  mask;
      uint64_t data;
      uint8_t  corrupt;
    };

    struct inner_connections {
      uint8_t* ready;
      uint8_t* valid;
      uint8_t* opcode;
      uint8_t* param;
      uint8_t* size;
      uint8_t* source;
      uint32_t* address;
      uint8_t*  mask;
      uint64_t* data;
      uint8_t*  corrupt;
    };

  #ifdef RocketTile 
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 3;
      int size = 4;
      int source = 2;
      int address = 32;
      int mask = 8;
      int data = 64;
      int corrupt = 1;
    };

    // TODO: hard-coded
    struct masks {
      uint8_t ready = (1UL << 1) - 1;
      uint8_t valid = (1UL << 1) - 1;
      uint8_t opcode = (1UL << 3) - 1;
      uint8_t param = (1UL << 3) - 1;
      uint8_t size = (1UL << 4) - 1;
      uint8_t source = (1UL << 2) - 1;
      //uint32_t address = (1UL << 32) - 1;
      uint32_t address = -1;
      uint8_t mask = (1UL << 8) - 1;
      uint64_t data = -1;
      uint8_t corrupt = (1UL << 1) - 1;
    };
  #endif

  #if defined(SmallBoomTile_1) || defined(SmallBoomTile_2)
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 3;
      int size = 4;
      int source = 3;
      int address = 32;
      int mask = 8;
      int data = 64;
      int corrupt = 1;
    };

    // TODO: hard-coded
    struct masks {
      uint8_t ready = (1UL << 1) - 1;
      uint8_t valid = (1UL << 1) - 1;
      uint8_t opcode = (1UL << 3) - 1;
      uint8_t param = (1UL << 3) - 1;
      uint8_t size = (1UL << 4) - 1;
      uint8_t source = (1UL << 3) - 1;
      //uint32_t address = (1UL << 32) - 1;
      uint32_t address = -1;
      uint8_t mask = (1UL << 8) - 1;
      uint64_t data = -1;
      uint8_t corrupt = (1UL << 1) - 1;
    };
  #endif

    connections ports;
    inner_connections inner_ports;
    lengths lens;
    masks mks;

    void set(
      RF::RTLflow& rtlflow, 
      RF::Top* dut,
      size_t stimuli_id
    );

    bool update();
    uint8_t fire() { return ports.ready & ports.valid; };
    void clear();
};

  //input         auto_tl_master_xing_out_a_ready,
  //output        auto_tl_master_xing_out_a_valid,
  //output [2:0]  auto_tl_master_xing_out_a_bits_opcode,
  //output [2:0]  auto_tl_master_xing_out_a_bits_param,
  //output [3:0]  auto_tl_master_xing_out_a_bits_size,
  //output [1:0]  auto_tl_master_xing_out_a_bits_source,
  //output [31:0] auto_tl_master_xing_out_a_bits_address,
  //output [7:0]  auto_tl_master_xing_out_a_bits_mask,
  //output [63:0] auto_tl_master_xing_out_a_bits_data,
  //output        auto_tl_master_xing_out_a_bits_corrupt,

void APorts::set(
  RF::RTLflow& rtlflow, 
  RF::Top* dut,
  size_t stimuli_id
) {
  inner_ports.ready = rtlflow.get(dut->auto_tl_master_xing_out_a_ready, stimuli_id);
  inner_ports.valid = rtlflow.get(dut->auto_tl_master_xing_out_a_valid, stimuli_id);
  inner_ports.opcode = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_opcode, stimuli_id);
  inner_ports.param = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_param, stimuli_id);
  inner_ports.size = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_size, stimuli_id);
  inner_ports.source = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_source, stimuli_id);
  inner_ports.address = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_address, stimuli_id);
  inner_ports.mask = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_mask, stimuli_id);
  inner_ports.data = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_data, stimuli_id);
  inner_ports.corrupt = rtlflow.get(dut->auto_tl_master_xing_out_a_bits_corrupt, stimuli_id);
}

bool APorts::update() {
  bool is_update{false};

  is_update |= !(*(inner_ports.ready) == ports.ready);
  is_update |= !(*(inner_ports.valid) == ports.valid);
  is_update |= !(*(inner_ports.opcode) == ports.opcode);
  is_update |= !(*(inner_ports.param) == ports.param);
  is_update |= !(*(inner_ports.size) == ports.size);
  is_update |= !(*(inner_ports.source) == ports.source);
  is_update |= !(*(inner_ports.address) == ports.address);
  is_update |= !(*(inner_ports.mask) == ports.mask);
  is_update |= !(*(inner_ports.data) == ports.data);
  is_update |= !(*(inner_ports.corrupt) == ports.corrupt);

  // input
  *(inner_ports.ready) = ports.ready;

  // output
  ports.valid = *(inner_ports.valid);
  ports.opcode = *(inner_ports.opcode);
  ports.param = *(inner_ports.param); 
  ports.size = *(inner_ports.size);
  ports.source = *(inner_ports.source);
  ports.address = *(inner_ports.address);
  ports.mask = *(inner_ports.mask);
  ports.data = *(inner_ports.data);
  ports.corrupt = *(inner_ports.corrupt);
  return is_update;
}

void APorts::clear() {
  ports.opcode = 0;
  ports.param = 0;
  ports.size = 0;
  ports.source = 0;
  ports.address = 0;
  ports.mask = 0;
  ports.data = 0;
  ports.corrupt = 0;
}


struct BPorts: public Ports {

  public:

    // c++ is static
    // currentl I hard-coded for RocketCore
    // TODO: needs to support boom
    struct connections {
      uint8_t ready;
      uint8_t valid;
      uint8_t opcode;
      uint8_t param;
      uint8_t size;
      uint8_t source;
      uint32_t address;
      uint8_t mask;
      uint64_t data;
      uint8_t corrupt;
    };

    struct inner_connections {
      uint8_t* ready;
      uint8_t* valid;
      uint8_t* opcode;
      uint8_t* param;
      uint8_t* size;
      uint8_t* source;
      uint32_t* address;
      uint8_t*  mask;
      uint64_t* data;
      uint8_t*  corrupt;
    };

  #ifdef RocketTile
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 2;
      int size = 4;
      int source = 2;
      int address = 32;
      int mask = 8;
      int data = 64;
      int corrupt = 1;
    };

    // TODO hard-coded
    struct masks {
      uint8_t ready = (1UL << 1) - 1;
      uint8_t valid = (1UL << 1) - 1;
      uint8_t opcode = (1UL << 3) - 1;
      uint8_t param = (1UL << 2) - 1;
      uint8_t size = (1UL << 4) - 1;
      uint8_t source = (1UL << 2) - 1;
      uint32_t address = -1;
      uint8_t mask = (1UL << 8) - 1;
      uint64_t data = -1;
      uint8_t corrupt = (1UL << 1) - 1;
    };
  #endif

  #if defined(SmallBoomTile_1) || defined(SmallBoomTile_2)
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 2;
      int size = 4;
      int source = 3;
      int address = 32;
      int mask = 8;
      int data = 64;
      int corrupt = 1;
    };

    // TODO hard-coded
    struct masks {
      uint8_t ready = (1UL << 1) - 1;
      uint8_t valid = (1UL << 1) - 1;
      uint8_t opcode = (1UL << 3) - 1;
      uint8_t param = (1UL << 2) - 1;
      uint8_t size = (1UL << 4) - 1;
      uint8_t source = (1UL << 3) - 1;
      uint32_t address = -1;
      uint8_t mask = (1UL << 8) - 1;
      uint64_t data = -1;
      uint8_t corrupt = (1UL << 1) - 1;
    };
  #endif

    connections ports;
    inner_connections inner_ports;
    lengths lens;
    masks mks;

    void set(
      RF::RTLflow& rtlflow, 
      RF::Top* dut,
      size_t stimuli_id
    );

    bool update();
    uint8_t fire() { return ports.ready & ports.valid; }
    void clear();
};

//output        auto_tl_master_xing_out_b_ready,
//input         auto_tl_master_xing_out_b_valid,
//input  [2:0]  auto_tl_master_xing_out_b_bits_opcode,
//input  [1:0]  auto_tl_master_xing_out_b_bits_param,
//input  [3:0]  auto_tl_master_xing_out_b_bits_size,
//input  [1:0]  auto_tl_master_xing_out_b_bits_source,
//input  [31:0] auto_tl_master_xing_out_b_bits_address,
//input  [7:0]  auto_tl_master_xing_out_b_bits_mask,
//input  [63:0] auto_tl_master_xing_out_b_bits_data,
//input         auto_tl_master_xing_out_b_bits_corrupt,
//
void BPorts::set(
  RF::RTLflow& rtlflow, 
  RF::Top* dut,
  size_t stimuli_id
) {
  inner_ports.ready = rtlflow.get(dut->auto_tl_master_xing_out_b_ready, stimuli_id);
  inner_ports.valid = rtlflow.get(dut->auto_tl_master_xing_out_b_valid, stimuli_id);
  inner_ports.opcode = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_opcode, stimuli_id);
  inner_ports.param = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_param, stimuli_id);
  inner_ports.size = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_size, stimuli_id);
  inner_ports.source = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_source, stimuli_id);
  inner_ports.address = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_address, stimuli_id);
  inner_ports.mask = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_mask, stimuli_id);
  inner_ports.data = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_data, stimuli_id);
  inner_ports.corrupt = rtlflow.get(dut->auto_tl_master_xing_out_b_bits_corrupt, stimuli_id);
}

bool BPorts::update() {

  bool is_update{false};

  is_update |= !(*(inner_ports.ready) == ports.ready);
  is_update |= !(*(inner_ports.valid) == ports.valid);
  is_update |= !(*(inner_ports.opcode) == ports.opcode);
  is_update |= !(*(inner_ports.param) == ports.param);
  is_update |= !(*(inner_ports.size) == ports.size);
  is_update |= !(*(inner_ports.source) == ports.source);
  is_update |= !(*(inner_ports.address) == ports.address);
  is_update |= !(*(inner_ports.mask) == ports.mask);
  is_update |= !(*(inner_ports.data) == ports.data);
  is_update |= !(*(inner_ports.corrupt) == ports.corrupt);

  // input
  *(inner_ports.valid) = ports.valid;
  *(inner_ports.opcode) = ports.opcode;
  *(inner_ports.param) = ports.param;
  *(inner_ports.size) = ports.size;
  *(inner_ports.source) = ports.source;
  *(inner_ports.address) = ports.address;
  *(inner_ports.mask) = ports.mask;
  *(inner_ports.data) = ports.data;
  *(inner_ports.corrupt) = ports.corrupt;

  // output
  ports.ready = *(inner_ports.ready);

  return is_update;
}

void BPorts::clear() {
  ports.opcode = 0;
  ports.param = 0;
  ports.size = 0;
  ports.source = 0;
  ports.address = 0;
  ports.mask = 0;
  ports.data = 0;
  ports.corrupt = 0;
}

struct CPorts: public Ports {

  public:

    // c++ is static
    // currentl I hard-coded for RocketCore
    // TODO: needs to support boom
    struct connections {
      uint8_t ready;
      uint8_t valid;
      uint8_t opcode;
      uint8_t param;
      uint8_t size;
      uint8_t source;
      uint32_t address;
      uint64_t data;
      uint8_t corrupt;
    };

    struct inner_connections {
      uint8_t* ready;
      uint8_t* valid;
      uint8_t* opcode;
      uint8_t* param;
      uint8_t* size;
      uint8_t* source;
      uint32_t* address;
      uint64_t* data;
      uint8_t*  corrupt;
    };

  #ifdef RocketTile
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 3;
      int size = 4;
      int source = 2;
      int address = 32;
      int data = 64;
      int corrupt = 1;
    };

    // TODO: hard-coded
    struct masks {
      uint8_t ready = (1UL << 1) - 1;
      uint8_t valid = (1UL << 1) - 1;
      uint8_t opcode = (1UL << 3) - 1;
      uint8_t param = (1UL << 3) - 1;
      uint8_t size = (1UL << 4) - 1;
      uint8_t source = (1UL << 2) - 1;
      uint32_t address = -1;
      uint64_t data = -1;
      uint8_t corrupt = (1UL << 1) - 1;
    };
  #endif

  #if defined(SmallBoomTile_1) || defined(SmallBoomTile_2)
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 3;
      int size = 4;
      int source = 3;
      int address = 32;
      int data = 64;
      int corrupt = 1;
    };

    // TODO: hard-coded
    struct masks {
      uint8_t ready = (1UL << 1) - 1;
      uint8_t valid = (1UL << 1) - 1;
      uint8_t opcode = (1UL << 3) - 1;
      uint8_t param = (1UL << 3) - 1;
      uint8_t size = (1UL << 4) - 1;
      uint8_t source = (1UL << 3) - 1;
      uint32_t address = -1;
      uint64_t data = -1;
      uint8_t corrupt = (1UL << 1) - 1;
    };
  #endif


    connections ports;
    inner_connections inner_ports;
    lengths lens;
    masks mks;

    void set(
      RF::RTLflow& rtlflow, 
      RF::Top* dut,
      size_t stimuli_id
    );

    bool update();
    uint8_t fire() { return ports.ready & ports.valid; };
    void clear();
};

  //input         auto_tl_master_xing_out_c_ready,
  //output        auto_tl_master_xing_out_c_valid,
  //output [2:0]  auto_tl_master_xing_out_c_bits_opcode,
  //output [2:0]  auto_tl_master_xing_out_c_bits_param,
  //output [3:0]  auto_tl_master_xing_out_c_bits_size,
  //output [1:0]  auto_tl_master_xing_out_c_bits_source,
  //output [31:0] auto_tl_master_xing_out_c_bits_address,
  //output [63:0] auto_tl_master_xing_out_c_bits_data,
  //output        auto_tl_master_xing_out_c_bits_corrupt,
  //
void CPorts::set(
  RF::RTLflow& rtlflow, 
  RF::Top* dut,
  size_t stimuli_id
) {
  inner_ports.ready = rtlflow.get(dut->auto_tl_master_xing_out_c_ready, stimuli_id);
  inner_ports.valid = rtlflow.get(dut->auto_tl_master_xing_out_c_valid, stimuli_id);
  inner_ports.opcode = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_opcode, stimuli_id);
  inner_ports.param = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_param, stimuli_id);
  inner_ports.size = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_size, stimuli_id);
  inner_ports.source = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_source, stimuli_id);
  inner_ports.address = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_address, stimuli_id);
  inner_ports.data = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_data, stimuli_id);
  inner_ports.corrupt = rtlflow.get(dut->auto_tl_master_xing_out_c_bits_corrupt, stimuli_id);
}

bool CPorts::update() {


  bool is_update{false};

  is_update |= !(*(inner_ports.ready) == ports.ready);
  is_update |= !(*(inner_ports.valid) == ports.valid);
  is_update |= !(*(inner_ports.opcode) == ports.opcode);
  is_update |= !(*(inner_ports.param) == ports.param);
  is_update |= !(*(inner_ports.size) == ports.size);
  is_update |= !(*(inner_ports.source) == ports.source);
  is_update |= !(*(inner_ports.address) == ports.address);
  is_update |= !(*(inner_ports.data) == ports.data);
  is_update |= !(*(inner_ports.corrupt) == ports.corrupt);

  // input
  *(inner_ports.ready) = ports.ready;

  // output
  ports.valid = *(inner_ports.valid);
  ports.opcode = *(inner_ports.opcode);
  ports.param = *(inner_ports.param); 
  ports.size = *(inner_ports.size);
  ports.source = *(inner_ports.source);
  ports.address = *(inner_ports.address);
  ports.data = *(inner_ports.data);
  ports.corrupt = *(inner_ports.corrupt);

  return is_update;
}

void CPorts::clear() {
  ports.opcode = 0;
  ports.param = 0;
  ports.size = 0;
  ports.source = 0;
  ports.address = 0;
  ports.data = 0;
  ports.corrupt = 0;
}

struct DPorts: public Ports {

  public:

    // c++ is static
    // currentl I hard-coded for RocketCore
    // TODO: needs to support boom
    struct connections {
      uint8_t ready;
      uint8_t valid;
      uint8_t opcode;
      uint8_t param;
      uint8_t size;
      uint8_t source;
      uint8_t sink;
      uint8_t denied;
      uint64_t data;
      uint8_t corrupt;
    };

    struct inner_connections {
      uint8_t* ready;
      uint8_t* valid;
      uint8_t* opcode;
      uint8_t* param;
      uint8_t* size;
      uint8_t* source;
      uint8_t* sink;
      uint8_t* denied;
      uint64_t* data;
      uint8_t* corrupt;
    };

  // TODO: hard-coded
  #ifdef RocketTile
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 2;
      int size = 4;
      int source = 2;
      int sink = 2;
      int data = 64;
      int corrupt = 1;
      int denied = 1;
    };

    struct masks {
      uint8_t ready = (1 << 1) - 1;
      uint8_t valid = (1 << 1) - 1;
      uint8_t opcode = (1 << 3) - 1;
      uint8_t param = (1 << 2) - 1;
      uint8_t size = (1 << 4) - 1;
      uint8_t source = (1 << 2) - 1;
      uint8_t sink = (1 << 2) - 1;
      uint64_t data = -1;
      uint8_t corrupt = (1 << 1) - 1;
      uint8_t denied = (1 << 1) - 1;
    };
  #endif

  #if defined(SmallBoomTile_1) || defined(SmallBoomTile_2)
    struct lengths {
      int ready = 1;
      int valid = 1;
      int opcode = 3;
      int param = 2;
      int size = 4;
      int source = 3;
      int sink = 3;
      int data = 64;
      int corrupt = 1;
      int denied = 1;
    };

    struct masks {
      uint8_t ready = (1 << 1) - 1;
      uint8_t valid = (1 << 1) - 1;
      uint8_t opcode = (1 << 3) - 1;
      uint8_t param = (1 << 2) - 1;
      uint8_t size = (1 << 4) - 1;
      uint8_t source = (1 << 3) - 1;
      uint8_t sink = (1 << 3) - 1;
      uint64_t data = -1;
      uint8_t corrupt = (1 << 1) - 1;
      uint8_t denied = (1 << 1) - 1;
    };
  #endif


    connections ports;
    inner_connections inner_ports;
    lengths lens;
    masks mks;

    void set(
      RF::RTLflow& rtlflow, 
      RF::Top* dut,
      size_t stimuli_id
    );

    bool update();
    uint8_t fire() { return ports.ready & ports.valid; };
    void clear();
};

  //output        auto_tl_master_xing_out_d_ready,
  //input         auto_tl_master_xing_out_d_valid,
  //input  [2:0]  auto_tl_master_xing_out_d_bits_opcode,
  //input  [1:0]  auto_tl_master_xing_out_d_bits_param,
  //input  [3:0]  auto_tl_master_xing_out_d_bits_size,
  //input  [1:0]  auto_tl_master_xing_out_d_bits_source,
  //input  [1:0]  auto_tl_master_xing_out_d_bits_sink,
  //input         auto_tl_master_xing_out_d_bits_denied,
  //input  [63:0] auto_tl_master_xing_out_d_bits_data,
  //input         auto_tl_master_xing_out_d_bits_corrupt,
void DPorts::set(
  RF::RTLflow& rtlflow, 
  RF::Top* dut,
  size_t stimuli_id
) {
  inner_ports.ready = rtlflow.get(dut->auto_tl_master_xing_out_d_ready, stimuli_id);
  inner_ports.valid = rtlflow.get(dut->auto_tl_master_xing_out_d_valid, stimuli_id);
  inner_ports.opcode = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_opcode, stimuli_id);
  inner_ports.param = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_param, stimuli_id);
  inner_ports.size = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_size, stimuli_id);
  inner_ports.source = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_source, stimuli_id);
  inner_ports.sink = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_sink, stimuli_id);
  inner_ports.denied = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_denied, stimuli_id);
  inner_ports.data = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_data, stimuli_id);
  inner_ports.corrupt = rtlflow.get(dut->auto_tl_master_xing_out_d_bits_corrupt, stimuli_id);
}

bool DPorts::update() {

  bool is_update{false};

  is_update |= !(*(inner_ports.ready) == ports.ready);
  is_update |= !(*(inner_ports.valid) == ports.valid);
  is_update |= !(*(inner_ports.opcode) == ports.opcode);
  is_update |= !(*(inner_ports.param) == ports.param);
  is_update |= !(*(inner_ports.size) == ports.size);
  is_update |= !(*(inner_ports.source) == ports.source);
  is_update |= !(*(inner_ports.sink) == ports.sink);
  is_update |= !(*(inner_ports.denied) == ports.denied);
  is_update |= !(*(inner_ports.data) == ports.data);
  is_update |= !(*(inner_ports.corrupt) == ports.corrupt);

  // input
  *(inner_ports.valid) = ports.valid;
  *(inner_ports.opcode) = ports.opcode;
  *(inner_ports.param) = ports.param;
  *(inner_ports.size) = ports.size;
  *(inner_ports.source) = ports.source;
  *(inner_ports.sink) = ports.sink;
  *(inner_ports.denied) = ports.denied;
  *(inner_ports.data) = ports.data;
  *(inner_ports.corrupt) = ports.corrupt;

  // output
  ports.ready = *(inner_ports.ready);

  return is_update;
}

void DPorts::clear() {
  ports.opcode = 0;
  ports.param = 0;
  ports.size = 0;
  ports.source = 0;
  ports.sink = 0;
  ports.denied = 0;
  ports.data = 0;
  ports.corrupt = 0;
}


struct EPorts: public Ports {

  public:

    // c++ is static
    // currentl I hard-coded for RocketCore
    // TODO: needs to support boom
    struct connections {
      uint8_t ready;
      uint8_t valid;
      uint8_t sink;
    };

    struct inner_connections {
      uint8_t* ready;
      uint8_t* valid;
      uint8_t* sink;
    };

  #ifdef RocketTile
    struct lengths {
      int ready = 1;
      int valid = 1;
      int sink = 2;
    };

    struct masks {
      uint8_t ready = (1 << 1) - 1;
      uint8_t valid = (1 << 1) - 1;
      uint8_t sink = (1 << 2) - 1;
    };
  #endif

  #if defined(SmallBoomTile_1) || defined(SmallBoomTile_2)
    struct lengths {
      int ready = 1;
      int valid = 1;
      int sink = 3;
    };

    struct masks {
      uint8_t ready = (1 << 1) - 1;
      uint8_t valid = (1 << 1) - 1;
      uint8_t sink = (1 << 3) - 1;
    };
  #endif

    connections ports;
    inner_connections inner_ports;
    lengths lens;
    masks mks;

    void set(
      RF::RTLflow& rtlflow, 
      RF::Top* dut,
      size_t stimuli_id
    );

    bool update();
    uint8_t fire() { return ports.ready & ports.valid; };
    void clear();
};

  //input         auto_tl_master_xing_out_e_ready,
  //output        auto_tl_master_xing_out_e_valid,
  //output [1:0]  auto_tl_master_xing_out_e_bits_sink,
void EPorts::set(
  RF::RTLflow& rtlflow, 
  RF::Top* dut,
  size_t stimuli_id
) {
  inner_ports.ready = rtlflow.get(dut->auto_tl_master_xing_out_e_ready, stimuli_id);
  inner_ports.valid = rtlflow.get(dut->auto_tl_master_xing_out_e_valid, stimuli_id);
  inner_ports.sink = rtlflow.get(dut->auto_tl_master_xing_out_e_bits_sink, stimuli_id);
}

bool EPorts::update() {
  bool is_update{false};

  is_update |= !(*(inner_ports.ready) == ports.ready);
  is_update |= !(*(inner_ports.valid) == ports.valid);
  is_update |= !(*(inner_ports.sink) == ports.sink);

  // input
  *(inner_ports.ready) = ports.ready;

  // output
  ports.valid = *(inner_ports.valid);
  ports.sink = *(inner_ports.sink);

  return is_update;
}

void EPorts::clear() {
  ports.sink = 0;
}

// Callback functions which tilelink adapter should run
template <typename F, typename... Args>
Callback submit(F f, Args&&... args) {

  return  [f, args...]() mutable {
    f(args...);
  };
}

//template <typename F>
//Callback submit(F f) {

  //return  [f, args...]() mutable {
    //f(args...);
  //};
//}
//template <typename... Args>
//class CallBack {

  //public:

    //CallBack();
    //CallBack(const Args& args...);
    //CallBack(const std::function<void(Args...)>& func, const Args& args);

    //CallBack(const CallBack&) = default;
    //CallBack(CallBack&&) = default;
    //~CallBack() = default;

    //void call();

  //private:

    //std::function<void(Args...)> func;
    //Args args;
    
//};

//template <typename... Args>
//CallBack<Args...>::CallBack() {
//}


//template <typename... Args>
//CallBack<Args...>::CallBack(const Args& ...args): args{args} {
//}

//template <typename... Args>
//CallBack<Args...>::CallBack(const std::function<void(Args...)>& func, const Args&... args): func{func}, args{args} {
//}

//template <typename... Args>
//void CallBack<Args...>::call() {
  //func(args);
//}

/* Tilelinke D_ports/B_ports Queue
Merge responses from TL_A_port and TL_C_port into queue.
Used for serializing the responses into the responses in ports
*/

struct tlDMessage {

  public:

    tlDMessage() = default;
    ~tlDMessage() = default;
    tlDMessage(const tlDMessage&) = default;
    tlDMessage(tlDMessage&&) = default;
    tlDMessage& operator = (const tlDMessage&) = default;
    tlDMessage& operator = (tlDMessage&&) = default;

    tlDMessage(const std::string& message, const Args& kwargs);


    std::vector<std::string> _slots{"opcode", "param", "size", "source", "sink", "data", "corrupt", "denied"};

    std::vector<std::string> _messages{"AccessAckData", "AccessAck", "HintAck", "Grant", "GrantData", "ReleaseAck"};

    unsigned long opcode{0};
    unsigned long param{0};
    unsigned long size{0};
    unsigned long source{0};
    unsigned long sink{0};
    unsigned long long data{0};
    unsigned long corrupt{0};
    unsigned long denied{0};
    std::string msg;
};

tlDMessage::tlDMessage(const std::string& message, const Args& kwargs) {
  //for attr in self.__slots__:
      //setattr(self, attr, 0)
  msg = message;

  if(message == "AccessAckData") {
    opcode = ACCESS_ACK_DATA;
    param = 0;
    data = kwargs.data;
  }
  else if(message == "AccessAck") {
    opcode = ACCESS_ACK;
    param = 0;
  }
  else if(message == "HintAck") {
    opcode = HINT_ACK;
    param = 0;
  }
  else if(message == "Grant") {
    opcode = GRANT;
    param = kwargs.param;
    sink = kwargs.sink;
  }

  else if(message == "GrantData") {
    opcode = GRANT_DATA;
    param = kwargs.param;
    sink = kwargs.sink;
    data = kwargs.data;
  }

  else { // ReleaseAck
    opcode = RELEASE_ACK;
    param = 0;
  }

  size = kwargs.size;
  source = kwargs.source;
}

struct tlBMessage {

  public:

    tlBMessage() = default;
    ~tlBMessage() = default;
    tlBMessage(const tlBMessage&) = default;
    tlBMessage(tlBMessage&&) = default;
    tlBMessage& operator = (const tlBMessage&) = default;
    tlBMessage& operator = (tlBMessage&&) = default;

    tlBMessage(const std::string& message, const Args& kwargs);

    std::vector<std::string> _slots{"opcode", "param", "size", "source", "address", "mask", "data"};

    std::vector<std::string> _messages{"Get", "PutFullData", "PutPartialData", "ArithmeticData", "LogicalData", "Intent", "ProbeBlock", "ProbePerm"};

    unsigned long opcode{0};
    unsigned long param{0};
    unsigned long size{0};
    unsigned long source{0};
    unsigned long address{0};
    unsigned long mask{0};
    unsigned long long data{0};

    std::string msg;

};

tlBMessage::tlBMessage(const std::string& message, const Args& kwargs) {
    //assert message in self.messages, \
        //'{} is not in tlBMessages'.format(message)

    //for attr in self.__slots__:
        //setattr(self, attr, 0)
    msg = message;

    if(message == "Get") {
      opcode = GET;
      param = 0;
    }
    else if(message == "PutFullData") {
      opcode = PUT_FULL_DATA;
      param = 0;
      data = kwargs.data;
    }
    else if(message == "PutPartialData") {
      opcode = PUT_PARTIAL_DATA;
      param = 0;
      data = kwargs.data;
    }
    else if(message == "ArithmeticData") {
      opcode = ARITHMETIC_DATA;
      param = kwargs.param;
      data = kwargs.data;
    }
    else if(message == "LogicalData") {
      opcode = LOGICAL_DATA;
      param = kwargs.param;
      data = kwargs.data;
    }
    else if(message == "Intent") {
      opcode = INTENT;
      param = kwargs.param;
    }
    else if(message == "ProbeBlock") {
      opcode = PROBE_BLOCK;
      param = kwargs.param;
    }
    else if(message == "ProbePerm") {
      opcode = PROBE_PERM;
      param = kwargs.param;
    }
    size = kwargs.size;
    source = kwargs.source;
    address = kwargs.address;
    mask = kwargs.mask;
}

template <typename Msg>
class Queue {

  public:

    void clear();
  
    void push(const Msg& message, const Callback& callback) { assert(false); };

    //virtual bool check_msg(const Msg& message);

    //void check_msg(std::string& message);

    void push_msgs(const std::vector<Msg>& messages);

    void push_msg_cbs(const std::vector<Msg>& msgs, const std::vector<Callback>& cbs);

    std::pair<Msg, Callback> pop();

    bool empty();

  protected:

    std::queue<std::pair<Msg, Callback>> _queue;
};

template <typename Msg>
void Queue<Msg>::clear() {
  while(!_queue.empty()) {
    _queue.pop();
  }
}

template <typename Msg>
void Queue<Msg>::push_msgs(const std::vector<Msg>& messages) {
  for(auto&& msg: messages) {
    //check_msg(msg);
    //Args args;
    _queue.push({msg, Callback([](){})});
  }
}

// TODO: do we need this?
template <typename Msg>
void Queue<Msg>::push_msg_cbs(
  const std::vector<Msg>& messages, 
  const std::vector<Callback>& cbs
) {
  assert(messages.size() == cbs.size());

  for(size_t i = 0; i < messages.size(); ++i) {
    //check_msg(msg);
    _queue.push({messages[i], cbs[i]});
  }
}

template <typename Msg>
std::pair<Msg, Callback> Queue<Msg>::pop() {
  auto tmp = _queue.front();
  _queue.pop();
  return tmp;
}

template <typename Msg>
bool Queue<Msg>::empty() {
  return _queue.empty();
}

class tlDQueue : public Queue<tlDMessage> {

  public:

    void push(const tlDMessage& message, const Callback& callback);

    //bool check_msg(const tlDQueue& message);

    //void check_msg(std::string& message);

};

void tlDQueue::push(const tlDMessage& message, const Callback& callback) {
  if(message.msg == "Bubble") {
    _queue.push({tlDMessage(), Callback([](){})});
  }
  else {
    _queue.push({message, callback});
  }
}

//bool tlDQueue::check_msg(const tlDQueue& message) {
//}

class tlBQueue : public Queue<tlBMessage> {

  public:

    void push(const tlBMessage& message, const Callback& callback);

    //bool check_msg(const tlBQueue& message);

    //void check_msg(std::string& message);

};

// TODO: tlBQueue does not have callback?
void tlBQueue::push(const tlBMessage& message, const Callback& callback) {
  if(message.msg == "Bubble") {
    _queue.push({tlBMessage(), Callback([](){})});
  }
  else {
    _queue.push({message, callback});
  }
}

//bool tlBQueue::check_msg(const tlBQueue& message) {
//}

class FreeList {

  public:
    
    FreeList(const std::string& name, std::list<int>& init_list);
    ~FreeList();
    FreeList(const FreeList&) = default;
    FreeList(FreeList&&) = default;
    FreeList& operator = (const FreeList&) = default;
    FreeList& operator = (FreeList&&) = default;

    int get();

    bool empty();

    void reserve(Callback callback);

    void release(int ret);
  

  private:

    //std::random_device _rd;
    std::mt19937 _eng;
    std::string _name;
    std::list<int>& _init_list;
    std::list<int> _free_list;
    std::queue<Callback> _event_queue;
};

FreeList::FreeList(const std::string& name, std::list<int>& init_list):
  _eng{0}, _name{name}, _init_list{init_list}, _free_list{init_list} {
}

FreeList::~FreeList() {
}

int FreeList::get() {
  assert(!_free_list.empty());

  //std::uniform_int_distribution<> distr(0, _free_list.size() - 1);

  //int choose = distr(_eng);

  auto it = _free_list.begin();
  //std::advance(it, choose);

  int ret = *it;

  _free_list.erase(it);

  return ret;
}

bool FreeList::empty() {
  return _free_list.empty();
}

void FreeList::reserve(Callback callback) {
  _event_queue.push(callback);
}

void FreeList::release(int ret) {
        //assert ret in self.init_list, \
            //'{} not in {} init_list'.format(ret, self.name)
        //assert ret not in self.free_list, \
            //'{} already in {} free_list'.format(ret, self.name)
  //std::cerr << "list_size: " << _free_list.size() << "\n";
  _free_list.push_back(ret);

  if(!_event_queue.empty()) {
    auto event = _event_queue.front();
    //std::cerr << "event\n";
    event();
    _event_queue.pop();
    //std::cerr << "after event\n";
  }
  //std::cerr << "after list_size: " << _free_list.size() << "\n";
}

class srcToCallback {

  public:
    
    srcToCallback(const std::string& name, const std::list<int>& init_srcs);
    ~srcToCallback() = default;
    srcToCallback(const srcToCallback&) = default;
    srcToCallback(srcToCallback&&) = default;
    srcToCallback& operator = (const srcToCallback&) = default;
    srcToCallback& operator = (srcToCallback&&) = default;

    void set(int src, Callback& callback);

    void call(int src);

  private:

    std::string _name;
    std::list<int> _init_srcs;
    std::unordered_map<int, Callback> _c_map;
};

srcToCallback::srcToCallback(const std::string& name, const std::list<int>& init_srcs): 
  _name{name}, _init_srcs{init_srcs}
{
}

void srcToCallback::set(int src, Callback& callback) {
  _c_map.insert({src, callback});
}

void srcToCallback::call(int src) {
  auto it = _c_map.find(src);
  if(it != _c_map.end()) {
    Callback cb = (*it).second;
    cb();
    _c_map.erase(it);
  }
}

// TL_A Assertions 
//void A_assertions(
  //opcode, param, size, addr, mask, bool debug = false) {
  //if (debug) {
        //if opcode == GET:
            //assert param == 0, 'GET: param must be 0'
            //assert addr % pow(2, size) == 0, \
                //'GET: address must be aligned to size'
            //assert (mask & (mask + (mask & -mask))) == 0, \
                //'GET: bits in mask must be contiguous'

        //elif opcode == PUT_FULL_DATA:
            //assert param == 0, 'PUT_FULL_DATA: param must be 0'
            //assert addr % pow(2, size) == 0, \
                //'PUT_FULL_DATA: address must be aligned to size'
            //assert (mask & (mask + (mask & -mask))) == 0, \
                //'PUT_FULL_DATA: bits in mask must be contiguous'

        //elif opcode == PUT_PARTIAL_DATA:
            //assert param == 0, 'PUT_PARTIAL_DATA: param must be 0'
            //assert addr % pow(2, size) == 0, \
                //'PUT_PARTIAL_DATA: address must be aligned to size'

        //elif opcode == ARITHMETIC_DATA:
            //assert param < 5, \
                //'ARITHMETIC_DATA: param must be lower than 5'
            //assert addr % pow(2, size) == 0, \
                //'ARITHMETIC_DATA: address must be aligned to size'
            //assert (mask & (mask + (mask & -mask))) == 0, \
                //'ARITHMETIC_DATA: bits in mask must be contiguous'

        //elif opcode == LOGICAL_DATA:
            //assert param < 4, \
                //'LOGICAL_DATA: param must be lower than 4'
            //assert addr % pow(2, size) == 0, \
                //'LOGICAL_DATA: address must be aligned to size'
            //assert (mask & (mask + (mask & -mask))) == 0, \
                //'LOGICAL_DATA: bits in mask must be contiguous'

        //elif opcode == INTENT:
            //assert param < 2, \
                //'INTENT: param must be lower than 2'
            //assert addr % pow(2, size) == 0, \
                //'INTENT: address must be aligned to size'

        //elif opcode == ACQUIRE_BLOCK:
            //assert param in [NtoB, NtoT, BtoT], \
                //'ACQUIRE_BLOCK: param must be in GROW transactions'
            //assert addr % pow(2, size) == 0, \
                //'ACQUIRE_BLOCK: address must be aligned to size'
            //assert (mask & (mask + (mask & -mask))) == 0, \
                //'ACQUIRE_BLOCK: bits in mask must be contiguous'

        //elif opcode == ACQUIRE_PERM:
            //assert param in [NtoB, NtoT, BtoT], \
                //'ACQUIRE_PERM: param must be in GROW transactions'
            //assert addr % pow(2, size) == 0, \
                //'ACQUIRE_PERM: address must be aligned to size'
            //assert (mask & (mask + (mask & -mask))) == 0, \
                //'ACQUIRE_PERM: bits in mask must be contiguous'
  //}
//}

// TL_C Assertions 
//void C_assertions(opcode, param, size, addr, corrupt, bool debug = false) {
    //if (debug) {
        //// TODO, Add assertions for ACCESS_ACK, ACCESS_ACK_DATA, HINT_ACK
        //if (opcode == PROBE_ACK) {
          //assert param in [TtoB, TtoN, BtoN, TtoT, BtoB, NtoN], \
              //'PROBE_ACK: param must be PRUNE or REPORT'
          //assert addr % pow(2, size) == 0, \
              //'PROBE_ACK: address must be aligned to size'
          //assert corrupt == 0, \
              //'PROBE_ACK: corrupt must be 0'
        //}
        //else if (opcode == PROBE_ACK_DATA) {
          //assert param in [TtoB, TtoN, BtoN, TtoT, BtoB, NtoN], \
              //'PROBE_ACK: param must be PRUNE or REPORT'
          //assert addr % pow(2, size) == 0, \
              //'PROBE_ACK: address must be aligned to size'
          //assert corrupt == 0, \
              //'PROBE_ACK: corrupt must be 0'
        //}
        //else if (opcode == RELEASE) {
          //assert param in [TtoB, TtoN, BtoN, TtoT, BtoB, NtoN], \
              //'RELEASE: param must be in PRUNE or REPORT transitions'
          //assert addr % pow(2, size) == 0, \
              //'RELEASE: address must be aligned to size'
        //}
        //else if (opcode == RELEASE_DATA) {
          //assert param in [TtoB, TtoN, BtoN], \
              //'RELEASE: param must be in PRUNE transitions'
          //assert addr % pow(2, size) == 0, \
              //'RELEASE: address must be aligned to size'
        //}
    //}
//}

} // end of name space gf
