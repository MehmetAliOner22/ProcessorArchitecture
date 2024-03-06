`timescale 1ns/1ps

module Microprocessor_tb;

  reg clk;
  reg reset;
  reg [7:0] instruction;
  wire [7:0] pc_out, ra_out, rb_out, rd_out, imm_out;
  wire [15:0] data_out;
  wire MemToReg, MemWrite, RegWrite, ALUSrc, Branch, Jump;

  // Instantiate the Microprocessor module
  Microprocessor uut(
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .pc_out(pc_out),
    .ra_out(ra_out),
    .rb_out(rb_out),
    .rd_out(rd_out),
    .imm_out(imm_out),
    .data_out(data_out),
    .MemToReg(MemToReg),
    .MemWrite(MemWrite),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .Branch(Branch),
    .Jump(Jump)
  );

  // Instantiate the other modules here (ALU, ALUSrc, ControlUnit, DataMemory, InstructionMemory, MUX2, MUX4, MemtoReg, PCPlus1, PCPlus2, PCSrc, ProgramCounterFunction, RegSrc0, RegSrc1, RegisterFile)

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    reset = 1;
    #10 reset = 0;
  end

  // Test case
  initial begin
    // Load your instructions into the instruction memory
    // For example, instruction[15:0] = 16'b0000000000000000;

    // Add more test cases as needed

    // Simulate for a period
    #1000 $finish;
  end

endmodule
