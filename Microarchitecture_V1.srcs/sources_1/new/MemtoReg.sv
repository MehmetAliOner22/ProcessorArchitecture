`timescale 1ns / 1ps

module MemtoReg(
  input wire [7:0] rd,   // Data Memory'den okunan deðer
  input wire [7:0] ALUResult,  // ALU'nun sonuç deðeri
  input wire memToReg,         // MUX seçim sinyali (1: readData, 0: aluResult)
  output reg [7:0] outputData   // MUX'un çýkýþý (Seçilen deðer)
);

  // 2x1 MUX
  always_comb begin
    if (memToReg == 1'b1)
      outputData <= rd;
    else
      outputData <= ALUResult;
  end

endmodule
