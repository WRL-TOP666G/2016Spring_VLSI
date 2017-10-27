`timescale 1ns/10ps
//`include "test1.v"
`include "test2.v"

module test_tb;

reg in1 , in2 , in3;
//wire out1 , out2;
wire out1 , out2, out3;

//test1 t0(.out1(out1), .out2(out2), .in1(in1), .in2(in2));
test2 t0(.out1(out1), .out2(out2), .out3(out3), .in1(in1), .in2(in2), .in3(in3));
//initial $monitor($time,"in1=%d , in2=%d , out1=%d , out2=%d ",in1,in2,out1,out2);
initial $monitor($time,"in1=%d , in2=%d , in3=%d , out1=%d , out2=%d, out3=%d",in1,in2,in3,out1,out2,out3);
	
initial
begin
       in1 = 0; in2 = 1; in3 = 0;
  
  #10  in1 = 1; in2 = 1; in3 = 0;
  #10  in1 = 0; in2 = 0; in3 = 0;
  #10  in1 = 1; in2 = 0; in3 = 0;
  #10  in1 = 1; in2 = 1; in3 = 1;
  #20  $finish;
end
		
initial
begin
	$dumpfile("test.vcd");
	$dumpvars;
end
	
endmodule
