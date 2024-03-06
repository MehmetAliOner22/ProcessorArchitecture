module ALUSrc(
  input wire [2:0] rd2,    // rd2 de�eri
  input wire [5:0] imm,    // imm(5:0)
  input ALUSrc, // MUX se�im sinyali (1: imm, 0: rd2)
  output reg [2:0] SrcB   // MUX ��k���
);

  // 2x1 MUX
  always_comb begin
    if (ALUSrc)
      SrcB <= imm;
    else
      SrcB <= rd2;
  end

endmodule