//`include "universal_reg.sv"
int MAX_SIM_TIME = 150;

module tb_1;
    logic clk = 0;
    logic rst = 0;
    logic [31:0] read_addr = 0;
    logic [31:0] write_addr = 0;
    logic [7:0] write_data = 0;
    logic write_en = 0;
    logic read_en = 0;

    logic [7:0] read_data;
    logic busy;


  universal_reg_array #(.DATA_WIDTH(8), .DEPTH(32)) dut (.*);
	// generating free-running clock:
	always #5 clk = ~clk;


    initial begin
        #15
        read_addr <= 0;
        write_addr <= 0;
        write_data <= $urandom();
        write_en <= 1;
        read_en <= 0;

        #10
        rst = 1;
        #10
        rst = 0;
        
        #10
        read_addr <= 0;
        write_addr <= 0;
        write_data <= $urandom();
        write_en <= 0;
        read_en <= 1;

        #10
        read_addr <= 0;
        write_addr <= 0;
        write_data <= $urandom();
        write_en <= 0;
        read_en <= 0;

                read_addr <= 0;
        write_addr <= 0;
        write_data <= $urandom();
        write_en <= 1;
        read_en <= 0;

        #10
        rst = 1;
        #10
        rst = 0;
        
        #10
        read_addr <= 0;
        write_addr <= 0;
        write_data <= $urandom();
        write_en <= 0;
        read_en <= 1;

        #10
        read_addr <= 0;
        write_addr <= 0;
        write_data <= $urandom();
        write_en <= 0;
        read_en <= 0;

    end



	// dumping vars
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end


	initial begin
        #10
        rst = 1;
        #10
        rst = 0;
		#(MAX_SIM_TIME);
		$finish;
	end

endmodule
