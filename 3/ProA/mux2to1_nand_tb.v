/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.1.01  ---------------------- //
// ---------------------- Date : 2016.02.24 ---------------------- //
// ---------------------- 2to1 multiplexer tb -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "mux2to1_nand.v"
module mux2to1_nand_tb;
reg Sel;
reg A;
reg B;
wire Z;
mux2to1 mux1 (.Z(Z), .Sel(Sel), .A(A), .B(B));
initial begin
	$monitor($time, " Sel = %d, A = %d, B = %d, Z = %d", Sel, A, B, Z);
end
initial begin
	Sel = 0; A = 0; B = 0;
#10		 A = 0; B = 1;
#10 	 	 A = 1; B = 0;
#10 	     	 A = 1; B = 1;
#10     Sel = 1; A = 0; B = 0;
#10		 A = 0; B = 1;
#10 	     	 A = 1; B = 0;
#10 	     	 A = 1; B = 1;
#10 $finish;
end
initial begin
	`ifdef FSDB
	$fsdbDumpfile("mux2to1_nand.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("mux2to1_nand.vcd");
	$dumpvars;
	`endif
end
endmodule
