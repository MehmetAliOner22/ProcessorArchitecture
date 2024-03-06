`timescale 1ns / 1ps

module DataMemory (
    input [7:0] address, // 8-bit adres giri�i
    input [7:0] dataIn,  // Yaz�lacak de�er
    input MemWrite,      // Yazma kontrol sinyali
    input clk,        // Clock sinyali
    output reg [7:0] dataOut // Okunan de�er
);

reg [7:0] memory [0:255]; // 256 adet 8-bit h�creden olu�an haf�za

always @(posedge clk) begin
    // Okuma i�lemi
    dataOut <= memory[address];

    // Yazma i�lemi
    if (MemWrite) begin
        memory[address] <= dataIn;
    end
end

endmodule
