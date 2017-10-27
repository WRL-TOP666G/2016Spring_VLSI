`timescale 1ns/10ps
`include "BCD.v"

module BCD_tb ;

	reg    [3:0] A1,B1;// input  
	reg          Ci;
	wire   [3:0] Out_0;// outputs
	wire	        ov_flag;  
  
  // Instantiate module
	BCD m0( .A(A1) , .B(B1) , .Cb(ov_flag) , .S(Out_0),  .Ci(Ci) ) ;
  // Monitoring Input & Output port 
	initial $monitor( $time, "   A1=%d  , B1=%d , Out_0=%d  , ov_flag=%d ",A1,B1,Out_0,ov_flag) ;
                                                                                                                                 
	// Declare Input patterns
	initial begin

		#10   A1=4'b0101 ; B1=4'b1000 ;  Ci =0;
		#10   A1=4'b0011 ; B1=4'b0100 ;  Ci=0;
		#10   A1=4'b1001 ; B1=4'b1001 ;  Ci=0;
		#20 $finish ; 
	end
  
  // Generate the waveform file

	initial begin
	`ifdef FSDB
	$fsdbDumpfile("BCD.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("BCD.vcd");
	$dumpvars;
	`endif
end
endmodule
