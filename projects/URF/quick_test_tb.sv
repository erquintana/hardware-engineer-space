//`include "universal_reg.sv"
int MAX_SIM_TIME = 1000;

module tb;
  	int DATA_WIDTH = 8;
  	int DEPTH = 16;
  	logic clk = 0;
  	logic rst;
  	logic [DATA_WIDTH-1:0] write_addr;
  	logic [DATA_WIDTH-1:0] read_addr;
  	logic [DATA_WIDTH-1:0] write_data;


	// generating free-running clock:
	always #5 clk = ~clk;

	// test 1:
	initial begin


	end

	// dumping vars
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end


	initial begin
		#(MAX_SIM_TIME);
		$finish;
	end

endmodule
