module TestBench_V1;
  // Giriþ ve Çýkýþlar
  reg clk;
  reg [7:0] pc;

  // MainModule'ü çaðýr
  MainModule UUT (
    .clk(clk),
    .pc(pc)
  );

  // Clock sinyali oluþtur
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test senaryosu oluþtur
  initial #1 begin  // <-- 1 zaman birimi gecikme
  
    // Simülasyon süresi boyunca devam et
    #1000;

    pc = 8'b00000000; // baþlangýç adresi

    // Simülasyonu sonlandýr
    $finish;
  end

endmodule

