//*************************************************
//** 2016  spring iVCAD                          
//** Author: Doris                             
//** Description:  test 31bit x 32 Input Memory 
//** Mar. 2014 Tim revised
//** Mar. 2015 Jimmy revised
//** Mar. 2016 Yip revised 
//*************************************************
`timescale 1ns/10ps
`define PERIOD 20
`include "output_memory.v"
module output_memory_tb;

reg clk;
reg rst;
reg enable;
reg [5:0] ADDR;
reg [31:0] writeData;
reg [6:0] i;

output_memory u_outmemory (.clk(clk), .rst(rst), .enable(enable),
						   .Addr(ADDR), .writeData(writeData));

always
	#((`PERIOD)/2)	clk=~clk;
	
initial begin
	clk = 0; rst=0; enable=0; ADDR=6'd0;
	#(`PERIOD) rst=1;
	#(`PERIOD) rst=0;
	#(`PERIOD) enable=1; writeData=32'd0;
	#(`PERIOD) enable=1; writeData=32'd1 ; ADDR=6'd1 ;
	#(`PERIOD)	     writeData=32'd21; ADDR=6'd21;
	#(`PERIOD)	     writeData=32'd30; ADDR=6'd30;
	#(`PERIOD)	     writeData=32'd12; ADDR=6'd42;
	#(`PERIOD)	     writeData=32'd17; ADDR=6'd17;
	#(`PERIOD)	     writeData=32'd31; ADDR=6'd31;
	#(`PERIOD)	     writeData=32'd2 ; ADDR=6'd2 ;
	#(`PERIOD)	     writeData=32'd5 ; ADDR=6'd55;
	#(`PERIOD)	     writeData=32'd20; ADDR=6'd20;



	#(`PERIOD) enable=0; writeData=32'd4 ; ADDR=6'd4 ;
	#(`PERIOD) 	     writeData=32'd15; ADDR=6'd45;
	#(`PERIOD) 	     writeData=32'd29; ADDR=6'd29;
	#(`PERIOD) 	     writeData=32'd16; ADDR=6'd16;


	#(`PERIOD) enable=1; writeData=32'd3 ; ADDR=6'd3 ;
	#(`PERIOD) 	     writeData=32'd6 ; ADDR=6'd6 ;
	#(`PERIOD) 	     writeData=32'd31; ADDR=6'd31;
	#(`PERIOD) 	     writeData=32'd12; ADDR=6'd12;




//
//please write your code here according to the assignment
//
   
	#(`PERIOD) for(i=0;i<64;i=i+1) 
	$display($time, " output_memory[%d]=%d, ",i, u_outmemory.output_mem[i]);
end	
									
//*****  generate waveform *****//				
initial
begin
	$dumpfile("output_memory_tb.vcd");
	$dumpvars();
	
end
initial begin
	`ifdef FSDB
	$fsdbDumpfile("output_memory_tb.fsdb");
	$fsdbDumpvars;
	#500 $finish;
	`endif
	`ifdef VCD
	$dumpfile("output_memory_tb.vcd");
	$dumpvars;
	#500 $finish;
	`endif
end

endmodule

