`timescale 1ns/10ps
`include "BCD_Adder.v"

module BCD_Adder_tb ;

	reg    [3:0] A1,A2,B1,B2;// input  
	wire   [6:0] Out_0,Out_1;// outputs
	wire	        ov_flag;  
  
  // Instantiate module
	BCD_Adder m0( .A1(A1) , .B1(B1), .A2(A2) , .B2(B2), .Out_0(Out_0), .Out_1(Out_1), .ov_flag(ov_flag) ) ;
  // Monitoring Input & Output port 
	initial $monitor( $time, " A2=%d  , A1=%d , B2=%d , B1=%d , Out_0=%b , Out_1=%b , ov_flag=%b ",A2,A1,B2,B1,Out_0,Out_1,ov_flag) ;
                                                                                                                                 
	// Declare Input patterns
	initial begin

		#10 A2=4'b0000  ;A1=4'b0101 ;B2=4'b0000  ; B1=4'b1000 ;  
		#10 A2=4'b0001  ;A1=4'b0011 ;B2=4'b0010  ; B1=4'b0100 ;  
		#10 A2=4'b0101  ;A1=4'b0001 ;B2=4'b0000  ; B1=4'b1001 ; 
		#10 A2=4'b1001  ;A1=4'b1001 ;B2=4'b1001  ; B1=4'b1001 ; 
		#20 $finish ; 
	end
  
  // Generate the waveform file

	initial begin
	`ifdef FSDB
	$fsdbDumpfile("BCD_Adder.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("BCD_Adder.vcd");
	$dumpvars;
	`endif
end
endmodule
