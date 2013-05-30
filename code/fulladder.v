// 以下為全加器模組的定義
module fulladder (input a, b, c_in, output sum, c_out);
wire s1, c1, c2;

xor g1(s1, a, b);
xor g2(sum, s1, c_in);
and g3(c1, a,b);
and g4(c2, s1, c_in) ;
or g5(c_out, c2, c1) ;

endmodule

// 以下為測試程式
module main;
reg a, b, c_in;
wire sum, c_out;

fulladder fa1(a, b, c_in, sum, c_out);

initial begin
  a = 0;  b = 0;  c_in = 0;
  $monitor("%04dns monitor: a=%d b=%d c_in=%d c_out=%d sum=%d", $stime, a, b, c_in, c_out, sum);
  #1000 $finish;
end

always #50 c_in = c_in+1;

always #100 b = b+1;

always #200 a = a+1;

endmodule
