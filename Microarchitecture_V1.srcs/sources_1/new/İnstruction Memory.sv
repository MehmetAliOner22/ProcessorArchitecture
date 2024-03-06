`timescale 1ns / 1ps

module InstructionMemory (
    input [7:0] address, // 8-bit adres giriþi
    output reg [15:0] instruction // 16-bit komut çýkýþý
);

// program kodu
reg [15:0] memory [0:255];

always_comb begin
    case (address)
        8'b00000000: instruction = 16'b0000001000010001; // ADD R1, R0, R1
        8'b00000001: instruction = 16'b0000010000100001; // SUB R2, R1, R0
        8'b00000010: instruction = 16'b0000100000110101; // AND R3, R1, R5
        8'b00000011: instruction = 16'b0000101001001100; // OR  R4, R2, R12
        8'b00000100: instruction = 16'b0100011010010010; // ADDI R6, R9, 2
        8'b00000101: instruction = 16'b1011101100000010; // LW  R11, 2(R0)
        8'b00000110: instruction = 16'b1111110111000101; // SW  R13, -27(R12)
        //8'b00000111: instruction = 16'b1000_1110_1011_1011; // BEQ R14, R11, -69
        //8'b00001000: instruction = 16'b0010_0000_0000_1100; // J   12
        // Add more instructions as needed
        default: instruction = 16'b0000000000000000; // Default: NOP
    endcase
end

endmodule
