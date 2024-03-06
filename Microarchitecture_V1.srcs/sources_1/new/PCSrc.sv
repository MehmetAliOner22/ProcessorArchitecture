module PCSrc(
  input wire [7:0] MemtoRegResult,// MemtoReg sinyaline ba�l� 2xMUX un result de�eri
  input wire [7:0] PCPlus1, // PCPlus1 i�leminin result de�eri
  input wire PCSrc,  // MUX se�im sinyali (1: MemtoRegResult, 0: PCPlus4)
  output reg [7:0] NextPC // Next PC de�eri
);
  
  // 2x1 MUX
  always_comb begin
    if (PCSrc)
      NextPC <= MemtoRegResult;
    else
      NextPC <= PCPlus1;
  end

endmodule