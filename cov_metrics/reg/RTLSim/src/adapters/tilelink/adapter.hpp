#pragma once

#include <sstream>
#include <fstream>


#include "utils.hpp"
#include "definitions.h"
#include "rtlflow.h"
#include <bits/stdc++.h>
#include <vector>
#include <queue>
#include <list>
#include <string>
#include <math.h>

/* Tilelink adapter
, which acts as a tilelink slave 

tilelink specification

Mandatory (TL-UL, TL-UH)
    Channel A       |    Channel D 
        a_opcode    |        d_opcode    
        a_param     |        d_param
        a_size      |        d_size     
        a_source    |        d_source   
        a_address   |        d_sink  
        a_mask      |        d_data     
        a_data      |        d_corrupt     
        a_valid     |        d_denied
        a_ready     |        d_valid
                    |        d_ready
TL-C
    Channel B       |   Channel C       |   Channel E   
        b_opcode    |       c_opcode    |       e_sink
        b_param     |       c_param     |       e_valid
        b_size      |       c_size      |       e_ready
        b_source    |       c_source    |
        b_address   |       c_address   |
        b_mask      |       c_data      |
        b_data      |       c_corrupt   |
        b_valid     |       c_valid     |
        b_ready     |       c_ready     |

*/

namespace gf {


class tlAdapter {

  public:

    tlAdapter(
      RF::RTLflow& rtlflow,
      RF::Top* dut,
      unsigned long protocol = TL_UL,
      size_t block_size = 64,
      bool debug = false
    );

    tlAdapter(const tlAdapter&) = default;
    tlAdapter(tlAdapter&&) = default;
    tlAdapter& operator = (const tlAdapter&) = default;
    tlAdapter& operator = (tlAdapter&&) = default;
    ~tlAdapter() = default;

    std::vector<tlDMessage> get_d_messages(
      const std::string& message, 
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      size_t burst_len, 
      unsigned long long addr_aligned, 
      Args& args
    );

    void enableProbe();

    void updatePerm(
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      unsigned long long block_addr, 
      unsigned long param
    );

    void retrieveBlock(
      FreeList& b_srcs, 
      srcToCallback& b_callback, 
      Callback callback, 
      unsigned long param, 
      unsigned long size, 
      unsigned long addr, 
      unsigned long mask, 
      const std::string& msg="ProbeBlock"
    );

    void retrieveBlock_cb(
      const std::string& msg, 
      FreeList& b_srcs, 
      srcToCallback& b_callback, 
      Callback callback, 
      unsigned long param, 
      unsigned long size, 
      unsigned long addr, 
      unsigned long mask
    );

    void AccessAckData_cb(
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      size_t burst_len, 
      unsigned long long addr_aligned, 
      unsigned long size, 
      unsigned long source
    );

    void probe_blocks(
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      FreeList& b_srcs, 
      srcToCallback& b_callback
    );

    void probe_blocks_rec(
      std::queue<unsigned long long>& probe_addrs, 
      FreeList& b_srcs, 
      srcToCallback& b_callback
    );

    //void ArithmeticAck_cb(
      //unsigned long long operand1, 
      //std::unordered_map<unsigned long long, unsigned long long>& memory, 
      //unsigned long long burst_len, 
      //unsigned long long addr_aligned, 
      //unsigned long long bit_mask, 
      //unsigned long long offset, 
      //unsigned long size, 
      //unsigned long source
    //);
    //void LogicalAck_cb(
      //unsigned long long operand1, 
      //std::unordered_map<unsigned long long, unsigned long long>& memory, 
      //unsigned long long burst_len, 
      //unsigned long long addr_aligned, 
      //unsigned long long bit_mask, 
      //unsigned long long offset, 
      //unsigned long size, 
      //unsigned long source
    //);

    void init_drive_input(std::unordered_map<unsigned long long, unsigned long long>& memory);
    void drive_input(std::unordered_map<unsigned long long, unsigned long long>& memory);

    void Grant_cb(
      unsigned long param, 
      unsigned long sink, 
      unsigned long size, 
      unsigned long source, 
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      unsigned long long block_addr
    );

    void GrantData_cb(
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      size_t burst_len, 
      unsigned long long addr_aligned, 
      unsigned long param, 
      unsigned long sink, 
      unsigned long size, 
      unsigned long source, 
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      unsigned long long block_addr
    );

    void a_port_monitor(
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      FreeList& d_sinks, 
      FreeList& b_srcs, 
      srcToCallback& b_callback
    );

    void c_port_monitor(
      std::unordered_map< unsigned long long, unsigned long long>& memory, 
      std::unordered_map< unsigned long long, unsigned long long>& block_perm, 
      FreeList& b_srcs, 
      srcToCallback& b_callback
    );

    void e_port_monitor(
      std::unordered_map<unsigned long long, unsigned long long>& memory, 
      FreeList& d_sinks
    );

    void d_port_driver();
    void b_port_driver();

    void data_retriever(
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      FreeList& b_srcs,
      srcToCallback& b_callback
    );

    void host_interface(
      std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
      FreeList& b_srcs,
      srcToCallback& b_callback
    );

    void probe_block(unsigned long long probe_addr);

    void start(std::unordered_map<unsigned long long, unsigned long long>& memory);

    void stop();

    bool onGoing();

    bool isRunning();

    bool update();

    void set(size_t stimuli_id);

  private:

    unsigned long long _arithmetic_op(
      unsigned long param, 
      unsigned long long operand1, 
      unsigned long long operand2,
      unsigned long long mask
    );

    unsigned long long _logical_op(
      unsigned long param, 
      unsigned long long operand1, 
      unsigned long long operand2
    );

    RF::RTLflow& _rtlflow;
    RF::Top* _dut;
    size_t _stimuli_id;
    bool _drive;
    bool _retrieve;
    unsigned long _protocol;
    bool _stopped;
    bool _ongoing;
    bool _debug;
    size_t _max_wait_cycle;
    size_t _block_size;
    size_t _sink_id;

    APorts _a_ports;
    BPorts _b_ports;
    CPorts _c_ports;
    DPorts _d_ports;
    EPorts _e_ports;
    size_t _a_datalen;
    size_t _b_datalen;
    size_t _c_datalen;
    size_t _d_datalen;

    unsigned long long _block_mask;
    unsigned long long _addr_mask_a;
    unsigned long long _addr_mask_b;
    unsigned long long _addr_mask_c;
    unsigned long long _addr_mask_d;
    unsigned long long _nop_data;

    int _probe;
    int _probe_en;
    unsigned long long _probe_addr;

    //std::vector<std::string> _tl_port_names;
    //std::vector<std::string> _int_port_names;
    //std::vector<std::string> _others;
    //std::vector<std::string> _monitor;
    std::unordered_map<unsigned long long, unsigned long long> _ongoing_tlc;
    std::unordered_map<unsigned long long, unsigned long long> _block_perm;

    int _afg = 0;
    int _bfg = 0;
    int _cfg = 0;
    int _dfg = 0;
    int _efg = 0;
    int _hifg = 0;
    int _drfg = 0;
    std::unordered_map<unsigned long long, size_t> _aongoings; // On going transactions (src - count)
    std::unordered_map<unsigned long long, size_t> _congoings; // On going transactions (src - count)

    std::list<int> _d_sink_list{0, 1, 2, 3};
    std::list<int> _b_src_list{0};
    FreeList _d_sinks;
    FreeList _b_srcs;
    srcToCallback _b_callback;
    tlDQueue _d_queue;
    tlBQueue _b_queue;

    
};

void tlAdapter::set(size_t stimuli_id) {
  _stimuli_id = stimuli_id;
  _a_ports.set(_rtlflow, _dut, _stimuli_id);
  _b_ports.set(_rtlflow, _dut, _stimuli_id);
  _c_ports.set(_rtlflow, _dut, _stimuli_id);
  _d_ports.set(_rtlflow, _dut, _stimuli_id);
  _e_ports.set(_rtlflow, _dut, _stimuli_id);

  // floor division
  _a_datalen = _a_ports.lens.data / 8;
  _d_datalen = _d_ports.lens.data / 8;
  
  _addr_mask_a = ~((1 << int(std::log2(_a_datalen))) - 1);
  _addr_mask_d = ~((1 << int(std::log2(_d_datalen))) - 1);
  _nop_data = 0;

  assert(_a_datalen == _d_datalen);

  if (_protocol == TL_C) {
    _b_datalen = _b_ports.lens.data / 8;
    _c_datalen = _c_ports.lens.data / 8;
    _addr_mask_b = ~((1 << int(std::log2(_b_datalen))) - 1);
    _addr_mask_c = ~((1 << int(std::log2(_c_datalen))) - 1);
    assert(_a_datalen == _c_datalen);
  }
}

tlAdapter::tlAdapter(
  RF::RTLflow& rtlflow,
  RF::Top* dut,
  unsigned long protocol,
  size_t block_size,
  bool debug
): 
  _rtlflow(rtlflow),
  _dut(dut),
  _d_sinks{"d_sinks", _d_sink_list},
  _b_srcs{"b_srcs", _b_src_list},
  _b_callback{"b_callback", _b_src_list}
{


  _drive = false;
  _protocol = protocol;
  _stopped = true; 
  _ongoing = false;
  _debug = debug;
  _max_wait_cycle = 100;
  _block_size = block_size;
  _block_mask = ~(block_size - 1);
  _sink_id = 0;


  //std::cerr << "tlAdapter intial:\n";
  //std::cerr << _a_datalen << "\n";
  //std::cerr << _d_datalen << "\n";
  //std::cerr << _b_datalen << "\n";
  //std::cerr << _c_datalen << "\n";
  //std::cerr << _addr_mask_a << "\n";
  //std::cerr << _addr_mask_d << "\n";
  //std::cerr << _addr_mask_b << "\n";
  //std::cerr << _addr_mask_c << "\n";


  //_ongoing_tlc

  _probe = 0;
  _probe_en = 1;
  _probe_addr = 0;
}

// TODO: seems like we don't need this function
//void tlAdapter::set_src_msgs(
  //std::unordered_map<int, std::string>& src_msgs,
  //int src,
  //std::string msgs
//) {
  //assert(src_msgs.find(src) == src_msgs.end());
  //src_msgs[src] = msgs;
//}

std::vector<tlDMessage> tlAdapter::get_d_messages(
  const std::string& message, 
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  size_t burst_len, 
  unsigned long long addr_aligned, 
  Args& args
) {
    assert(
      (message.find("AccessAckData") != std::string::npos) ||
      (message.find("GrantData") != std::string::npos)
    );

    Args kargs = args;

    std::vector<tlDMessage> d_msgs;


    for(size_t i = 0; i < burst_len; ++i) {
      auto get_addr = addr_aligned + i * _d_datalen;
      if(memory.find(get_addr) == memory.end()) {
        memory[get_addr] = _nop_data;
      }
      auto  get_data = memory[get_addr];
      kargs.data = get_data;
      d_msgs.emplace_back(message, kargs);
    }
  
    return d_msgs;
}

void tlAdapter::enableProbe() {
  _probe_en = 1;
}


// TODO: seems like we don't need this function
// dfuzzRTL never calls, and
// the python code seems incorrect
//void tlAdapter::updateMem(
  //std::unordered_map<unsigned long, unsigned long>& memory, 
  //std::unordered_map<unsigned long, unsigned long>& burst_data
//) {

  //for(auto&& pair: burst_data) {
    //auto addr = pair.first;
    //auto bit_mask = (pair.second)[0];
    //auto data = (pair.second)[1];
    //memory[addr] = (memory.get(get_addr, 0) & (~bit_mask)) | (get_data & bit_mask)
  //}
    //for addr, value in burst_data:
        //bit_mask = value[0]
        //data = value[1]


    //memory.update(burst_data)
//}

void tlAdapter::updatePerm(
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  unsigned long long block_addr, 
  unsigned long param
) {
  if (param == toT) {
    block_perm[block_addr] = TRUNK;
  }
}

void tlAdapter::retrieveBlock_cb(
  const std::string& msg, 
  FreeList& b_srcs, 
  srcToCallback& b_callback, 
  Callback callback, 
  unsigned long param, 
  unsigned long size, 
  unsigned long addr, 
  unsigned long mask
) {
  Args args;
  args.param = param;
  args.size = size;
  args.address = addr;
  args.mask = mask;
  int b_src = b_srcs.get();
  b_callback.set(b_src, callback);


  tlBMessage bmsg{msg, args};
  // b queue does not push callback
  _b_queue.push(bmsg, Callback([](){}));
}

void tlAdapter::retrieveBlock(
  FreeList& b_srcs, 
  srcToCallback& b_callback, 
  Callback callback, 
  unsigned long param, 
  unsigned long size, 
  unsigned long addr, 
  unsigned long mask, 
  const std::string& msg
) {
  if (!b_srcs.empty()) {
    retrieveBlock_cb(msg, b_srcs, b_callback, callback, param, size, addr, mask);
  }
  else {
    //TODO: Callback
    Callback b_reserve = [msg, &b_srcs, this, &b_callback, callback, param, size, addr, mask]() mutable { this->retrieveBlock_cb(msg, b_srcs, b_callback, callback, param, size, addr, mask); };
    b_srcs.reserve(b_reserve);
  }
}

// TODO: seems like we don't need this function
// dfuzzRTL never calls, and
// the python code seems incorrect
//void tlAdapter::AccessAck_cb(memory, ongoings, burst_len, burst_data, size, source) {
    //// TODO, source in ongoings can collide
    //remain_clks = burst_len - ongoings.get(source, burst_len)
    //callback_d = Callback(self.updateMem, memory, burst_data)

    //// TODO, Not the final solution (remain_clks can be longer)
    //for clk in range(remain_clks):
        //self.d_queue.push('Bubble', None)
    //self.d_queue.push('AccessAck', callback_d, size=size, source=source)
//}

void tlAdapter::AccessAckData_cb(
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  size_t burst_len, 
  unsigned long long addr_aligned, 
  unsigned long size, 
  unsigned long source
) {
  Args args;
  args.size = size;
  args.source = source;
  auto d_msgs = get_d_messages("AccessAckData", memory, burst_len, addr_aligned, args);

  _d_queue.push_msgs(d_msgs);
}

// TODO: seems like difuzz does not use this
// also, difuzz's code can not run (param, mask is undefined)
//void tlAdapter::ArithmeticAck_cb(
  //unsigned long long operand1, 
  //std::unordered_map<unsigned long long, unsigned long long>& memory, 
  //unsigned long long burst_len, 
  //unsigned long long addr_aligned, 
  //unsigned long long bit_mask, 
  //unsigned long long offset, 
  //unsigned long size, 
  //unsigned long source
//) {
  //auto operand2 = (memory[addr_aligned] & bit_mask) >> offset;
  //auto result = (_arithmetic_op(param, operand1, operand2, mask) << offset) & _a_ports.mask.data;

  ////'ArithmeticAck_cb, burst_len should be 1'
  //assert(burst_len == 1ULL);

  //auto it = memory.find(addr_aligned);
  //if(it == memory.end()) {
    //(*it).second = 0;
  //}
  //(*it).second = (((*it).second) & (~bit_mask)) | (result & bit_mask);
  //AccessAckData_cb(memory, burst_len, addr_aligned, size, source);
//}

// TODO: seems like difuzz does not use this
// also, difuzz's code can not run (param, mask is undefined)
//void tlAdapter::LogicalAck_cb(
  //unsigned long long operand1, 
  //std::unordered_map<unsigned long long, unsigned long long>& memory, 
  //unsigned long long burst_len, 
  //unsigned long long addr_aligned, 
  //unsigned long long bit_mask, 
  //unsigned long long offset, 
  //unsigned long size, 
  //unsigned long source
//) {
  //auto operand2 = (memory[addr_aligned] & bit_mask) >> offset;
  //auto result = (_logical_op(param, operand1, operand2, mask) << offset) & _a_ports.mask.data;

  //assert(burst_len == 1ULL);
  ////'LogicalAck_cb, burst_len should be 1'

  //memory[addr_aligned] = (memory.get(addr_aligned, 0) & (~bit_mask)) | (result & bit_mask);
  //AccessAckData_cb(memory, burst_len, addr_aligned, size, source);
//}

void tlAdapter::GrantData_cb(
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  size_t burst_len, 
  unsigned long long addr_aligned, 
  unsigned long param, 
  unsigned long sink, 
  unsigned long size, 
  unsigned long source, 
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  unsigned long long block_addr
) {
  Args args;
  args.param = param;
  args.sink = sink;
  args.size = size;
  args.source = source;

  auto callback_d = [&block_perm, block_addr, param, this]() mutable {this->updatePerm(block_perm, block_addr, param);};
  auto d_msgs = get_d_messages("GrantData", memory, burst_len, addr_aligned, args);

  //cbs = [ callback_d ] + [None for i in range(len(d_msgs) - 1)]

  std::vector<Callback> cbs(d_msgs.size(), [](){});
  cbs[0] = callback_d;

  _ongoing_tlc[sink] = block_addr;
  _d_queue.push_msg_cbs(d_msgs, cbs);
}

void tlAdapter::Grant_cb(
  unsigned long param, 
  unsigned long sink, 
  unsigned long size, 
  unsigned long source, 
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  unsigned long long block_addr
) {
  auto callback_d = [&block_perm, block_addr, param, this]() mutable { this->updatePerm(block_perm, block_addr, param); };

  _ongoing_tlc[sink] = block_addr;
  Args args;
  args.param = param;
  args.size = size;
  args.source = source;
  tlDMessage dmsg{"Grant", args};
  _d_queue.push(dmsg, callback_d);
}


unsigned long long tlAdapter::_arithmetic_op(
  unsigned long param, 
  unsigned long long operand1, 
  unsigned long long operand2,
  unsigned long long mask
) {
    // Count the number of nonzero bits in mask
    int size_op = 0;
    std::cerr << "aaaaa";
    while(mask >= 1) {
      if(mask % 2 == 0) {
        mask /= 2;
      }
      else {
        size_op = size_op + 8;
        mask /= 2;
      }
    }
    std::cerr << "bbbbb";
    int op_mask = (1 << size_op) - 1;
    unsigned long long signed_op1 = operand1;
    unsigned long long signed_op2 = operand2;
    unsigned long long uoperand1, uoperand2;

    if((operand1 >> (size_op - 1)) & 0x1 == 1) {
      signed_op1 = - ((~operand1 + 1) & op_mask);
    }
    if((operand2 >> (size_op - 1)) & 0x1 == 1) {
      signed_op2 = - ((~operand2 + 1) & op_mask);
    }

    if(param == MIN) {
      return std::min(signed_op1, signed_op2);
    }
    else if(param ==  MAX) {
      return std::max(signed_op1, signed_op2);
    }
    else if(param == MINU) {
      uoperand1 = operand1 & (0xffffffff << 32 | 0xffffffff);
      uoperand2 = operand2 & (0xffffffff << 32 | 0xffffffff);
      return std::min(uoperand1, uoperand2);
    }
    else if(param == MAXU) {
      uoperand1 = operand1 & (0xffffffff << 32 | 0xffffffff);
      uoperand2 = operand2 & (0xffffffff << 32 | 0xffffffff);
      return std::max(uoperand1, uoperand2);
    }
    else if(param == ADD) {
      return (signed_op1 + signed_op2);
    }

    assert(false);
    return 0;
}

unsigned long long tlAdapter::_logical_op(
  unsigned long param, 
  unsigned long long operand1, 
  unsigned long long operand2
) {
    if(param == XOR) {
      return operand1 ^ operand2;
    }
    else if(param == OR) {
      return operand1 | operand2;
    }
    else if(param == AND) {
      return operand1 & operand2;
    }
    else if(param == SWAP) {
      return operand1;
    }

  assert(false);
  return 0;
}

void tlAdapter::probe_blocks(
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  FreeList& b_srcs, 
  srcToCallback& b_callback
) {
  //probe_addrs = [ addr for addr in block_perm.keys() if block_perm[addr] != TIP ]
  std::queue<unsigned long long> probe_addrs;
  for(auto&& pair: block_perm) {
    auto addr = pair.first;
    auto v = pair.second;
    if(v != TIP) {
      probe_addrs.push(addr);
    }
  }

  probe_blocks_rec(probe_addrs, b_srcs, b_callback);
}

void tlAdapter:: probe_blocks_rec(
  std::queue<unsigned long long>& probe_addrs, 
  FreeList& b_srcs, 
  srcToCallback& b_callback
) {
    unsigned long long mask = (1 << _b_datalen) - 1;
    auto size = int(std::log2(_block_size));

    if(!probe_addrs.empty()) {
      
      auto addr = probe_addrs.front();
      probe_addrs.pop();

      //std::cerr << "before probe\n";
      Callback callback = [this, probe_addrs, &b_srcs, &b_callback]() mutable { this->probe_blocks_rec(probe_addrs, b_srcs, b_callback); };
      retrieveBlock(b_srcs, b_callback, callback, toN, size, addr, mask);
      //std::cerr << "after probe\n";
    }
    else {
      _drive = false;
    }
}


void tlAdapter::init_drive_input(std::unordered_map<unsigned long long, unsigned long long>& memory) {
  //assert memory.__class__.__name__ == 'dict', \
      //'tlAdapter.drive_input need dict'
  // TODO, check the resolution of block permissions
  //std::cerr << "block==================\n";
  //std::cerr << _block_mask << "\n";
  for (auto&& pair: memory) {
    _block_perm.insert({pair.first & _block_mask, TIP});
    //std::cerr << pair.first << "\n";
    //std::cerr << (pair.first & _block_mask) << "\n";

  }

  _b_queue.clear();
  _d_queue.clear();

}

bool tlAdapter::update() {
  bool is_update{false};
  is_update |= _a_ports.update();
  is_update |= _c_ports.update();
  is_update |= _e_ports.update();
  is_update |= _d_ports.update();
  is_update |= _b_ports.update();
  return is_update;
}

void tlAdapter::drive_input(
  std::unordered_map<unsigned long long, unsigned long long>& memory
) {
  //std::cerr << "a_port\n";
  a_port_monitor(memory, _block_perm, _d_sinks, _b_srcs, _b_callback);
  //std::cerr << "c_port\n";
  c_port_monitor(memory, _block_perm, _b_srcs, _b_callback);
  //std::cerr << "e_port\n";
  e_port_monitor(memory, _d_sinks);

  //std::cerr << "d_port\n";
  d_port_driver();
  //std::cerr << "b_port\n";
  b_port_driver();

  //std::cerr << "data_retriever\n";
  data_retriever(_block_perm, _b_srcs, _b_callback);
  //std::cerr << "host_interface\n";
  host_interface(_block_perm, _b_srcs, _b_callback);



  // debug
  // a
  //std::stringstream ss;
  //ss << "a_port=====\n";
  //ss << (*(_a_ports.ports.opcode) & _a_ports.mks.opcode) << "\n";
  //ss << (*(_a_ports.ports.param) & _a_ports.mks.param) << "\n";
  //ss << (*(_a_ports.ports.size) & _a_ports.mks.size) << "\n";
  //ss << (*(_a_ports.ports.source) & _a_ports.mks.source) << "\n";
  //ss << (*(_a_ports.ports.address) & _a_ports.mks.address) << "\n";
  //ss << (*(_a_ports.ports.mask) & _a_ports.mks.mask) << "\n";
  //ss << (*(_a_ports.ports.data) & _a_ports.mks.data) << "\n";

  //// e
  //ss << "e_port=====\n";
  //ss << (*(_e_ports.ports.sink) & _e_ports.mks.sink) << "\n";

  //// d
  //ss << "d_port=====\n";

  //ss << (*(_d_ports.ports.opcode) & _d_ports.mks.opcode) << "\n";
  //ss << (*(_d_ports.ports.param) & _d_ports.mks.param) << "\n";
  //ss << (*(_d_ports.ports.size) & _d_ports.mks.size) << "\n";
  //ss << (*(_d_ports.ports.source) & _d_ports.mks.source) << "\n";
  //ss << (*(_d_ports.ports.sink) & _d_ports.mks.sink) << "\n";
  //ss << (*(_d_ports.ports.data) & _d_ports.mks.data) << "\n";
  //ss << (*(_d_ports.ports.corrupt) & _d_ports.mks.corrupt) << "\n";
  //ss << (*(_d_ports.ports.denied) & _d_ports.mks.denied) << "\n";

  //// b
  //ss << "b_port=====\n";
  //ss << (*(_b_ports.ports.opcode) & _b_ports.mks.opcode) << "\n";
  //ss << (*(_b_ports.ports.param) & _b_ports.mks.param) << "\n";
  //ss << (*(_b_ports.ports.size) & _b_ports.mks.size) << "\n";
  //ss << (*(_b_ports.ports.source) & _b_ports.mks.source) << "\n";
  //ss << (*(_b_ports.ports.address) & _b_ports.mks.address) << "\n";
  //ss << (*(_b_ports.ports.mask) & _b_ports.mks.mask) << "\n";
  //ss << (*(_b_ports.ports.data) & _b_ports.mks.data) << "\n";
  
  //// c
  //ss << "c_port=====\n";
  //ss << (*(_c_ports.ports.opcode) & _c_ports.mks.opcode) << "\n";
  //ss << (*(_c_ports.ports.param) & _c_ports.mks.param) << "\n";
  //ss << (*(_c_ports.ports.size) & _c_ports.mks.size) << "\n";
  //ss << (*(_c_ports.ports.source) & _c_ports.mks.source) << "\n";
  //ss << (*(_c_ports.ports.address) & _c_ports.mks.address) << "\n";
  //ss << (*(_c_ports.ports.data) & _c_ports.mks.data) << "\n";
  //ss << (*(_c_ports.ports.corrupt) & _c_ports.mks.corrupt) << "\n";

  //std::ofstream f("port_rtlflow.out", std::ios::app);
  //f << ss.rdbuf();

  // others
  //std::cerr << "b, d queue empty\n";
  //std::cerr << _b_queue.empty() << "\n";
  //std::cerr << _d_queue.empty() << "\n";

}

void tlAdapter::a_port_monitor(
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  FreeList& d_sinks, 
  FreeList& b_srcs, 
  srcToCallback& b_callback
) {

  auto& ongoings = _aongoings;

  switch(_afg) {
    case 0:
      _a_ports.ports.ready = 1;
      _afg = 1;
    case 1:
      if(_drive) {
        //std::cerr << "ready: " << int(*(_a_ports.ports.ready)) << ", valid: " << int(*(_a_ports.ports.valid)) << "\n";
        if(_a_ports.fire()) {
        //std::cerr << "fire!!!\n";
      
          unsigned long opcode = _a_ports.ports.opcode & (_a_ports.mks.opcode);
          unsigned long param = _a_ports.ports.param & _a_ports.mks.param;
          unsigned long size = _a_ports.ports.size & _a_ports.mks.size;
          unsigned long source = _a_ports.ports.source & _a_ports.mks.source;
          unsigned long addr = _a_ports.ports.address & _a_ports.mks.address;
          unsigned long mask = _a_ports.ports.mask & _a_ports.mks.mask;
          unsigned long long data = _a_ports.ports.data & _a_ports.mks.data;
          //std::ofstream of("a_port_rtlflow.out");
          //std::stringstream ss;
          //ss << "=======\n";
          //ss << opcode << "\n";
          //ss << param << "\n";
          //ss << size << "\n";
          //ss << source << "\n";
          //ss << addr << "\n";
          //ss << mask << "\n";
          //ss << data << "\n";
          //of << ss.rdbuf();
          //of.close();
          

          //A_assertions(opcode, param, size, addr, mask, self.debug);

          //assert not ongoings or source in ongoings.keys(), \
              //'Messages in A channel can not be interleaved'

          auto addr_aligned = addr & _addr_mask_d;
          auto block_addr = addr & _block_mask;
          size_t burst_len =(std::max(int(std::pow(2, size) / _d_datalen), 1));

          // TODO: how to set mask?
          // only for Rocket
          //int bit_mask = int(''.join([ '{:02x}'.format(0xff * int(i)) \
                                  //for i in ('{:0b}'.format(mask))]), 16)
          unsigned long long bit_mask = 18446744073709551615;
                                  
          //block_perm[block_addr] = block_perm.get(block_addr, TIP);
          auto it = block_perm.find(block_addr);
          if(it == block_perm.end()) {
            block_perm[block_addr] = TIP;
          }
          else {
            block_perm[block_addr] = (*it).second;
          }

          //std::cerr << "GET =====\n";
          //std::cerr << addr_aligned << "\n";
          //std::cerr << block_addr << "\n";
          //std::cerr << block_perm[block_addr] << "\n";

          // TL-UL
          if(opcode == GET) {
              // Check block permission
              if(block_perm[block_addr] != TIP) {
                Callback callback = [this, &memory, burst_len, addr_aligned, size, source]() mutable { 
                  this->AccessAckData_cb(memory, burst_len, addr_aligned, size, source); 
                };

                retrieveBlock(b_srcs, b_callback, callback, toT, size, addr, mask);
              }
              else {
                Args args;
                args.size = size;
                args.source = source;
                auto d_msgs = get_d_messages("AccessAckData", memory, burst_len, addr_aligned,
                           args);
                //std::cerr << "Args============\n";
                //std::cerr << d_msgs.size() << "\n";
                //std::cerr << args.size << "\n";
                //std::cerr << args.source << "\n";
                _d_queue.push_msgs(d_msgs);
                //std::cerr << _d_queue.empty() << "\n";
              }
          }

          if(opcode == PUT_FULL_DATA) {
              size_t count;
              auto it = ongoings.find(source);
              if(it == ongoings.end()) {
                count = 0;
              }
              else {
                count = (*it).second;
              }

              auto get_addr = addr_aligned + count * _a_datalen;

              // TODO, Block_perm should not change during burst
              if(block_perm[block_addr] != TIP) {
                assert(false);
                if(count == 0) {
                    // TODO: dfuzz never call?
                    //burst_data = {}
                    //callback = Callback(self.AccessAck_cb, memory, ongoings, \
                                        //burst_len, burst_data, size, source)
                    //self.retrieveBlock(b_srcs, b_callback, callback, toN, size, \
                                       //addr, mask)
                }

                //burst_data[get_addr] = (bit_mask, data);
              }
              else {
                auto it = memory.find(get_addr);
                unsigned long long tmp;
                if(it == memory.end()) {
                  tmp = 0;
                }
                else {
                  tmp = (*it).second;
                }
                auto masked_data = tmp & (~bit_mask);
                auto get_data = masked_data | (data & bit_mask);

                memory[get_addr] = get_data;

                if(count + 1 == burst_len) {
                  Args args;
                  args.size = size;
                  args.source = source;
                  tlDMessage dmsg{"AccessAck", args};
                  _d_queue.push(dmsg, Callback([](){}));
                  if(count != 0) { 
                    ongoings.erase(source);
                  }
                }
                else {
                  ongoings[source] = count + 1;
                }
              }
          }
          if(opcode == PUT_PARTIAL_DATA) {
              size_t count;
              auto it = ongoings.find(source);
              if(it == ongoings.end()) {
                count = 0;
              }
              else {
                count = (*it).second;
              }
              auto get_addr = addr_aligned + count * _a_datalen;

              // TODO, Block_perm should not change during burst
              if(block_perm[block_addr] != TIP) {
                assert(false);
                if(count == 0) {
                    // TODO: dfuzz never call?
                    //burst_data = {}
                    //callback = Callback(self.AccessAck_cb, memory, ongoings, \
                                        //burst_len, burst_data, size, source)
                    //self.retrieveBlock(b_srcs, b_callback, callback, toN, size, \
                                       //addr, mask)
                }

                //burst_data[get_addr] = (bit_mask, data);
              }
              else {
                unsigned long long tmp;
                auto it = memory.find(get_addr);
                if(it == memory.end()) {
                  tmp = 0;
                }
                else {
                  tmp = (*it).second;
                }
                auto masked_data = tmp & (~bit_mask);
                auto get_data = masked_data | (data & bit_mask);

                memory[get_addr] = get_data;

                if(count + 1 == burst_len) {
                  Args args;
                  args.size = size;
                  args.source = source;
                  tlDMessage dmsg{"AccessAck", args};
                  _d_queue.push(dmsg, Callback([](){}));
                  if(count != 0) { 
                    ongoings.erase(source);
                  }
                }
                else {
                  ongoings[source] = count + 1;
                }
              }
          }

          // TL-UH
          if (opcode == ARITHMETIC_DATA && _protocol >= TL_UH) {

              size_t count;
              auto it = ongoings.find(source);
              if(it == ongoings.end()) {
                count = 0;
              }
              else {
                count = (*it).second;
              }

              // TODO, extend to multiple block
              //assert burst_len == 1, \
                  //'ARITHMETIC_DATA can not span over multiple block'

              //auto total_mask = 0;
              auto offset = int(std::log2(mask & -mask) * 8);

              auto get_addr = addr_aligned + count * _a_datalen;
              auto get_data = data & bit_mask;

              auto operand1 = get_data >> offset;

              // TODO, Block_perm should not change during burst
              if(block_perm[block_addr] != TIP) {
                  assert(false);
                  //auto callback = [this, operand1, &memory, burst_len, addr_aligned, bit_mask, offset, size, source]() mutable {
                    //this->ArithmeticAck_cb(operand1, memory, burst_len, addr_aligned, bit_mask, offset, size, source);
                  //}
                  //retrieveBlock(b_srcs, b_callback, callback, toN, size, addr, mask);
              }

              else {
                  auto it = memory.find(get_addr);
                  if(it == memory.end()) {
                    memory[get_addr] = _nop_data;
                  }
                  // TODO, operand2 offset?
                  auto operand2 = (memory[get_addr] & bit_mask) >> offset;
                  auto result = (_arithmetic_op(param, operand1, operand2, mask) << offset) & 
                                  _a_ports.mks.data; // TODO, check _arithmetic_op;

                  memory[get_addr] = (memory[get_addr] & (~bit_mask)) | (result & bit_mask);

                  Args args;
                  args.size = size;
                  args.source = source;
                  args.data = operand2;
                  tlDMessage dmsg{"AccessAckData", args};
                  _d_queue.push(dmsg, Callback([](){}));
              }
          }

          if (opcode == LOGICAL_DATA && _protocol >= TL_UH) {

              size_t count;
              auto it = ongoings.find(source);
              if(it == ongoings.end()) {
                count = 0;
              }
              else {
                count = (*it).second;
              }

              // TODO, extend to multiple block
              //assert burst_len == 1, \
                  //'LOGICAL_DATA can not span over multiple block'

              //auto total_mask = 0;
              auto offset = int(std::log2(mask & -mask) * 8);

              auto get_addr = addr_aligned + count * _a_datalen;
              auto get_data = data & bit_mask;

              auto operand1 = get_data >> offset;

              // TODO, Block_perm should not change during burst
              if(block_perm[block_addr] != TIP) {
                assert(false);

                //callback = [this, operand1, &memory, burst_len, addr_aligned, bit_mask, offset, size, source]() mutable {
                  //this->LogicalAck_cb(operand1, memory, burst_len, addr_aligned, bit_mask, offset, size, source);
                //}
                //retrieveBlock(b_srcs, b_callback, callback, toN, size, addr, mask);
              }
              else {
                  auto it = memory.find(get_addr);
                  if(it == memory.end()) {
                    memory[get_addr] = _nop_data;
                  }
                  // TODO, operand2 offset?
                  auto operand2 = (memory[get_addr] & bit_mask) >> offset;
                  auto result = (_logical_op(param, operand1, operand2) << offset) & 
                                  _a_ports.mks.data; // TODO, check _logical_op;

                  memory[get_addr] = (memory[get_addr] & (~bit_mask)) | (result & bit_mask);
                  Args args;
                  args.size = size;
                  args.source = source;
                  args.data = operand2;
                  tlDMessage dmsg{"AccessAckData", args};
                  _d_queue.push(dmsg, Callback([](){}));
              }
          }

          if(opcode == INTENT && _protocol >= TL_UH) {
              Args args;
              args.size = size;
              args.source = source;
              tlDMessage dmsg{"HintAck", args};
              _d_queue.push(dmsg, Callback([](){}));
          }

          // TL-C 
          if (opcode == ACQUIRE_BLOCK && _protocol == TL_C) {

            auto d_sink = d_sinks.get();
            unsigned long d_param;

            if(param == NtoB) {
              d_param = toB;
            }
            else { 
              d_param = toT;
            }

            if(block_perm[block_addr] != TIP) {
              unsigned long b_param;
              if(param == NtoB) {
                b_param = toB;
              }
              else {
                b_param = toN;
              }

              Callback callback = [this, &memory, burst_len, addr_aligned, d_param, d_sink, size, source, &block_perm, block_addr]() mutable {
                this->GrantData_cb(memory, burst_len, addr_aligned, d_param, d_sink, size, source, block_perm, block_addr);
              };
              retrieveBlock(b_srcs, b_callback, callback, b_param, size, addr, mask);
            }
            else {
                Callback callback_d = [this, &block_perm, block_addr, d_param]() mutable {
                  this->updatePerm(block_perm, block_addr, d_param);
                };
                Args args;
                args.param = d_param;
                args.size = size;
                args.source = source;
                args.sink = d_sink;
                auto d_msgs = get_d_messages("GrantData", memory, burst_len, addr_aligned, args);

                //cbs = [ callback_d ] + [ None for i in range(len(d_msgs) - 1) ]
                std::vector<Callback> cbs(d_msgs.size(), [](){});
                cbs[0] = callback_d;

                _ongoing_tlc[d_sink] = block_addr;
                _d_queue.push_msg_cbs(d_msgs, cbs);
            }
          }

          if (opcode == ACQUIRE_PERM && _protocol == TL_C) {
            auto d_sink = d_sinks.get();


            unsigned long d_param;

            if(param == NtoB) {
              d_param = toB;
            }
            else { 
              d_param = toT;
            }

            if(block_perm[block_addr] != TIP) {
              assert(false);
              //unsigned long b_param;
              //if(param == NtoB) {
                //b_param = toB;
              //}
              //else {
                //b_param = toN;
              //}
              //auto callback = submit(&Grant_cb, d_param, d_sink, size, source,
                                //block_perm, block_addr);
              //// TODO: difuzz does not have this function
              //retrievePerm(b_srcs, b_callback, callback, b_param, size, addr, mask, "ProbePerm");

            }
            else {
                Callback callback_d = [this, &block_perm, block_addr, d_param]() mutable { 
                  this->updatePerm(block_perm, block_addr, d_param);
                };

                _ongoing_tlc[d_sink] = block_addr;
                Args args;
                args.param = d_param;
                args.size = size;
                args.source = source;
                args.sink = d_sink;
                tlDMessage dmsg{"Grant", args};
                _d_queue.push(dmsg, callback_d);
            }
          }
        }
        break;
      }
      else {
        _afg = 2;
      }
    case 2:
      _a_ports.ports.ready = 0;
      _afg = 3;
      break;
    case 3:
      assert(false);
  }
}


//void tlAdapter::a_port_monitor(
  //std::unordered_map<unsigned long long, unsigned long long>& memory, 
  //std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  //FreeList& d_sinks, 
  //FreeList& b_srcs, 
  //srcToCallback& b_callback
//) {

  //std::unordered_map<unsigned long long, unsigned long> ongoings; // On going TL-A transactions (src - count)

  //*(_a_ports.ports.ready) = 1;

  //if(_drive) {
    //if(_a_ports.fire()) {
        //auto opcode = *(_a_ports.ports.opcode) & (_a_ports.mks.opcode);
        //auto param = *(_a_ports.ports.param) & _a_ports.mks.param;
        //auto size = *(_a_ports.ports.size) & _a_ports.mks.size;
        //auto source = *(_a_ports.ports.source) & _a_ports.mks.source;
        //auto addr = *(_a_ports.ports.address) & _a_ports.mks.address;
        //auto mask = *(_a_ports.ports.mask) & _a_ports.mks.mask;
        //auto data = *(_a_ports.ports.data) & _a_ports.mks.data;

        ////A_assertions(opcode, param, size, addr, mask, self.debug);

        ////assert not ongoings or source in ongoings.keys(), \
            ////'Messages in A channel can not be interleaved'

        //auto addr_aligned = addr & _addr_mask_d;
        //auto block_addr = addr & _block_mask;
        //unsigned long long burst_len =(std::max(int(std::pow(2, size) / _d_datalen), 1));

        //// TODO: how to set mask?
        //// only for Rocket
        ////int bit_mask = int(''.join([ '{:02x}'.format(0xff * int(i)) \
                                ////for i in ('{:0b}'.format(mask))]), 16)
        //unsigned long long bit_mask = 18446744073709551615;
                                
        ////block_perm[block_addr] = block_perm.get(block_addr, TIP);
        //auto it = block_perm.find(block_addr);
        //if(it == block_perm.end()) {
          //block_perm[block_addr] = TIP;
        //}
        //else {
          //block_perm[block_addr] = (*it).second;
        //}

        //// TL-UL
        //if(opcode == GET) {
            //// Check block permission
            //if(block_perm[block_addr] != TIP) {
              //Callback callback = [this, &memory, burst_len, addr_aligned, size, source]() mutable { 
                //this->AccessAckData_cb(memory, burst_len, addr_aligned, size, source); 
              //};

              //retrieveBlock(b_srcs, b_callback, callback, toT, size, addr, mask);
            //}
            //else {
              //Args args;
              //args.size = size;
              //args.source = source;
              //auto d_msgs = get_d_messages("AccessAckData", memory, burst_len, addr_aligned,
                         //args);
              //_d_queue.push_msgs(d_msgs);
            //}
        //}

        //if(opcode == PUT_FULL_DATA) {
            //unsigned long count;
            //auto it = ongoings.find(source);
            //if(it == ongoings.end()) {
              //count = 0;
            //}
            //else {
              //count = (*it).second;
            //}

            //auto get_addr = addr_aligned + count * _a_datalen;

            //// TODO, Block_perm should not change during burst
            //if(block_perm[block_addr] != TIP) {
              //assert(false);
              //if(count == 0) {
                  //// TODO: dfuzz never call?
                  ////burst_data = {}
                  ////callback = Callback(self.AccessAck_cb, memory, ongoings, \
                                      ////burst_len, burst_data, size, source)
                  ////self.retrieveBlock(b_srcs, b_callback, callback, toN, size, \
                                     ////addr, mask)
              //}

              ////burst_data[get_addr] = (bit_mask, data);
            //}
            //else {
              //auto it = memory.find(get_addr);
              //unsigned long long tmp;
              //if(it == memory.end()) {
                //tmp = 0;
              //}
              //else {
                //tmp = (*it).second;
              //}
              //auto masked_data = tmp & (~bit_mask);
              //auto get_data = masked_data | (data & bit_mask);

              //memory[get_addr] = get_data;

              //if(count + 1 == burst_len) {
                //Args args;
                //args.size = size;
                //args.source = source;
                //tlDMessage dmsg{"AccessAck", args};
                //_d_queue.push(dmsg, Callback());
                //if(count != 0) { 
                  //ongoings.erase(source);
                //}
              //}
              //else {
                //ongoings[source] = count + 1;
              //}
            //}
        //}
        //if(opcode == PUT_PARTIAL_DATA) {
            //unsigned long count;
            //auto it = ongoings.find(source);
            //if(it == ongoings.end()) {
              //count = 0;
            //}
            //else {
              //count = (*it).second;
            //}
            //auto get_addr = addr_aligned + count * _a_datalen;

            //// TODO, Block_perm should not change during burst
            //if(block_perm[block_addr] != TIP) {
              //assert(false);
              //if(count == 0) {
                  //// TODO: dfuzz never call?
                  ////burst_data = {}
                  ////callback = Callback(self.AccessAck_cb, memory, ongoings, \
                                      ////burst_len, burst_data, size, source)
                  ////self.retrieveBlock(b_srcs, b_callback, callback, toN, size, \
                                     ////addr, mask)
              //}

              ////burst_data[get_addr] = (bit_mask, data);
            //}
            //else {
              //unsigned long long tmp;
              //auto it = memory.find(get_addr);
              //if(it == memory.end()) {
                //tmp = 0;
              //}
              //else {
                //tmp = (*it).second;
              //}
              //auto masked_data = tmp & (~bit_mask);
              //auto get_data = masked_data | (data & bit_mask);

              //memory[get_addr] = get_data;

              //if(count + 1 == burst_len) {
                //Args args;
                //args.size = size;
                //args.source = source;
                //tlDMessage dmsg{"AccessAck", args};
                //_d_queue.push(dmsg, Callback());
                //if(count != 0) { 
                  //ongoings.erase(source);
                //}
              //}
              //else {
                //ongoings[source] = count + 1;
              //}
            //}
        //}

        //// TL-UH
        //if (opcode == ARITHMETIC_DATA && _protocol >= TL_UH) {

            //unsigned long count;
            //auto it = ongoings.find(source);
            //if(it == ongoings.end()) {
              //count = 0;
            //}
            //else {
              //count = (*it).second;
            //}

            //// TODO, extend to multiple block
            ////assert burst_len == 1, \
                ////'ARITHMETIC_DATA can not span over multiple block'

            ////auto total_mask = 0;
            //auto offset = int(std::log(mask & -mask) * 8);

            //auto get_addr = addr_aligned + count * _a_datalen;
            //auto get_data = data & bit_mask;

            //auto operand1 = get_data >> offset;

            //// TODO, Block_perm should not change during burst
            //if(block_perm[block_addr] != TIP) {
                //assert(false);
                ////auto callback = [this, operand1, &memory, burst_len, addr_aligned, bit_mask, offset, size, source]() mutable {
                  ////this->ArithmeticAck_cb(operand1, memory, burst_len, addr_aligned, bit_mask, offset, size, source);
                ////}
                ////retrieveBlock(b_srcs, b_callback, callback, toN, size, addr, mask);
            //}

            //else {
                //auto it = memory.find(get_addr);
                //if(it == memory.end()) {
                  //memory[get_addr] = _nop_data;
                //}
                //// TODO, operand2 offset?
                //auto operand2 = (memory[get_addr] & bit_mask) >> offset;
                //auto result = (_arithmetic_op(param, operand1, operand2, mask) << offset) & 
                                //_a_ports.mks.data; // TODO, check _arithmetic_op;

                //memory[get_addr] = (memory[get_addr] & (~bit_mask)) | (result & bit_mask);

                //Args args;
                //args.size = size;
                //args.source = source;
                //args.data = operand2;
                //tlDMessage dmsg{"AccessAckData", args};
                //_d_queue.push(dmsg, Callback());
            //}
        //}

        //if (opcode == LOGICAL_DATA && _protocol >= TL_UH) {

            //unsigned long count;
            //auto it = ongoings.find(source);
            //if(it == ongoings.end()) {
              //count = 0;
            //}
            //else {
              //count = (*it).second;
            //}

            //// TODO, extend to multiple block
            ////assert burst_len == 1, \
                ////'LOGICAL_DATA can not span over multiple block'

            ////auto total_mask = 0;
            //auto offset = int(std::log(mask & -mask) * 8);

            //auto get_addr = addr_aligned + count * _a_datalen;
            //auto get_data = data & bit_mask;

            //auto operand1 = get_data >> offset;

            //// TODO, Block_perm should not change during burst
            //if(block_perm[block_addr] != TIP) {
              //assert(false);

              ////callback = [this, operand1, &memory, burst_len, addr_aligned, bit_mask, offset, size, source]() mutable {
                ////this->LogicalAck_cb(operand1, memory, burst_len, addr_aligned, bit_mask, offset, size, source);
              ////}
              ////retrieveBlock(b_srcs, b_callback, callback, toN, size, addr, mask);
            //}
            //else {
                //auto it = memory.find(get_addr);
                //if(it == memory.end()) {
                  //memory[get_addr] = _nop_data;
                //}
                //// TODO, operand2 offset?
                //auto operand2 = (memory[get_addr] & bit_mask) >> offset;
                //auto result = (_logical_op(param, operand1, operand2) << offset) & 
                                //_a_ports.mks.data; // TODO, check _logical_op;

                //memory[get_addr] = (memory[get_addr] & (~bit_mask)) | (result & bit_mask);
                //Args args;
                //args.size = size;
                //args.source = source;
                //args.data = operand2;
                //tlDMessage dmsg{"AccessAckData", args};
                //_d_queue.push(dmsg, Callback());
            //}
        //}

        //if(opcode == INTENT && _protocol >= TL_UH) {
            //Args args;
            //args.size = size;
            //args.source = source;
            //tlDMessage dmsg{"HintAck", args};
            //_d_queue.push(dmsg, Callback());
        //}

        //// TL-C 
        //if (opcode == ACQUIRE_BLOCK && _protocol == TL_C) {

          //auto d_sink = d_sinks.get();
          //unsigned long d_param;

          //if(param == NtoB) {
            //d_param = toB;
          //}
          //else { 
            //d_param = toT;
          //}

          //if(block_perm[block_addr] != TIP) {
            //unsigned long b_param;
            //if(param == NtoB) {
              //b_param = toB;
            //}
            //else {
              //b_param = toN;
            //}

            //Callback callback = [this, &memory, burst_len, addr_aligned, d_param, d_sink, size, source, &block_perm, block_addr]() mutable {
              //this->GrantData_cb(memory, burst_len, addr_aligned, d_param, d_sink, size, source, block_perm, block_addr);
            //};
            //retrieveBlock(b_srcs, b_callback, callback, b_param, size, addr, mask);
          //}
          //else {
              //Callback callback_d = [this, block_perm, block_addr, d_param]() mutable {
                //this->updatePerm(block_perm, block_addr, d_param);
              //};
              //Args args;
              //args.param = d_param;
              //args.size = size;
              //args.source = source;
              //args.sink = d_sink;
              //auto d_msgs = get_d_messages("GrantData", memory, burst_len, addr_aligned, args);

              ////cbs = [ callback_d ] + [ None for i in range(len(d_msgs) - 1) ]
              //std::vector<Callback> cbs(d_msgs.size());
              //cbs[0] = callback_d;

              //_ongoing_tlc[d_sink] = block_addr;
              //_d_queue.push_msg_cbs(d_msgs, cbs);
          //}
        //}

        //if (opcode == ACQUIRE_PERM && _protocol == TL_C) {
          //auto d_sink = d_sinks.get();


          //unsigned long d_param;

          //if(param == NtoB) {
            //d_param = toB;
          //}
          //else { 
            //d_param = toT;
          //}

          //if(block_perm[block_addr] != TIP) {
            //assert(false);
            ////unsigned long b_param;
            ////if(param == NtoB) {
              ////b_param = toB;
            ////}
            ////else {
              ////b_param = toN;
            ////}
            ////auto callback = submit(&Grant_cb, d_param, d_sink, size, source,
                              ////block_perm, block_addr);
            ////// TODO: difuzz does not have this function
            ////retrievePerm(b_srcs, b_callback, callback, b_param, size, addr, mask, "ProbePerm");

          //}
          //else {
              //Callback callback_d = [this, &block_perm, block_addr, d_param]() mutable { 
                //this->updatePerm(block_perm, block_addr, d_param);
              //};

              //_ongoing_tlc[d_sink] = block_addr;
              //Args args;
              //args.param = d_param;
              //args.size = size;
              //args.source = source;
              //args.sink = d_sink;
              //tlDMessage dmsg{"Grant", args};
              //_d_queue.push(dmsg, callback_d);
          //}
        //}

    //}
    //RisingEdge(_rtlflow, _dut);
  //}

  //*(_a_ports.ports.ready) = 0;
//}


void tlAdapter::c_port_monitor(
  std::unordered_map< unsigned long long, unsigned long long>& memory, 
  std::unordered_map< unsigned long long, unsigned long long>& block_perm, 
  FreeList& b_srcs, 
  srcToCallback& b_callback
) {
  auto& ongoings = _congoings;

  switch(_cfg) {
    case 0:
      _c_ports.ports.ready = 1;
      _cfg = 1;
    case 1:
      if(_drive) {
        if(_c_ports.fire()) {
          unsigned long opcode = _c_ports.ports.opcode & _c_ports.mks.opcode;
          unsigned long param = _c_ports.ports.param & _c_ports.mks.param;
          unsigned long size = _c_ports.ports.size & _c_ports.mks.size;
          unsigned long source = _c_ports.ports.source & _c_ports.mks.source;
          unsigned long addr = _c_ports.ports.address & _c_ports.mks.address;
          unsigned long long data = _c_ports.ports.data & _c_ports.mks.data;
          unsigned long corrupt = _c_ports.ports.corrupt & _c_ports.mks.corrupt;

            //C_assertions(opcode, param, size, addr, corrupt, self.debug)

            //assert not ongoings or source in ongoings.keys(), \
                //'Messages in C channel can not be interleaved'

          auto addr_aligned = addr & _addr_mask_c;
          auto block_addr = addr & _block_mask;
          size_t burst_len = int(std::max(int(std::pow(2, size) / _c_datalen), 1));

          if(opcode == ACCESS_ACK) {
            assert(false);
          }

          if(opcode == ACCESS_ACK_DATA) {
            assert(false);
          }

          if(opcode == HINT_ACK) {
            assert(false);
          }

          if(opcode == PROBE_ACK) {
            if(param == TtoB || param == TtoN) {
              block_perm[block_addr] = TIP;
            }
          //std::cerr << "b call\n";

            b_callback.call(source);
            b_srcs.release(source);
          //std::cerr << "after b call\n";
          }

          if(opcode == PROBE_ACK_DATA) {
          //std::cerr << "IIIIn\n";
              size_t count;
              auto it = ongoings.find(source);
              if(it == ongoings.end()) {
                count = 0;
              }
              else {
                count = (*it).second;
              }

              auto get_addr = addr_aligned + count * _c_datalen;

              memory[get_addr] = data;

              if(count + 1 == burst_len) {
                if(param == TtoB || param == TtoN) {
                  block_perm[block_addr] = TIP;
                }

          //std::cerr << "b call\n";
                b_callback.call(source);
                b_srcs.release(source);
          //std::cerr << "after b call\n";

                if(count != 0) { 
                  ongoings.erase(source);
                }
              }
              else {
                  ongoings[source] = count + 1;
              }
          }

          if(opcode == RELEASE) {
            if(param == TtoB || param == TtoN) {
              block_perm[block_addr] = TIP;
            }
            Args args;
            args.size = size;
            args.source = source;
            tlDMessage dmsg{"ReleaseAck", args};
            _d_queue.push(dmsg, Callback([](){}));
          }

          if(opcode == RELEASE_DATA) {
            size_t count;
            auto it = ongoings.find(source);
            if(it == ongoings.end()) {
              count = 0;
            }
            else {
              count = (*it).second;
            }

            auto get_addr = addr_aligned + count * _c_datalen;

            memory[get_addr] = data;

            if(count + 1 == burst_len) {
              if(param == TtoB || param == TtoN) {
                block_perm[block_addr] = TIP;
              }

              Args args;
              args.size = size;
              args.source = source;
              tlDMessage dmsg{"ReleaseAck", args};
              _d_queue.push(dmsg, Callback([](){}));

              if(count != 0) {
                ongoings.erase(source);
              }
            }
            else {
              ongoings[source] = count + 1;
            }
          }
        }
        break;
      }
      else {
        _cfg = 2;
      }
    case 2:
      _cfg = 3;
      break;
    //case 3:
      //assert(false);
  }
}

//void tlAdapter::c_port_monitor(
  //std::unordered_map< unsigned long long, unsigned long long>& memory, 
  //std::unordered_map< unsigned long long, unsigned long long>& block_perm, 
  //FreeList& b_srcs, 
  //srcToCallback& b_callback
//) {

    //std::unordered_map<unsigned long, unsigned long> ongoings; // On going transactions (src - count)

    //*(_c_ports.ports.ready) = 1;

    //if(_drive) {
        //if(_c_ports.fire()) {

          //auto opcode = *(_c_ports.ports.opcode) & _c_ports.mks.opcode;
          //auto param = *(_c_ports.ports.param) & _c_ports.mks.param;
          //auto size = *(_c_ports.ports.size) & _c_ports.mks.size;
          //auto source = *(_c_ports.ports.source) & _c_ports.mks.source;
          //auto addr = *(_c_ports.ports.address) & _c_ports.mks.address;
          //auto data = *(_c_ports.ports.data) & _c_ports.mks.data;
          //auto corrupt = *(_c_ports.ports.corrupt) & _c_ports.mks.corrupt;

            ////C_assertions(opcode, param, size, addr, corrupt, self.debug)

            ////assert not ongoings or source in ongoings.keys(), \
                ////'Messages in C channel can not be interleaved'

          //auto addr_aligned = addr & _addr_mask_c;
          //auto block_addr = addr & _block_mask;
          //auto burst_len = int(std::max(int(std::pow(2, size) / _c_datalen), 1));

          //if(opcode == ACCESS_ACK) {
            //assert(false);
          //}

          //if(opcode == ACCESS_ACK_DATA) {
            //assert(false);
          //}

          //if(opcode == HINT_ACK) {
            //assert(false);
          //}

          //if(opcode == PROBE_ACK) {
            //if(param == TtoB || param == TtoN) {
              //block_perm[block_addr] = TIP;
            //}

            //b_callback.call(source);
            //b_srcs.release(source);
          //}

          //if(opcode == PROBE_ACK_DATA) {
              //unsigned long count;
              //auto it = ongoings.find(source);
              //if(it == ongoings.end()) {
                //count = 0;
              //}
              //else {
                //count = (*it).second;
              //}

              //auto get_addr = addr_aligned + count * _c_datalen;

              //memory[get_addr] = data;

              //if(count + 1 == burst_len) {
                //if(param == TtoB || param == TtoN) {
                  //block_perm[block_addr] = TIP;
                //}

                //b_callback.call(source);
                //b_srcs.release(source);

                //if(count != 0) { 
                  //ongoings.erase(source);
                //}
              //}
              //else {
                  //ongoings[source] = count + 1;
              //}
          //}

          //if(opcode == RELEASE) {
            //if(param == TtoB || param == TtoN) {
              //block_perm[block_addr] = TIP;
            //}
            //Args args;
            //args.size = size;
            //args.source = source;
            //tlDMessage dmsg{"ReleaseAck", args};
            //_d_queue.push(dmsg, Callback());
          //}

          //if(opcode == RELEASE_DATA) {
            //unsigned long count;
            //auto it = ongoings.find(source);
            //if(it == ongoings.end()) {
              //count = 0;
            //}
            //else {
              //count = (*it).second;
            //}

            //auto get_addr = addr_aligned + count * _c_datalen;

            //memory[get_addr] = data;

            //if(count + 1 == burst_len) {
              //if(param == TtoB || param == TtoN) {
                //block_perm[block_addr] = TIP;
              //}

              //Args args;
              //args.size = size;
              //args.source = source;
              //tlDMessage dmsg{"ReleaseAck", args};
              //_d_queue.push(dmsg, Callback());

              //if(count != 0) {
                //ongoings.erase(source);
              //}
            //}
            //else {
              //ongoings[source] = count + 1;
            //}
          //}

        //RisingEdge(_rtlflow, _dut);
      //}
    //}

    //_c_ports.ports.ready == 0;
//}
void tlAdapter::e_port_monitor(
  std::unordered_map<unsigned long long, unsigned long long>& memory, 
  FreeList& d_sinks
) {

  switch(_efg) {
    case 0:
      _e_ports.ports.ready = 1;
      _efg = 1;
    case 1:
      if(_drive) {
        if(_e_ports.fire()) {
          unsigned long sink = _e_ports.ports.sink & _e_ports.mks.sink;
          d_sinks.release(sink);
          _ongoing_tlc.erase(sink);
        }
        _efg = 2;
      }
      else {
        _efg = 3;
      }
    case 2:
      _efg = 1;
      break;
    case 3:
      _e_ports.ports.ready = 0;
      _efg = 4;
      break;
    //case 4:
      //assert(false);
  }
}

//void tlAdapter::e_port_monitor(
  //std::unordered_map<unsigned long long, unsigned long long>& memory, 
  //FreeList& d_sinks
//) {

  //*(_e_ports.ports.ready) = 1;
  //if(_drive) {
    //if(_e_ports.fire()) {
        //auto sink = *(_e_ports.ports.sink) & _e_ports.mks.sink;
        //d_sinks.release(sink);
        //_ongoing_tlc.erase(sink);
    //}

    //RisingEdge(_rtlflow, _dut);
  //}

  //*(_e_ports.ports.ready) = 0;
//}

void tlAdapter::d_port_driver() {
  label:
    switch(_dfg) {
      case 0:
        _d_ports.clear();
        _dfg = 1;
      case 1:
        if(_drive) {
          if(!_d_queue.empty()) {
              auto msg_callback = _d_queue.pop();
              auto msg = msg_callback.first;
              // TODO if(msg)?
              if(!msg.msg.empty()) {
                Callback callback = msg_callback.second;
                // difuzz None, ours [](){}
                callback();

                _d_ports.ports.opcode = msg.opcode;
                _d_ports.ports.param = msg.param;
                _d_ports.ports.size = msg.size;
                _d_ports.ports.source = msg.source;
                _d_ports.ports.sink = msg.sink;
                _d_ports.ports.data = msg.data;
                _d_ports.ports.corrupt = msg.corrupt;
                _d_ports.ports.denied = msg.denied;
              //std::cerr << "denied" << *(_d_ports.ports.denied) << "\n";

                _d_ports.ports.valid = 1;
                _dfg = 2;

              //unsigned long opcode = *(_d_ports.ports.opcode) & (_d_ports.mks.opcode);
              //unsigned long param = *(_d_ports.ports.param) & _d_ports.mks.param;
              //unsigned long size = *(_d_ports.ports.size) & _d_ports.mks.size;
              //unsigned long source = *(_d_ports.ports.source) & _d_ports.mks.source;
              //unsigned long sink = *(_d_ports.ports.sink) & _d_ports.mks.sink;
              //unsigned long long data = *(_d_ports.ports.data) & _d_ports.mks.data;
              //unsigned long corrupt = *(_d_ports.ports.corrupt) & _d_ports.mks.corrupt;
              //unsigned long denied = *(_d_ports.ports.denied) & _d_ports.mks.denied;

              //std::ofstream of("d_port_rtlflow.out");
              //std::stringstream ss;
              //ss << "=======\n";
              //ss << opcode << "\n";
              //ss << param << "\n";
              //ss << size << "\n";
              //ss << source << "\n";
              //ss << sink << "\n";
              //ss << data << "\n";
              //ss << corrupt << "\n";
              //ss << denied << "\n";
              //of << ss.rdbuf();
              //of.close();
            }
          }
          break;
        }
        else {
          _dfg = 4;
        }
      case 2:
        if(_d_ports.fire()) {
          _dfg = 3;
        }
        else {
          break;
        }
      case 3:
        _d_ports.clear();
        _d_ports.ports.valid = 0;
        _dfg = 1;
        goto label;
      case 4:
        _d_ports.clear();
        _dfg = 5;
        break;
      //default:
        //assert(false);
    }
}

//void tlAdapter::d_port_driver() {

  //// fg 0
  //_d_ports.clear();

  //// fg 1
  //if(_drive) {
    //if(!_d_queue.empty()) {
      //auto msg_callback = _d_queue.pop();
      //auto msg = msg_callback.first;
      //// TODO if(msg)?
      //Callback callback = msg_callback.second;
      //// difuzz None, ours [](){}
      //callback();

      //*(_d_ports.ports.opcode) = msg.opcode;
      //*(_d_ports.ports.param) = msg.param;
      //*(_d_ports.ports.size) = msg.size;
      //*(_d_ports.ports.source) = msg.source;
      //*(_d_ports.ports.sink) = msg.sink;
      //*(_d_ports.ports.data) = msg.data;
      //*(_d_ports.ports.corrupt) = msg.corrupt;
      //*(_d_ports.ports.denied) = msg.denied;

      //*(_d_ports.ports.valid) = 1;
      //// fg 2
      //RisingEdge(_rtlflow, _dut);
      //// fg 3
      //while(!_d_ports.fire()) {
        //RisingEdge(_rtlflow, _dut);
      //}
      //// fg 4
      //_d_ports.clear();
      //*(_d_ports.ports.valid) = 0;
      ////else {
        ////RisingEdge(_rtlflow, _dut);
      ////}
    //}
    //else {
      //// fg 5
      //RisingEdge(_rtlflow, _dut);
    //}
  //}

  //// fg 5
  //_d_ports.clear();
//}

void tlAdapter::b_port_driver() {
  label:
    switch(_bfg) {
      case 0:
        _b_ports.clear();
        _bfg = 1;
      case 1:
        if(_drive) {
          if(!_b_queue.empty()) {
            auto msg_callback = _b_queue.pop();
            auto msg = msg_callback.first;
            if(!msg.msg.empty()) {

              _b_ports.ports.opcode = msg.opcode;
              _b_ports.ports.param = msg.param;
              _b_ports.ports.size = msg.size;
              _b_ports.ports.source = msg.source;
              _b_ports.ports.address = msg.address;
              _b_ports.ports.mask = msg.mask;
              _b_ports.ports.data = msg.data;
              //std::cerr << "b_port_driver=============\n";
              //std::cerr <<int(*(_b_ports.ports.opcode)) << "\n";
              //std::cerr <<int(*(_b_ports.ports.param)) << "\n";
              //std::cerr <<int(*(_b_ports.ports.size)) << "\n";
              //std::cerr <<int(*(_b_ports.ports.source)) << "\n";
              //std::cerr <<int(*(_b_ports.ports.address)) << "\n";
              //std::cerr <<int(*(_b_ports.ports.mask)) << "\n";
              //std::cerr <<int(*(_b_ports.ports.data)) << "\n";

              _b_ports.ports.valid = 1;
              _bfg = 2;
            }
          }
          break;
        }
        else {
          _bfg = 4;
        }
      case 2:
        if(_b_ports.fire()) {
          _bfg = 3;
        }
        else {
          break;
        }
      case 3:
        _b_ports.clear();
        _b_ports.ports.valid = 0;
        _bfg = 1;
        goto label;
      case 4:
        _b_ports.clear();
        _bfg = 5;
        break;
      //default:
        //assert(false);
    }
}

//void tlAdapter::b_port_driver() {

  //_b_ports.clear();
  //if(_drive) {
    //if(!_b_queue.empty()) {
      //auto msg_cb = _b_queue.pop();
      //auto msg = msg_cb.first;
      //// TODO if(msg)?
      //*(_b_ports.ports.opcode) = msg.opcode;
      //*(_b_ports.ports.param) = msg.param;
      //*(_b_ports.ports.size) = msg.size;
      //*(_b_ports.ports.source) = msg.source;
      //*(_b_ports.ports.address) = msg.address;
      //*(_b_ports.ports.mask) = msg.mask;
      //*(_b_ports.ports.data) = msg.data;

      //*(_b_ports.ports.valid) = 1;
      //RisingEdge(_rtlflow, _dut);
      //while(!_b_ports.fire()) {
        //RisingEdge(_rtlflow, _dut);
      //}

      //_b_ports.clear();
      //*(_b_ports.ports.valid) = 0;

      ////else {
        ////RisingEdge(_rtlflow, _dut);
      ////}
    //}
    //else {
      //RisingEdge(_rtlflow, _dut);
    //}
  //}
  //_b_ports.clear();
//}

void tlAdapter::data_retriever(
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  FreeList& b_srcs,
  srcToCallback& b_callback
) {

  switch(_drfg) {
    case 0:
      if(_retrieve) {
        probe_blocks(block_perm, b_srcs, b_callback);
        _drfg = 1;
      }
      else {
        break;
      }
    case 1:
      _drfg = 2;
      break;
    //case 2:
      //assert(false);
  }
}

void tlAdapter::host_interface(
  std::unordered_map<unsigned long long, unsigned long long>& block_perm, 
  FreeList& b_srcs,
  srcToCallback& b_callback
) {
  switch(_hifg) {
    case 0:
      if(_drive) {
        bool is_in{false};

        for(auto&& v: _ongoing_tlc) {
          if(v.second == _probe_addr) {
            is_in = true;
            break;
          }
        }

        if ((_probe & _probe_en) && !is_in) {
          auto block_addr = _probe_addr & _block_mask;
          auto mask = (1 << _b_datalen) - 1;
          auto size = int(std::log2(_block_size));
          //std::cerr << "host_interface==================\n";
          //std::cerr << _probe_addr << "\n";
          //std::cerr << _block_mask << "\n";
          //std::cerr << block_addr << "\n";
          //std::cerr << mask << "\n";
          //std::cerr << _block_size << "\n";
          //std::cerr << size << "\n";

          //assert block_addr in block_perm.keys(), \
              //'{:016x} not in block_perm.keys()'.format(block_addr)

          if(block_perm[block_addr] != TIP) {
            Callback callback = [this]() mutable { this->enableProbe(); };
            retrieveBlock(b_srcs, b_callback, callback, toN, size, _probe_addr, mask);

            _probe = 0;
            _probe_en = 0;
            _probe_addr = 0;
          }
        }
      }
      else {
        _hifg = 1;
      }
      break;
    //case 1:
      //assert(false);
  }
}

void tlAdapter::probe_block(unsigned long long probe_addr) {
  _probe = 1;
  _probe_addr = probe_addr;
}

void tlAdapter::start(std::unordered_map<unsigned long long, unsigned long long>& memory) {
  _drive = true;
  _retrieve = false;

  init_drive_input(memory);
  drive_input(memory);
}

void tlAdapter::stop() {
  _retrieve = true;
}

bool tlAdapter::onGoing() {
  return _a_ports.ports.valid | _c_ports.ports.valid;
}

bool tlAdapter::isRunning() {
  return _drive;
}

} // end of namespace gf
