`timescale 1ns / 1ps

module ALU_TestBench;

  // Giriþ ve Çýkýþlar
  reg [7:0] SrcA;
  reg [7:0] SrcB;
  reg [1:0] ALUControl;
  wire Zero;
  wire [7:0] ALUResult;

  // ALU modülünü çaðýr
  ALU UUT (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .Zero(Zero),
    .ALUResult(ALUResult)
  );

  // Test senaryosu oluþtur
  initial begin
    // Test 1: Add iþlemi
    SrcA = 8'b00000001;
    SrcB = 8'b00000010;
    ALUControl = 2'b00;
    #10;
    // Sonuç 8'b00000011 olmalý
    if (ALUResult !== 8'b00000011 || Zero !== 0) $display("Test 1 failed");

    // Test 2: Sub iþlemi
    SrcA = 8'b00000100;
    SrcB = 8'b00000010;
    ALUControl = 2'b01;
    #10;
    // Sonuç 8'b00000010 olmalý ve Zero 0 olmalý
    if (ALUResult !== 8'b00000010 || Zero !== 0) $display("Test 2 failed");

    // Test 3: OR iþlemi
    SrcA = 8'b00001100;
    SrcB = 8'b00000110;
    ALUControl = 2'b01;
    #10;
    // Sonuç 8'b00001110 olmalý ve Zero 0 olmalý
    if (ALUResult !== 8'b00001110 || Zero !== 0) $display("Test 3 failed");

    // Test 4: AND iþlemi
    SrcA = 8'b00101010;
    SrcB = 8'b00001100;
    ALUControl = 2'b00;
    #10;
    // Sonuç 8'b10001000 olmalý ve Zero 0 olmalý
    if (ALUResult !== 8'b10001000 || Zero !== 0) $display("Test 4 failed");

    // Diðer test senaryolarýný ekleyebilirsin
    // ...

    // Simülasyonu sonlandýr
    $finish;
  end

endmodule