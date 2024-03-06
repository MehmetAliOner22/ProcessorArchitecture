module RegSrc1(
  input wire [2:0] rd,        // Register de�eri
  input wire [2:0] rb,        // Register de�eri
  input wire RegSrc1,    // MUX se�im sinyali (1: ra, 0: rb)
  output reg [2:0] RA2   // MUX ��k���
);

  // 2x1 MUX
  always_comb begin
    if (RegSrc1)
      RA2 <= rd;
    else
      RA2 <= rb;
  end

endmodule