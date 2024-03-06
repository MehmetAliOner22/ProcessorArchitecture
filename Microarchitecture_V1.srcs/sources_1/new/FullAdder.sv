module FullAdder(input logic a, b, cin, output logic fadder_output, cout);
 
     assign fadder_output = a^b^cin;
     assign cout = a&b | b&cin | cin&a; 

endmodule