interface alu_interface;
    logic clock;
    logic reset;
    logic [7:0] a;
    logic [7:0] b;
    logic [3:0] ALU_sel;
    logic [7:0] ALU_out;
    logic carry_out;

clocking cb @(posedge clock) 
    inout reset;
    inout a;
    inout b;
    inout ALU_sel;
    input ALU_out;
    inout carry_out;

endclocking

modport mp_if(clocking cb);
endinterface