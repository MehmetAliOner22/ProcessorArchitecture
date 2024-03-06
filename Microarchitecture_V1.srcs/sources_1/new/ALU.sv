`timescale 1ns / 1ps

module ALU (
    input [7:0] SrcA,     // ALU nun ilk giriþ deðeri
    input reg [7:0] SrcB,   // ALU nun ikinci giriþ deðeri
    input [1:0] ALUControl,     //ALU Control sinyalleri
    output reg Zero,    // Branch iþlemþnde kullanmak için zero deðeri
    output reg ALUResult    //ALU result deðeri
);

wire [7:0] add, sub, _and, _or;
wire [7:0] temp;

        //Add iþlemibegin
        n_bitFulladder ADD(
            .a(SrcA), .cin(0), .mux2_output(SrcB),
            .fadder_output(add)
        );
        
        //Sub iþlemi
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
        
        //OR iþlemi
        assign _and = SrcA & SrcB;
        
        //AND iþlemi
        assign _or = SrcA | SrcB;
        
        //Result seçme 
        MUX4 M4(
        .sum(add), .sub(sub), ._and(_and), ._or(_or),
        .aluControl(ALUControl),
        .mux4_output(ALUResult)
        );
endmodule

