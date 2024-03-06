module RegSrc1(
  input wire [2:0] rd,        // Register deðeri
  input wire [2:0] rb,        // Register deðeri
  input wire RegSrc1,    // MUX seçim sinyali (1: ra, 0: rb)
  output reg [2:0] RA2   // MUX çýkýþý
);

  // 2x1 MUX
  always_comb begin
    if (RegSrc1)
      RA2 <= rd;
    else
      RA2 <= rb;
  end

endmodule