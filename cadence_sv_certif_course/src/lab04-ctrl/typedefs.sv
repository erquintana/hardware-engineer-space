package typedefs;
    typedef enum logic [0:2] {HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} opcode_t;
    typedef enum logic [0:2] { INST_ADDR, INST_FETCH, INST_LOAD, IDLE, OP_ADDR, ALU_OP, ALU_OP, STORE } state_t;
endpackage