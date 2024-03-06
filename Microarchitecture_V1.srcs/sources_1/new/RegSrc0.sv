module RegSrc0(
  input wire [2:0] ra,   // Register deðeri
  input wire RegSrc0,    // MUX seçim sinyali (1: 3'b111, 0: rd)
  output reg [2:0] RA1   // MUX çýkýþý
);

  // 2x1 MUX
  always_comb begin
    if (RegSrc0)
      RA1 <= 3'b111;
    else
      RA1 <= ra;
  end

endmodule