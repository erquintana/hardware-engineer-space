// Code your testbench here
// or browse Examples
`timescale 1ns/1ps 

module tb;
  logic clk = 0;
  logic clk_div2 = 0;
  logic clk_div4 = 0;
  logic clk_div6 = 0;
  
// clocks generation: 
  always #5 clk <= ~clk;
  
  always @(posedge clk) begin
    clk_div2 <= ~clk_div2;
  end
  always @(posedge clk_div2) begin
    clk_div4 <= ~clk_div4;
  end
  
    always @(posedge clk_div4) begin
    clk_div6 = ~clk_div6; 
  end
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end 
  
  initial #1000 $finish;

  initial begin
    gen_clock(0,5,5,clk_gen_1);
  end
  


endmodule