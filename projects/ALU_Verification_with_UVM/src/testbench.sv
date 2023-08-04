import uvm_pkg::*;
`include "alu_interface.sv"
`include "alu_seq_packet.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "uvm_macros.svh"
`include "alu_feature_tests.sv"
`include "test.sv"

module top_tb();
    //===============================================
    // Instantiation:
    //===============================================
    logic clock;
    alu_interface alu_if();
    alu alu_dut(
        .clock(alu_if.clock),
        .reset(alu_if.reset),
        .A(alu_if.a),
        .B(alu_if.b),
        .ALU_sel(alu_if.ALU_sel),
      	.ALU_out(alu_if.ALU_out),
        .carry_out(alu_if.carry_out)
    );
    int MAX_SIM_EXEC_TIME = 1000;
    
    //===============================================
    // clock generartion:
    //===============================================
    initial begin
        alu_if.clock = 0;
        forever begin
            #10 alu_if.clock <= ~alu_if.clock;
        end
    end

    //===============================================
    // UVM start up:
    //===============================================    
    initial begin;
        uvm_config_db #(virtual alu_interface.mp_if)::set(null, "*", "ALU_vif", alu_if);
      	run_test("test");
    end
    

    //===============================================
    // dump file:
    //===============================================
    initial begin
        $dumpfile("dump.vcd");
      	$dumpvars(0,top_tb);
    end
endmodule

