
`timescale 1ns/10ps
`include "mux4to1_nand.v"
module mux4to1_nand_tb;
reg [1:0] Sel;
reg 	  A;
reg 	  B;
reg 	  C;
reg		  D;
wire 	  Z;
mux4to1_nand mux1 (.Z(Z), .Sel(Sel), .A(A), .B(B), .C(C), .D(D));
initial begin
	$monitor($time, " Sel = %d, A = %d, B = %d, C = %d, D = %d, Z = %d", Sel, A, B, C, D, Z);
end
initial begin
	Sel = 2'b00; A = 0; B = 0; C = 0; D = 0;
#10			 	 A = 0; B = 0; C = 0; D = 1;
#10 	 	 	 A = 0; B = 0; C = 1; D = 0;
#10 	     	 A = 0; B = 0; C = 1; D = 1;
#10 	     	 A = 0; B = 1; C = 0; D = 0;
#10 	     	 A = 0; B = 1; C = 0; D = 1;
#10 	     	 A = 0; B = 1; C = 1; D = 0;
#10 	     	 A = 0; B = 1; C = 1; D = 1;
#10 	     	 A = 1; B = 0; C = 0; D = 0;
#10 	     	 A = 1; B = 0; C = 0; D = 1;
#10 	     	 A = 1; B = 0; C = 1; D = 0;
#10 	     	 A = 1; B = 0; C = 1; D = 1;
#10 	     	 A = 1; B = 1; C = 0; D = 0;
#10 	     	 A = 1; B = 1; C = 0; D = 1;
#10 	     	 A = 1; B = 1; C = 1; D = 0;
#10 	     	 A = 1; B = 1; C = 1; D = 1;
#10	Sel = 2'b01; A = 0; B = 0; C = 0; D = 0;
#10			 	 A = 0; B = 0; C = 0; D = 1;
#10 	 	 	 A = 0; B = 0; C = 1; D = 0;
#10 	     	 A = 0; B = 0; C = 1; D = 1;
#10 	     	 A = 0; B = 1; C = 0; D = 0;
#10 	     	 A = 0; B = 1; C = 0; D = 1;
#10 	     	 A = 0; B = 1; C = 1; D = 0;
#10 	     	 A = 0; B = 1; C = 1; D = 1;
#10 	     	 A = 1; B = 0; C = 0; D = 0;
#10 	     	 A = 1; B = 0; C = 0; D = 1;
#10 	     	 A = 1; B = 0; C = 1; D = 0;
#10 	     	 A = 1; B = 0; C = 1; D = 1;
#10 	     	 A = 1; B = 1; C = 0; D = 0;
#10 	     	 A = 1; B = 1; C = 0; D = 1;
#10 	     	 A = 1; B = 1; C = 1; D = 0;
#10 	     	 A = 1; B = 1; C = 1; D = 1;
#10	Sel = 2'b10; A = 0; B = 0; C = 0; D = 0;
#10			 	 A = 0; B = 0; C = 0; D = 1;
#10 	 	 	 A = 0; B = 0; C = 1; D = 0;
#10 	     	 A = 0; B = 0; C = 1; D = 1;
#10 	     	 A = 0; B = 1; C = 0; D = 0;
#10 	     	 A = 0; B = 1; C = 0; D = 1;
#10 	     	 A = 0; B = 1; C = 1; D = 0;
#10 	     	 A = 0; B = 1; C = 1; D = 1;
#10 	     	 A = 1; B = 0; C = 0; D = 0;
#10 	     	 A = 1; B = 0; C = 0; D = 1;
#10 	     	 A = 1; B = 0; C = 1; D = 0;
#10 	     	 A = 1; B = 0; C = 1; D = 1;
#10 	     	 A = 1; B = 1; C = 0; D = 0;
#10 	     	 A = 1; B = 1; C = 0; D = 1;
#10 	     	 A = 1; B = 1; C = 1; D = 0;
#10 	     	 A = 1; B = 1; C = 1; D = 1;
#10	Sel = 2'b11; A = 0; B = 0; C = 0; D = 0;
#10			 	 A = 0; B = 0; C = 0; D = 1;
#10 	 	 	 A = 0; B = 0; C = 1; D = 0;
#10 	     	 A = 0; B = 0; C = 1; D = 1;
#10 	     	 A = 0; B = 1; C = 0; D = 0;
#10 	     	 A = 0; B = 1; C = 0; D = 1;
#10 	     	 A = 0; B = 1; C = 1; D = 0;
#10 	     	 A = 0; B = 1; C = 1; D = 1;
#10 	     	 A = 1; B = 0; C = 0; D = 0;
#10 	     	 A = 1; B = 0; C = 0; D = 1;
#10 	     	 A = 1; B = 0; C = 1; D = 0;
#10 	     	 A = 1; B = 0; C = 1; D = 1;
#10 	     	 A = 1; B = 1; C = 0; D = 0;
#10 	     	 A = 1; B = 1; C = 0; D = 1;
#10 	     	 A = 1; B = 1; C = 1; D = 0;
#10 	     	 A = 1; B = 1; C = 1; D = 1;

#10 $finish;
end
initial begin
	`ifdef FSDB
	$fsdbDumpfile("mux4to1_nand.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("mux4to1_nand.vcd");
	$dumpvars;
	`endif
end
endmodule
