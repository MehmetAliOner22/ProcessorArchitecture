module TestBench_V1;
  // Giri� ve ��k��lar
  reg clk;
  reg [7:0] pc;

  // MainModule'� �a��r
  MainModule UUT (
    .clk(clk),
    .pc(pc)
  );

  // Clock sinyali olu�tur
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test senaryosu olu�tur
  initial #1 begin  // <-- 1 zaman birimi gecikme
  
    // Sim�lasyon s�resi boyunca devam et
    #1000;

    pc = 8'b00000000; // ba�lang�� adresi

    // Sim�lasyonu sonland�r
    $finish;
  end

endmodule

