`timescale 1ns / 1ps

module Branch(
    input [7:0] ra, // �lk register de�eri
    input [7:0] rd, // �kinci register de�eri
    output reg equal // E�itlik durumunu belirten sinyal
);
    
always_comb begin
    // �ki de�er kar��la�t�r�l�r ve sonu� "equal" sinyaline atan�r
    if (ra == rd) begin
        equal = 1'b1; // E�er e�itse
    end else begin
        equal = 1'b0; // E�er e�it de�ilse
    end
end
endmodule
