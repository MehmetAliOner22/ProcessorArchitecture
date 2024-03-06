`timescale 1ns / 1ps

module DataMemory (
    input [7:0] address, // 8-bit adres giriþi
    input [7:0] dataIn,  // Yazýlacak deðer
    input MemWrite,      // Yazma kontrol sinyali
    input clk,        // Clock sinyali
    output reg [7:0] dataOut // Okunan deðer
);

reg [7:0] memory [0:255]; // 256 adet 8-bit hücreden oluþan hafýza

always @(posedge clk) begin
    // Okuma iþlemi
    dataOut <= memory[address];

    // Yazma iþlemi
    if (MemWrite) begin
        memory[address] <= dataIn;
    end
end

endmodule
