`timescale 1ns / 1ps

module MainModule (
    // Giriþ ve Çýkýþlar
    input logic clk,           // Saat sinyali
    input [7:0] pc
);
    
    wire [7:0] pc;            // Program Counter Deðeri
    wire [15:0] instruction;  // Instravtion deðeri
    wire [1:0] ALUControl;    // ALU Control sinyali
    wire MemtoReg;            // Memory to Register sinyali
    wire MemWrite;            // Memory Write sinyali
    wire RegWrite;            // Register Write sinyali
    wire [1:0]RegSrc;         // Register Source sinyali
    wire ALUSrc;              // ALU Source sinyali
    wire [2:0] RA1,RA2;       // MUX çýkýþý
    wire [7:0] rd1, rd2;      // Okunan deðerler
    wire [2:0] SrcB;          // MUX çýkýþý
    wire Zero;                // Branch iþlemþnde kullanmak için zero deðeri
    wire ALUResult;           // ALU result deðeri
    wire [7:0] dataOut;       // Okunan deðer
    wire [7:0] outputData;    // MUX'un çýkýþý (Seçilen deðer)
    wire [7:0] PCPlus1;       // Program Counter deðerinin bir arttýrýlmýþ deðeri
    wire [7:0] PCPlus2;       // Program Counter deðerinin iki arttýrýlmýþ deðeri
    wire [7:0] NextPC;         // Next PC deðeri
    
    // Program Sayacý Modülü
    ProgramCounterFunction PCF(
        .clk(clk),
        .nextAdress(nextAddress),
        .pc_out(pc)
    ); 
    
    // Instruction Memory Modülü
    InstructionMemory IM(
        .address(pc),
        .instruction(instruction)
    ); 
    
    // Control Unit Modülü
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
    
    // RegSrc0 Modülü
    RegSrc0 RS0(
        .ra(instruction[8:6]),
        .RegSrc0(RegSrc[0]),
        .RA1(RA1)
    );
    
    // RegSrc1 Modülü
    RegSrc1 RS1(
        .rd(instruction[11:9]),
        .rb(instruction[5:3]),
        .RegSrc1(RegSrc[1]),
        .RA2(RA2)
    );
    
    // Register File Modülü
    RegisterFile RF(
        .ra1(RA1),
        .ra2(RA2),
        .wa(instruction[11:9]), // Yazma adresi, instruction'ýn ilgili kýsmýndan alýnabilir
        .wd(MemtoRegData),        // ALU'nun çýkýþýný Register File'a yaz
        .RegWrite(RegWrite),
        .clk(clk),
        .rd1(rd1),
        .rd2(rd2)
    );
    
    // ALUSrc Modülü
    ALUSrc AS(
        .rd2(rd2),
        .imm(instruction[5:0]),
        .ALUSrc(ALUSrc),
        .SrcB(SrcB)
    );
    
    // ALU Modülü
    ALU ALU1(
        .SrcA(rd1),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .Zero(Zero),
        .ALUResult(ALUResult)
    );
    
    // Data Memory Modülü
    DataMemory DM(
        .address(ALUResult),  // ALU'nun çýkýþýný adres olarak kullan
        .dataIn(rd2),         // Okunan deðeri yaz
        .MemWrite(MemWrite),
        .clk(clk),
        .dataOut(dataOut)
    );

    // MemtoReg Modülü
    MemtoReg MTR(
        .rd(dataOut),
        .ALUResult(ALUResult),
        .memToReg(MemtoReg),
        .outputData(MemtoRegData)
    );

    // PCPlus1 Modülü
    PCPlus1 P1(
        .PC(pc),
        .PCPlus1(PCPlus1)
    );

    // PCPlus2 Modülü
    PCPlus2 P2(
        .PCPlus1(PCPlus1),
        .PCPlus2(PCPlus2)
    );
    
    // PCSrc Modülü
    PCSrc PCS(
        .MemtoRegResult(MemtoRegData),
        .PCPlus1(nextAddress),
        .PCSrc(PCSrc),
        .NextPC(NextPC)
    );
endmodule
