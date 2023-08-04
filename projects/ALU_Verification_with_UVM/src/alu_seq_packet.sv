// Contains the package handled for the ALU
class alu_seq_packet extends uvm_sequence_item;
    `uvm_object_utils(alu_seq_packet);

    // Package to be sent to DUT (ALU) has clk, rst, A, B and ALU_sel:
    logic clk;
    rand logic rst;
    rand logic [7:0] a;
    rand logic [7:0] b;
    rand logic [3:0] alu_sel;

    // constrain definition for rand variables:
    //constraint constraint_A_B       { a >= b }
    //constraint constraint_ALU_sel   {alu_sel >= 0; alu_sel <= 3}
    
    // class constructor:
    function new(string name = "alu_seq_packet");
        super.new(name);
        `uvm_info(this.get_name(),"alu_seq_packet object created", UVM_MEDIUM);
    endfunction

endclass