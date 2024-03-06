`timescale 1ns / 1ps

module ALU_TestBench;

  // Giri� ve ��k��lar
  reg [7:0] SrcA;
  reg [7:0] SrcB;
  reg [1:0] ALUControl;
  wire Zero;
  wire [7:0] ALUResult;

  // ALU mod�l�n� �a��r
  ALU UUT (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .Zero(Zero),
    .ALUResult(ALUResult)
  );

  // Test senaryosu olu�tur
  initial begin
    // Test 1: Add i�lemi
    SrcA = 8'b00000001;
    SrcB = 8'b00000010;
    ALUControl = 2'b00;
    #10;
    // Sonu� 8'b00000011 olmal�
    if (ALUResult !== 8'b00000011 || Zero !== 0) $display("Test 1 failed");

    // Test 2: Sub i�lemi
    SrcA = 8'b00000100;
    SrcB = 8'b00000010;
    ALUControl = 2'b01;
    #10;
    // Sonu� 8'b00000010 olmal� ve Zero 0 olmal�
    if (ALUResult !== 8'b00000010 || Zero !== 0) $display("Test 2 failed");

    // Test 3: OR i�lemi
    SrcA = 8'b00001100;
    SrcB = 8'b00000110;
    ALUControl = 2'b01;
    #10;
    // Sonu� 8'b00001110 olmal� ve Zero 0 olmal�
    if (ALUResult !== 8'b00001110 || Zero !== 0) $display("Test 3 failed");

    // Test 4: AND i�lemi
    SrcA = 8'b00101010;
    SrcB = 8'b00001100;
    ALUControl = 2'b00;
    #10;
    // Sonu� 8'b10001000 olmal� ve Zero 0 olmal�
    if (ALUResult !== 8'b10001000 || Zero !== 0) $display("Test 4 failed");

    // Di�er test senaryolar�n� ekleyebilirsin
    // ...

    // Sim�lasyonu sonland�r
    $finish;
  end

endmodule