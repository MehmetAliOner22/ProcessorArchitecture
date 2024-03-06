module PCPlus1 (
    input [7:0] PC, //Program Counter de�eri
    output reg [7:0] PCPlus1 // Program Counter de�erininin bir artt�r�lm�� de�eri
);
    // PC de�erini bir artt�rma i�lemi
        n_bitFulladder FA(
            .a(PC), 
            .mux2_output(8'b00000001), 
            .cin(0), 
            .fadder_output(PCPlus1)
        );
endmodule