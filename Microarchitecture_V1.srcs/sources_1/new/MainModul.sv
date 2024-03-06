`timescale 1ns / 1ps

module MainModule (
    // Giri� ve ��k��lar
    input logic clk,           // Saat sinyali
    input [7:0] pc
);
    
    wire [7:0] pc;            // Program Counter De�eri
    wire [15:0] instruction;  // Instravtion de�eri
    wire [1:0] ALUControl;    // ALU Control sinyali
    wire MemtoReg;            // Memory to Register sinyali
    wire MemWrite;            // Memory Write sinyali
    wire RegWrite;            // Register Write sinyali
    wire [1:0]RegSrc;         // Register Source sinyali
    wire ALUSrc;              // ALU Source sinyali
    wire [2:0] RA1,RA2;       // MUX ��k���
    wire [7:0] rd1, rd2;      // Okunan de�erler
    wire [2:0] SrcB;          // MUX ��k���
    wire Zero;                // Branch i�lem�nde kullanmak i�in zero de�eri
    wire ALUResult;           // ALU result de�eri
    wire [7:0] dataOut;       // Okunan de�er
    wire [7:0] outputData;    // MUX'un ��k��� (Se�ilen de�er)
    wire [7:0] PCPlus1;       // Program Counter de�erinin bir artt�r�lm�� de�eri
    wire [7:0] PCPlus2;       // Program Counter de�erinin iki artt�r�lm�� de�eri
    wire [7:0] NextPC;         // Next PC de�eri
    
    // Program Sayac� Mod�l�
    ProgramCounterFunction PCF(
        .clk(clk),
        .nextAdress(nextAddress),
        .pc_out(pc)
    ); 
    
    // Instruction Memory Mod�l�
    InstructionMemory IM(
        .address(pc),
        .instruction(instruction)
    ); 
    
    // Control Unit Mod�l�
    ControlUnit CU(
        .Opcode(instruction[15:12]),
        .Funct(instruction[2:0]),
        .ALUControl(ALUControl),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .RegSrc(RegSrc),
        .ALUSrc(ALUSrc)
    );
    
    // RegSrc0 Mod�l�
    RegSrc0 RS0(
        .ra(instruction[8:6]),
        .RegSrc0(RegSrc[0]),
        .RA1(RA1)
    );
    
    // RegSrc1 Mod�l�
    RegSrc1 RS1(
        .rd(instruction[11:9]),
        .rb(instruction[5:3]),
        .RegSrc1(RegSrc[1]),
        .RA2(RA2)
    );
    
    // Register File Mod�l�
    RegisterFile RF(
        .ra1(RA1),
        .ra2(RA2),
        .wa(instruction[11:9]), // Yazma adresi, instruction'�n ilgili k�sm�ndan al�nabilir
        .wd(MemtoRegData),        // ALU'nun ��k���n� Register File'a yaz
        .RegWrite(RegWrite),
        .clk(clk),
        .rd1(rd1),
        .rd2(rd2)
    );
    
    // ALUSrc Mod�l�
    ALUSrc AS(
        .rd2(rd2),
        .imm(instruction[5:0]),
        .ALUSrc(ALUSrc),
        .SrcB(SrcB)
    );
    
    // ALU Mod�l�
    ALU ALU1(
        .SrcA(rd1),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .Zero(Zero),
        .ALUResult(ALUResult)
    );
    
    // Data Memory Mod�l�
    DataMemory DM(
        .address(ALUResult),  // ALU'nun ��k���n� adres olarak kullan
        .dataIn(rd2),         // Okunan de�eri yaz
        .MemWrite(MemWrite),
        .clk(clk),
        .dataOut(dataOut)
    );

    // MemtoReg Mod�l�
    MemtoReg MTR(
        .rd(dataOut),
        .ALUResult(ALUResult),
        .memToReg(MemtoReg),
        .outputData(MemtoRegData)
    );

    // PCPlus1 Mod�l�
    PCPlus1 P1(
        .PC(pc),
        .PCPlus1(PCPlus1)
    );

    // PCPlus2 Mod�l�
    PCPlus2 P2(
        .PCPlus1(PCPlus1),
        .PCPlus2(PCPlus2)
    );
    
    // PCSrc Mod�l�
    PCSrc PCS(
        .MemtoRegResult(MemtoRegData),
        .PCPlus1(nextAddress),
        .PCSrc(PCSrc),
        .NextPC(NextPC)
    );
endmodule
