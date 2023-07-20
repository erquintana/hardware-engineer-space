//------------------------------------------------------------------------------
// Project: <Project Name>
// File:    <File Name>.sv
// Author:  Esteban Rodríguez Quintana
// Date:    <Date Created/Modified>
//
// Description: <Brief description of the purpose of this file>
//
// Revision History:
// - <Date>: <Version / Modification Description>
//
//------------------------------------------------------------------------------

module universal_reg_array #(
    parameter int DATA_WIDTH = 8,   // qty of logic for each data in reg array
    parameter int DEPTH = 16        // qty of reg array spaces
) (
    input logic clk,
    input logic rst,
    input logic [DEPTH-1:0] read_addr,
    input logic [DEPTH-1:0] write_addr,
    input logic [DATA_WIDTH-1:0] write_data,
    input logic write_en,

    output logic [DATA_WIDTH-1:0] read_data,
    output logic busy
);

  logic [DATA_WIDTH-1:0] reg_array[DEPTH-1:0];

  // write and read control logic:
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // posedge rst:
      // cleaning out data:
      read_data <= 0;
      busy <= 0;
      // cleaning reg array:
      foreach (reg_array[i, j]) begin
        reg_array[i][j] <= 0;
      end
    end else begin
      // posedge clk:
      if (write_en) begin
        reg_array[write_addr] <= write_data;
        busy <= 1;
      end else if (read_addr) begin     // readind data from reg array at read_addr and assigning to output
        read_data <= reg_array[read_addr];
        busy <= 1;
      end else begin
        busy <= 0;      // not write nor read ocurring, then not busy
      end
    end
  end


endmodule
