module PCPlus1 (
    input [7:0] PC, //Program Counter deðeri
    output reg [7:0] PCPlus1 // Program Counter deðerininin bir arttýrýlmýþ deðeri
);
    // PC deðerini bir arttýrma iþlemi
        n_bitFulladder FA(
            .a(PC), 
            .mux2_output(8'b00000001), 
            .cin(0), 
            .fadder_output(PCPlus1)
        );
endmodule