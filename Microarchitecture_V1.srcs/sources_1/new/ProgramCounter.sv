`timescale 1ns / 1ps

module ProgramCounterFunction(
    input logic clk,          // Saat sinyali
    input logic [7:0] nextAdress, // Sonraki talimatin adresi
    output logic [7:0] pc_out // Program sayac� ��k���
);

    // 8-bit geni�li�inde program sayac�
    logic [7:0] program_counter;

    // Her pozitif saat kenar�nda program sayac�n� g�ncelleme i�lemi
    always_ff @(posedge clk) begin

         program_counter <= nextAdress; 
    end

    // Program sayac� ��k���
    assign pc_out = program_counter;

endmodule
