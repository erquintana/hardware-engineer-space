module register(
    input logic [0:7] data,
    input logic rst_,
    input logic enable,
    input logic clk,
    output logic [0:7] out    
);
    always_ff @(posedge clk or negedge rst_) begin
        if (!rst_) begin
            out <= 0;
        end else if (enable) begin
            out <= data;
        end
    end
endmodule