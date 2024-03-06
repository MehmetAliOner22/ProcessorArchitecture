module n_bitFulladder( input logic [7:0] a, mux2_output, input logic cin, output logic [7:0] fadder_output, output logic cout );

    wire [6:0] c;

    FullAdder i_0 (a[0],mux2_output[0],cin,fadder_output[0],c[0]);
    FullAdder i_1 (a[1],mux2_output[1],c[0],fadder_output[1],c[1]);
    FullAdder i_2 (a[2],mux2_output[2],c[1],fadder_output[2],c[2]);
    FullAdder i_3 (a[3],mux2_output[3],c[2],fadder_output[3],c[3]);
    FullAdder i_4 (a[4],mux2_output[4],c[3],fadder_output[4],c[4]);
    FullAdder i_5 (a[5],mux2_output[5],c[4],fadder_output[5],c[5]);
    FullAdder i_6 (a[6],mux2_output[6],c[5],fadder_output[6],c[6]);
    FullAdder i_7 (a[7],mux2_output[7],c[6],fadder_output[7],cout);

endmodule
