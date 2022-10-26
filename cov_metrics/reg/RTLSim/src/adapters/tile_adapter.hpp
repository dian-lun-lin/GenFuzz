#pragma once
#include "tilelink/adapter.hpp"
#include <vector>
#include <rtlflow.h>

namespace gf {

unsigned int INT_MEIP = 0x4;
unsigned int INT_SEIP = 0x8;
unsigned int INT_MTIP = 0x1;
unsigned int INT_MSIP = 0x2;

struct intPorts {

  public:

    //intPorts(RF::RTLflow& rtlflow, RF::Top* top);

    std::vector<std::string> _slots{"seip", "meip",  "msip", "mtip"};

    struct connections {
      uint8_t* seip;
      uint8_t* meip;
      uint8_t* msip;
      uint8_t* mtip;
    };

    connections ports;

    void set(
      RF::RTLflow& rtlflow,
      RF::Top* dut,
      size_t stimuli_id
    );

};

void intPorts::set(
  RF::RTLflow& rtlflow,
  RF::Top* dut,
  size_t stimuli_id
) {
  ports.seip = rtlflow.get(dut->auto_int_in_xing_in_2_sync_0, stimuli_id);
  ports.meip = rtlflow.get(dut->auto_int_in_xing_in_1_sync_0, stimuli_id);
  ports.msip = rtlflow.get(dut->auto_int_in_xing_in_0_sync_0, stimuli_id);
  ports.mtip = rtlflow.get(dut->auto_int_in_xing_in_0_sync_1, stimuli_id);
}

class tileAdapter {

  public:

    tileAdapter(tileAdapter&&) = default;
    tileAdapter(const tileAdapter&) = default;
    tileAdapter(RF::RTLflow& rtlflow, RF::Top* dut, bool debug = false);
    ~tileAdapter();
    //tileAdapter& operator = (const tileAdapter&) = default;
    //tileAdapter& operator = (tileAdapter&&) = default;

    void start(
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      std::unordered_map<unsigned long long, unsigned long long>& ints
    );

    void drive_input(
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      std::unordered_map<unsigned long long, unsigned long long>& ints
    );

    void debug_print(std::string& message);
    void assert_intr(unsigned int intr);
    uint8_t pc_valid();
    void interrupt_handler(std::unordered_map<unsigned long long, unsigned long long>& ints);
    void probe_tohost(unsigned int tohost_addr);
    bool check_assert();
    void start();
    void stop();

    bool update();

    void set(size_t stimuli_id);

    bool onGoing();
    bool isRunning();

    void drive_stop();
    void clear();

  private:
    
    size_t _stimuli_id;
    RF::RTLflow& _rtlflow;
    RF::Top* _dut;
    bool _drive;
    bool _debug;
    tlAdapter _tl_adapter;
    intPorts _int_ports;
    uint32_t* _reset_vector_port;
    uint8_t* _monitor_pc;
    uint8_t* _monitor_valid;
    unsigned int _intr;
   
};

bool tileAdapter::update() {
  return _tl_adapter.update();
}

void tileAdapter::set(
  size_t stimuli_id
) {
  _stimuli_id = stimuli_id;

  _tl_adapter.set(_stimuli_id);
  _int_ports.set(_rtlflow, _dut, _stimuli_id);

  #ifdef RocketTile
    auto reset_vector_port = _rtlflow.get(_dut->auto_reset_vector_in, _stimuli_id);
  #endif

  #if defined(SmallBoomTile_1) || defined(SmallBoomTile_2)
    auto reset_vector_port = _rtlflow.get(_dut->constants_reset_vector, _stimuli_id);
  #endif

  *reset_vector_port = 0x10000;

}

tileAdapter::tileAdapter(
  //std::vector<std::string> port_names,
  RF::RTLflow& rtlflow,
  RF::Top* dut,
  bool debug
): _rtlflow{rtlflow}, _drive{false}, _tl_adapter{rtlflow, dut, TL_C, 64, debug}, _dut{dut}, _debug{debug} , _intr{0} {

  //std::vector<std::string> tl_port_names;
  //std::vector<std::string> int_port_names;
  //std::vector<std::string> others;
  //std::string reset_vector_port;

  //for(auto&& name: port_names) {
    //if (name.find("tl") != std::string::npos) {
      //tl_port_names.insert(name);
    //}
    //else if(name.find("_int") != std::string::npos) {
      //int_port_names.insert(name);
    //}
    //else if(name.find("reset_vector") != std::string::npos) {
      //reset_vector_ports = name;
    //}
    //else {
      //others.insert(name);
    //}
  //}
  //std::string pc_name = monitor[0];
  //std::string valid_name = monitor[1];
  //unsigned int protocol;

  //for(auto&& name: tl_port_names) {
    //if(name.find("_b_") != std::string::npos) {
  //protocol = TL_C;
    //}
  //}

  //_tl_adapter = tlAdapter(dut, protocol, 64, debug);
  //_int_ports = intPorts(rtlflow, dut);
  

  //_monitor_valid = rtlflow.get(dut->core.wb_reg_valid, 0);
  //_monitor_pc = rtlflow.get(dut->core.wb_reg_pc, 0);
}

tileAdapter::~tileAdapter() {
}

void tileAdapter::debug_print(std::string& message) {
  if (_debug) {
    std::cerr << message;
  }
}

void tileAdapter::assert_intr(unsigned int intr) {
  if (intr == _intr) {
    return;
  }

  _intr = intr;
  auto meip = int((_intr & INT_MEIP) == INT_MEIP);
  auto seip = int((_intr & INT_SEIP) == INT_SEIP);
  auto mtip = int((_intr & INT_MTIP) == INT_MTIP);
  auto msip = int((_intr & INT_MSIP) == INT_MSIP);

  *(_int_ports.ports.seip) = seip;
  *(_int_ports.ports.meip) = meip;
  *(_int_ports.ports.msip) = msip;
  *(_int_ports.ports.mtip) = mtip;
}

uint8_t tileAdapter::pc_valid() {
  return *_monitor_valid;
}

void tileAdapter::interrupt_handler(std::unordered_map<unsigned long long, unsigned long long>& ints) {
  if(ints.empty()) {
    return;
  }
  assert(false);

  // called by start
  // only be called once
  //while(_drive) {
      //if (pc_valid()) {
          //unsigned int pc = *_monitor_pc & ((1 << len(*_monitor_pc)) - 1);
          //auto it = ints.find(pc);
          //if(it != ints.end()) {
          //}
            ////debug_print("[RTLHost] interrupt_handler, pc: {:016x}, INT: {:01x}"
                             ////format(pc, ints[pc]))
            //assert_intr(ints[pc]);
          //}
      //}
      //RisingEdge(rtlflow.get(_dut->clock, 0));
  //}
}


void tileAdapter::probe_tohost(unsigned int tohost_addr) {
  _tl_adapter.probe_block(tohost_addr);
}

bool tileAdapter::check_assert() {
  return *_rtlflow.get(_dut->metaAssert, _stimuli_id);
}

void tileAdapter::start(
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  std::unordered_map<unsigned long long, unsigned long long>& ints
) {
  //if memory.__class__.__name__ != 'dict':
      //raise Exception('RocketTile Adapter must receive address map to drive DUT')

  _drive = true;
  _tl_adapter.start(memory);
  //interrupt_handler(ints);
}

void tileAdapter::drive_input(
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  std::unordered_map<unsigned long long, unsigned long long>& ints
) {
  _tl_adapter.drive_input(memory);
  //interrupt_handler(ints);
}

bool tileAdapter::onGoing() {
  return _tl_adapter.onGoing();
}

bool tileAdapter::isRunning() {
  return _tl_adapter.isRunning();
}

void tileAdapter::drive_stop() {
  _drive = false;
}

void tileAdapter::stop() {
  _tl_adapter.stop();
}

void tileAdapter::clear() {
  *(_int_ports.ports.seip) = 0;
  *(_int_ports.ports.meip) = 0;
  *(_int_ports.ports.msip) = 0;
  *(_int_ports.ports.mtip) = 0;

  _intr = 0;
}

} // end of namespace gf
