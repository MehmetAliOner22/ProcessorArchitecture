`timescale 1ns / 1ps

module ALU (
    input [7:0] SrcA,     // ALU nun ilk giri� de�eri
    input reg [7:0] SrcB,   // ALU nun ikinci giri� de�eri
    input [1:0] ALUControl,     //ALU Control sinyalleri
    output reg Zero,    // Branch i�lem�nde kullanmak i�in zero de�eri
    output reg ALUResult    //ALU result de�eri
);

wire [7:0] add, sub, _and, _or;
wire [7:0] temp;

        //Add i�lemibegin
        n_bitFulladder ADD(
            .a(SrcA), .cin(0), .mux2_output(SrcB),
            .fadder_output(add)
        );
        
        //Sub i�lemi
        MUX2 M2(
            .d0(SrcB),
            .d1(~SrcB),
            .aluControl(ALUControl[0]),
            .mux2_output(temp)
        );
        
        n_bitFulladder SUB(
            .a(SrcA), .cin(0), .mux2_output(temp),
            .fadder_output(sub) 
        );   
        
        always_comb begin
            if (!sub) begin
                Zero <= 1;
        end else begin
                Zero <= 0;
            end
        end
        
        //OR i�lemi
        assign _and = SrcA & SrcB;
        
        //AND i�lemi
        assign _or = SrcA | SrcB;
        
        //Result se�me 
        MUX4 M4(
        .sum(add), .sub(sub), ._and(_and), ._or(_or),
        .aluControl(ALUControl),
        .mux4_output(ALUResult)
        );
endmodule

