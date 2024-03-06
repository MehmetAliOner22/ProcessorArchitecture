module PCPlus2 (
    input [7:0] PCPlus1, // PCPlus1 deðeri
    output reg [7:0] PCPlus2 // PCPlus2 result deðeri
);
    // PCPlus1 deðerini bir arttýrma iþlemi
    n_bitFulladder FA(
            .a(PCPlus1), 
            .mux2_output(8'b00000001), 
            .cin(0), 
            .fadder_output(PCPlus1)
        );
endmodule
