`timescale 1ns / 1ps

module Branch(
    input [7:0] ra, // Ýlk register deðeri
    input [7:0] rd, // Ýkinci register deðeri
    output reg equal // Eþitlik durumunu belirten sinyal
);
    
always_comb begin
    // Ýki deðer karþýlaþtýrýlýr ve sonuç "equal" sinyaline atanýr
    if (ra == rd) begin
        equal = 1'b1; // Eðer eþitse
    end else begin
        equal = 1'b0; // Eðer eþit deðilse
    end
end
endmodule
