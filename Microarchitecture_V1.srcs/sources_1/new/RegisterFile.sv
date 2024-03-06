`timescale 1ns / 1ps

module RegisterFile (
    input [2:0] ra1, // Okuma için adres 1
    input [2:0] ra2, // Okuma için adres 2
    input [2:0] wa,  // Yazma için adres
    input [7:0] wd,  // Yazýlacak deðer
    input RegWrite,   // Yazma kontrol sinyali
    input clk,        // Clock sinyali
    output reg [7:0] rd1, rd2 // Okunan deðerler
);

reg [7:0] registers [0:7];

always @(posedge clk) begin
    // Yazma iþlemi kontrol edilir
    if (RegWrite) begin
        registers[wa] <= wd;
    end

    // Okuma iþlemleri
    rd1 <= registers[ra1];
    rd2 <= registers[ra2];
end

endmodule