module tb;
  logic [7:0] mem1 [31:0];	// 32 groups of 8 logic
  logic mem2 [7:0][31:0];	// 8 groups x (32 groups of 1 logic)
  logic [7:0][31:0] mem3;	// 8 x 32 consecutive logic
  
  
  initial begin 
    $display("%p",mem1);
    $display("%p",mem2);
    $display("%b",mem3);
  end
endmodule