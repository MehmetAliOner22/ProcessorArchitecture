`timescale 1ns / 1ps

module RegisterFile (
    input [2:0] ra1, // Okuma i�in adres 1
    input [2:0] ra2, // Okuma i�in adres 2
    input [2:0] wa,  // Yazma i�in adres
    input [7:0] wd,  // Yaz�lacak de�er
    input RegWrite,   // Yazma kontrol sinyali
    input clk,        // Clock sinyali
    output reg [7:0] rd1, rd2 // Okunan de�erler
);

reg [7:0] registers [0:7];

always @(posedge clk) begin
    // Yazma i�lemi kontrol edilir
    if (RegWrite) begin
        registers[wa] <= wd;
    end

    // Okuma i�lemleri
    rd1 <= registers[ra1];
    rd2 <= registers[ra2];
end

endmodule