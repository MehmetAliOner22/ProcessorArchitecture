module ControlUnit(
    input logic [3:0] Opcode,
    input logic [2:0] Funct,
    output logic PCSrc,
    output logic RegWrite,
    output logic MemWrite,
    output logic MemtoReg,
    output logic ALUSrc,
    output logic [1:0] RegSrc,
    output logic [1:0] ALUControl  
);
   
    Decoder d (Opcode, Funct, PCSrc, RegWrite, MemWrite, MemtoReg, ALUSrc, RegSrc, ALUControl);

endmodule
    