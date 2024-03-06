`timescale 1ns / 1ps

module ProgramCounterFunction(
    input logic clk,          // Saat sinyali
    input logic [7:0] nextAdress, // Sonraki talimatin adresi
    output logic [7:0] pc_out // Program sayacý çýkýþý
);

    // 8-bit geniþliðinde program sayacý
    logic [7:0] program_counter;

    // Her pozitif saat kenarýnda program sayacýný güncelleme iþlemi
    always_ff @(posedge clk) begin

         program_counter <= nextAdress; 
    end

    // Program sayacý çýkýþý
    assign pc_out = program_counter;

endmodule
