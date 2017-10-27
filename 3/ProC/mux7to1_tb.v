/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.1.01  ---------------------- //
// ---------------------- Date : 2016.03.03 ---------------------- //
// ---------------------- 7to1 multiplexer tb -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

//include mux7to1 version1
`ifdef v1
	`include "mux7to1_v1.v"
`endif

`ifdef v2
	`include "mux7to1_v2.v"
`endif

`ifdef v3
	`include "mux7to1_v3.v"
`endif



module mux7to1_tb;
reg [2:0] Sel;
reg 	  A;
reg 	  B;
reg 	  C;
reg		  D;
reg		  E;
reg		  F;
reg		  G;
wire 	 Z;

mux7to1 mux ( .Z(Z), .Sel(Sel), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G) );

//monitor your result
initial begin
	$monitor($time, " Sel = %d, A = %d, B = %d, C = %d, D = %d, E = %d, F = %d, G = %d, Z = %d", Sel, A, B, C, D, E, F, G, Z);
end

//signal
initial begin
//you should implement this part by yourself (Appendix A)
//do not forget $finish !!!
    Sel = 3'b000; A = 0; B = 1; C = 1; D = 1; E = 0; F = 0; G = 1;
#10			 	         A = 0; B = 0; C = 1; D = 0; E = 1; F = 1; G = 0;
#10 	 	 	        A = 1; B = 0; C = 0; D = 0; E = 1; F = 1; G = 0;
#10 	     	      A = 1; B = 1; C = 1; D = 1; E = 1; F = 0; G = 0;
#10	Sel = 3'b001; A = 1; B = 0; C = 1; D = 0; E = 0; F = 0; G = 1;
#10			 	         A = 1; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0;
#10 	 	 	        A = 0; B = 1; C = 0; D = 1; E = 1; F = 1; G = 0;
#10 	     	      A = 1; B = 1; C = 1; D = 0; E = 0; F = 1; G = 0;
#10	Sel = 3'b010; A = 1; B = 0; C = 0; D = 0; E = 1; F = 0; G = 1;
#10			 	         A = 0; B = 0; C = 0; D = 0; E = 1; F = 1; G = 1;
#10 	 	 	        A = 0; B = 1; C = 1; D = 0; E = 0; F = 1; G = 0;
#10 	     	      A = 1; B = 0; C = 1; D = 0; E = 1; F = 0; G = 1;
#10	Sel = 3'b011; A = 1; B = 0; C = 0; D = 0; E = 1; F = 0; G = 1;
#10			 	         A = 1; B = 1; C = 1; D = 0; E = 1; F = 1; G = 1;
#10 	 	 	        A = 1; B = 0; C = 1; D = 1; E = 0; F = 1; G = 1;
#10 	     	      A = 0; B = 0; C = 1; D = 1; E = 1; F = 1; G = 1;
#10 Sel = 3'b100; A = 1; B = 0; C = 0; D = 0; E = 0; F = 1; G = 1;
#10			 	         A = 1; B = 1; C = 0; D = 0; E = 0; F = 0; G = 1;
#10 	 	 	        A = 1; B = 1; C = 1; D = 1; E = 1; F = 0; G = 0;
#10 	     	      A = 0; B = 0; C = 0; D = 0; E = 1; F = 1; G = 1;
#10 Sel = 3'b101; A = 1; B = 0; C = 0; D = 1; E = 1; F = 0; G = 1;
#10			 	         A = 1; B = 0; C = 1; D = 1; E = 0; F = 0; G = 0;
#10 	 	 	        A = 0; B = 1; C = 1; D = 0; E = 0; F = 1; G = 0;
#10 	     	      A = 0; B = 1; C = 0; D = 1; E = 1; F = 1; G = 1;
#10 Sel = 3'b110; A = 1; B = 0; C = 0; D = 1; E = 1; F = 0; G = 0;
#10			 	         A = 0; B = 1; C = 0; D = 1; E = 0; F = 1; G = 0;
#10 	 	 	        A = 0; B = 1; C = 0; D = 0; E = 0; F = 1; G = 1;
#10 	     	      A = 0; B = 0; C = 1; D = 1; E = 1; F = 0; G = 1;

#10 $finish;




end

//dump waveform
initial begin
	`ifdef FSDB
	$fsdbDumpfile("mux7to1.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("mux7to1.vcd");
	$dumpvars;
	`endif
end
endmodule
