`timescale 1ns/1ps;

parameter int DEPTH = 32;
parameter int DATA_WIDTH = 8;
parameter int MAX_EXEC_TIME_NS = 500;

//////////////////////////////////////////////////////////////////////////////////
// INTERFASE
//////////////////////////////////////////////////////////////////////////////////
// In the interface the variables are declared as datatypes only, and 
// in clocking block and modport we define skew and directions respectively.
interface URA_interface #(DEPTH = 16, DATA_WIDTH = 32)();
    logic clk;
    logic rst;
    logic [DEPTH-1:0] read_addr;
    logic [DEPTH-1:0] write_addr;
    logic [DATA_WIDTH-1:0] write_data;
    logic write_en;
    logic read_en;

    logic [DATA_WIDTH-1:0] read_data;
    logic busy;

    // Clocking blocks are used to define skew for signals and also acces
    // and synchronization.
    clocking driver_cb @(posedge clk);
        default input #1 output #1;
        output rst;
        output read_addr;
        output write_addr;
        output write_data;
        output write_en;
        output read_en;
        output read_data;
        output busy;
    endclocking

    // If connected to an interface modport, a module sees only:
        // ● Ports defined in that modport
        // ● Methods imported from that modport
    // To restrict interface access within a module, there are modport lists with directions declared 
    // within the interface. The keyword modport indicates that the directions are declared as if 
    // inside the module.
    // Modports create different views of an interface. --> access / direction
    modport DRIVER_MP (clocking driver_cb);

    // Clocking blocks are used to define skew for signals
    // and synchronization.
    clocking monitor_cb @(posedge clk);
        default input #1 output #1;
        input rst;
        input read_addr;
        input write_addr;
        input write_data;
        input write_en;
        input read_en;
        input read_data;
        input busy;
    endclocking

    // If connected to an interface modport, a module sees only:
        // ● Ports defined in that modport
        // ● Methods imported from that modport
    // To restrict interface access within a module, there are modport lists with directions declared 
    // within the interface. The keyword modport indicates that the directions are declared as if 
    // inside the module.
    // Modports create different views of an interface.
    modport MONITOR_MP (clocking monitor_cb);


endinterface

//////////////////////////////////////////////////////////////////////////////////
// TRANSACTION_ITEM
//////////////////////////////////////////////////////////////////////////////////
class transaction_item #(DEPTH, DATA_WIDTH);
    rand logic clk;
    rand logic rst;
    rand logic [DEPTH-1:0] read_addr;
    rand logic [DEPTH-1:0] write_addr;
    rand logic [DATA_WIDTH-1:0] write_data;
    rand logic write_en;
	rand logic read_en;
    rand logic [DATA_WIDTH-1:0] read_data;
    rand logic busy;

    constraint wr_rd_c {read_en != write_en;}

    function new();
    endfunction

    function void display();
        $display("[TRANS ITEM] : %p", this ) ;
    endfunction

endclass

//////////////////////////////////////////////////////////////////////////////////
// GENERATOR
//////////////////////////////////////////////////////////////////////////////////
class generator;
    mailbox g2d_mbx;

    function new(mailbox g2d_mbx);
        this.g2d_mbx = g2d_mbx;
    endfunction
endclass

//////////////////////////////////////////////////////////////////////////////////
// DRIVER
//////////////////////////////////////////////////////////////////////////////////
class driver;
    virtual interface URA_interface vinf;
    mailbox g2d_mbx;

    function new(virtual interface URA_interface vinf, mailbox g2d_mbx);
        this.vinf = vinf;
        this.g2d_mbx = g2d_mbx;
    endfunction
endclass

//////////////////////////////////////////////////////////////////////////////////
// MONITOR
//////////////////////////////////////////////////////////////////////////////////
class monitor;
    virtual interface URA_interface vinf;
    mailbox m2s_mbx;

    function new(virtual interface URA_interface vinf , mailbox m2s_mbx);
        this.m2s_mbx = m2s_mbx;
        this.vinf = vinf;
    endfunction    
endclass

//////////////////////////////////////////////////////////////////////////////////
// SCOREBOARD
//////////////////////////////////////////////////////////////////////////////////
class scoreboard;
    // communication:
    mailbox m2s_mbx;

    function new(mailbox m2s_mbx);
        this.m2s_mbx = m2s_mbx;
    endfunction    
endclass

//////////////////////////////////////////////////////////////////////////////////
// AGENT
//////////////////////////////////////////////////////////////////////////////////
class agent_1;
    // module communication:
    virtual interface URA_interface vinf;
    mailbox g2d_mbx;
    mailbox m2s_mbx;

    // components:
    generator gen = new(g2d_mbx);
    driver drv = new(vinf ,g2d_mbx);
    monitor mon = new(vinf ,m2s_mbx);

    function new(virtual URA_interface vint, mailbox m2s_mbx);
        this.m2s_mbx = m2s_mbx;
        this.vinf = vinf;    
    endfunction
endclass

//////////////////////////////////////////////////////////////////////////////////
// ENVIRONMENT
//////////////////////////////////////////////////////////////////////////////////
class environment;
    
    // communication:
    virtual interface URA_interface vinf;
    mailbox m2s_mbx;

    // components:
    scoreboard scb = new(m2s_mbx);
    agent_1 agnt1 = new(vinf, m2s_mbx);
    
    function new(virtual interface URA_interface vinf);
        this.vinf = vinf;
    endfunction



endclass

//////////////////////////////////////////////////////////////////////////////////
// TEST1
//////////////////////////////////////////////////////////////////////////////////
class test1;

endclass

//////////////////////////////////////////////////////////////////////////////////
// TESTBENCH
//////////////////////////////////////////////////////////////////////////////////
module tb;
	logic clk = 0;
    logic rst = 0;
    always #5 clk = ~clk;

    // cominucation:
    URA_interface #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH)) inf();

    // components:
    environment env = new(inf);
    universal_reg_array #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH)) DUT(
        .clk(inf.clk),
        .rst(inf.rst),
        .read_addr(inf.read_addr),
        .write_addr(inf.write_addr),
        .write_data(inf.write_data),
        .write_en(inf.write_en),
        .read_en(inf.read_en),
        .read_data(inf.read_data),
        .busy(inf.busy)
    ); 
        
    initial begin
      $dumpfile("dumpo.vcd");
      $dumpvars();
    end 

    initial begin
        #(MAX_EXEC_TIME_NS);
        $finish;
    end

endmodule


