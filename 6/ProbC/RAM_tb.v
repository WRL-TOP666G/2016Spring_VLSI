//*************************************************
//** 2016 spring iVCAD                          
//** Description: RAM_tb
//** Mar. 2014 Tim revised	
//** Mar. 2015 Jimmy revised
//** Mar. 2016 Yip revised  
//*************************************************


`timescale 1ns/10ps
`include "RAM.v"
module RAM_tb;
	reg	clk,rst,enable_read,enable_write;
	reg	[31:0]	DMin;
	reg	[5:0]		address;
	reg	[6:0]		i;
	wire  [31:0]	DMout;
	RAM ram1(	clk, rst, address, enable_read, 
						enable_write, DMin, DMout);
	initial clk=1'b0;                                                               
	always #10 clk=~clk;     
	
	initial begin
		enable_read=0; enable_write=0; address=6'd0;DMin=32'd0;rst=1;


		#20 enable_read=0 ; enable_write=0;rst=0;
		#20 enable_write=1; address=5'd0; 

		#20 enable_read=0; enable_write=1; address=6'd0;  DMin=32'h0000_0afc; 
		#20 		    		   address=6'd31; DMin=32'h0000_b031;
		#20 		    		   address=6'd4;  DMin=32'hf000_0005;
		#20 		    		   address=6'd7;  DMin=32'h0000_0246;
		#20 		   		   address=6'd9;  DMin=32'h0000_00a9;
		#20 		   		   address=6'd6;  DMin=32'h0000_006e;
		#20 		   		   address=6'd40; DMin=32'hffff_ffff;
		#20 		  		   address=6'd37; DMin=32'h0000_046a;
		#20 		    		   address=6'd63; DMin=32'h03c1_0dd3;



		#20 enable_read=1; enable_write=0; address=6'd2;
		#20				   address=6'd3;
 		#20 				   address=6'd57;
		#20 			           address=6'd11;
 		#20 			           address=6'd40;
 		#20  				   address=6'd19;
		#20  				   address=6'd63;
		#20  				   address=6'd31;

		#20 enable_read=0; enable_write=1; address=6'd3;  DMin=32'h0000_0ff5; 
		#20 		    		   address=6'd17; DMin=32'h00ed_2a24;

		#20 enable_read=1; enable_write=0; address=6'd3;

		#20 enable_read=0; enable_write=1; address=6'd19;  DMin=32'h0000_0123; 


		#20 enable_read=1; enable_write=0; address=6'd17;

		#20 enable_read=0; enable_write=1; address=6'd1;  DMin=32'h0000_0ccc; 	
		
		#20 enable_read=1; enable_write=0; address=6'd1;
		#20 				   address=6'd19;


		#20 for(i=0;i<64;i=i+1) 
				 $display($time, " RAM[%d]=%h, ",i, ram1.RAM_Data[i]);
		#40 $finish;
	end

initial begin
	`ifdef FSDB
	$fsdbDumpfile("RAM_tb.fsdb");
	$fsdbDumpvars;
	#800 $finish;
	`endif
	`ifdef VCD
	$dumpfile("RAM_tb.vcd");
	$dumpvars;
	#800 $finish;
	`endif
end
endmodule

