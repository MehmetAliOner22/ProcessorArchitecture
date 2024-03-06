module MUX2(input logic [7:0] d0, d1, input logic aluControl, output logic [7:0] mux2_output);
    
    //ALU içerisinde SUB iþlemi için 2xMUX
    assign mux2_output = aluControl ? d1 : d0;

endmodule