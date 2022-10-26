#pragma once

#include <string>
#include <bitset>
#include <vector>
#include <functional>

typedef std::function<void()> Callback;

struct Args {
  unsigned long long data{0};
  unsigned long param{0};
  unsigned long size{0};
  unsigned long source{0};
  unsigned long address{0};
  unsigned long mask{0};
  unsigned long sink{0};
};


enum class PROTOCOL {
  TL_UL,
  TL_UH,
  TL_C
};

// Protocol 
unsigned long TL_UL               = 0x0;
unsigned long TL_UH               = 0x1;
unsigned long TL_C                = 0x2;

// Ports 

std::vector<std::string> TL_A_FIELDS = { "opcode", "param", "size", "source", "address", "mask", "data", "valid", "ready" };
std::vector<std::string> TL_B_FIELDS = { "opcode", "param", "size", "source", "address", "mask", "data", "valid", "ready" };
std::vector<std::string> TL_C_FIELDS = { "opcode", "param", "size", "source", "address", "data", "corrupt", "valid", "ready" };
std::vector<std::string> TL_D_FIELDS = { "opcode", "param", "size", "source", "sink", "data", "corrupt", "denied", "valid", "ready" };
std::vector<std::string> TL_E_FIELDS = { "sink", "valid", "ready" };


// Messages 
// Master 
// A 
unsigned long GET                 = 0x4;
unsigned long PUT_FULL_DATA       = 0x0;
unsigned long PUT_PARTIAL_DATA    = 0x1;
unsigned long ARITHMETIC_DATA     = 0x2;
unsigned long LOGICAL_DATA        = 0x3;
unsigned long INTENT              = 0x5;
unsigned long ACQUIRE_BLOCK       = 0x6;
unsigned long ACQUIRE_PERM        = 0x7;

// C 
unsigned long PROBE_ACK           = 0x4;
unsigned long PROBE_ACK_DATA      = 0x5;
unsigned long RELEASE             = 0x6;
unsigned long RELEASE_DATA        = 0x7;

// E 
//GRANT_ACK

// Slave 
// D 
unsigned long ACCESS_ACK          = 0x0;
unsigned long ACCESS_ACK_DATA     = 0x1;
unsigned long HINT_ACK            = 0x2;
unsigned long GRANT               = 0x4;
unsigned long GRANT_DATA          = 0x5;
unsigned long RELEASE_ACK         = 0x6;

// B 
unsigned long PROBE_BLOCK         = 0x6;
unsigned long PROBE_PERM          = 0x7;


// Parameters 
// Master 
unsigned long MIN                 = 0x0;
unsigned long MAX                 = 0x1;
unsigned long MINU                = 0x2;
unsigned long MAXU                = 0x3;
unsigned long ADD                 = 0x4;
unsigned long XOR                 = 0x0;
unsigned long OR                  = 0x1;
unsigned long AND                 = 0x2;
unsigned long SWAP                = 0x3;
unsigned long PREFETCH_READ       = 0x0;
unsigned long PREFETCH_WRITE      = 0x1;

// Permission 
unsigned long NONE                = 0x0; // None
unsigned long BRANCH              = 0x1; // Read (GET)
unsigned long TRUNK               = 0x2; // None
unsigned long TIP                 = 0x3; // Read&Write (GET, PUT)

// Permission Transmissions 
// Cap 
unsigned long toT                 = 0x0;
unsigned long toB                 = 0x1;
unsigned long toN                 = 0x2;

// Grow 
unsigned long NtoB                = 0x0;
unsigned long NtoT                = 0x1;
unsigned long BtoT                = 0x2;

// Prune 
unsigned long TtoB                = 0x0;
unsigned long TtoN                = 0x1;
unsigned long BtoN                = 0x2;

// Report 
unsigned long TtoT                = 0x3;
unsigned long BtoB                = 0x4;
unsigned long NtoN                = 0x5;

// Width 
unsigned long A_OPCODE_MASK = 0x7;
unsigned long A_PARAM_MASK  = 0x7;
