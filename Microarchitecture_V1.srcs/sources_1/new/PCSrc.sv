module PCSrc(
  input wire [7:0] MemtoRegResult,// MemtoReg sinyaline baðlý 2xMUX un result deðeri
  input wire [7:0] PCPlus1, // PCPlus1 iþleminin result deðeri
  input wire PCSrc,  // MUX seçim sinyali (1: MemtoRegResult, 0: PCPlus4)
  output reg [7:0] NextPC // Next PC deðeri
);
  
  // 2x1 MUX
  always_comb begin
    if (PCSrc)
      NextPC <= MemtoRegResult;
    else
      NextPC <= PCPlus1;
  end

endmodule