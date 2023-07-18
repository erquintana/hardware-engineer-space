//--------------------------------------------------------
//ALU Design Version 1.0
//--------------------------------------------------------


/* 
ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_out = A / B;
----------------------------------------------------------------------
*/

module alu(
    input clock,
    input reset,
    input [7:0] A,
    input [7:0] B,
    input [3:0] ALU_sel,
    output reg [7:0] ALU_out,
    output bit carry_out
);
    reg [7:0] ALU_result;
    reg [8:0] carry_result;

    assign carry_result = A+B;     
    
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            ALU_out <= 8'b0;
            carry_out <= 0;
        end
        else begin
            ALU_out <= ALU_result;
            carry_out <= carry_result[8];
        end
    end

    always @(*) begin
        case (ALU_sel)
            4'b0000: ALU_result <= A + B;  // sum
            4'b0001: ALU_result <= A - B;  // sub 
            4'b0010: ALU_result <= A * B;  // mult
            4'b0011: ALU_result <= A / B;  // div
            default: ALU_result <= 8'hAC;  // error 
        endcase
    end
endmodule

