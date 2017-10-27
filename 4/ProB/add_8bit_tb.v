`timescale 1ns/10ps
`include "add_8bit.v"

module add_8bit_tb ;

	reg  [7:0] A,B;                // input
	reg	     addsub ;
	wire [7:0] S;     // outputs
	wire	   cout,ov_flag ;
  
  // Instantiate module
	add_8bit m0(  .S(S) , .cout(cout) , .A(A) , .B(B) , .addsub(addsub) , .ov_flag(ov_flag) ) ;       

  // Monitoring Input & Output port 
	initial $monitor( $time, " A=%d , B=%d , addsub=%d , S=%d , cout=%d , ov_flag=%d " ,A,B,addsub,S,cout,ov_flag,  ) ;

	// Declare Input patterns
	initial begin

		#10 A=8'b00000010 ; B=8'b00000001 ; addsub=0;
		#10 A=8'b00000111 ; B=8'b00000011 ; addsub=0;
		#10 A=8'b00000111 ; B=8'b01111101 ; addsub=0;
		#10 A=8'b00010110 ; B=8'b00001010 ; addsub=1;
		#10 A=8'b00010110 ; B=8'b10000011 ; addsub=1;
		#10 A=8'b00010110 ; B=8'b00011010 ; addsub=1;
		#20 $finish ; 
	end
  
  // Generate the waveform file

	initial begin
	`ifdef FSDB
	$fsdbDumpfile("add_8bit.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("add_8bit.vcd");
	$dumpvars;
	`endif
end
endmodule
