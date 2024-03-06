module MUX4(input logic [7:0] sum, sub, _and, _or, input logic [1:0] aluControl, output logic [7:0] mux4_output);
    
    //ALU Result için 4xMUX
    assign mux4_output = aluControl[1] ? 
           (aluControl[0] ? _or : _and):
           (aluControl[0] ? sub : sum);

endmodule