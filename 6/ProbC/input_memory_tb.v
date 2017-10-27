//*************************************************
//** 2016 spring IVCAD                          
//** Author: Doris                             
//** Description:  test 32bit x 32 Input Memory 
//** Mar. 2015 Jimmy revised
//** Mar. 2016 Yip revised  
//*************************************************
`timescale 1ns/10ps
`define PERIOD 20
`include "input_memory.v"
module input_memory_tb;    
reg clk;
reg rst;
reg enable;
reg  [4:0] ADDRInput;
wire [31:0] OutData;

input_memory u1(.clk(clk), .rst(rst), .enable(enable), 
				.ADDRInput(ADDRInput), .OutData(OutData));
always
	#((`PERIOD)/2)	clk=~clk;
	
initial begin
	clk = 0; rst=0; enable=0; ADDRInput=5'd0;
	#(`PERIOD) rst=1;
	#(`PERIOD*2) rst=0; enable=1;
	#(`PERIOD) $readmemh("inputmemory.dat",u1.input_mem);
	
	#(`PERIOD) ADDRInput=6'd0;
	#(`PERIOD) ADDRInput=6'd1;
	#(`PERIOD) ADDRInput=6'd2;
	#(`PERIOD) ADDRInput=6'd3;
	#(`PERIOD) ADDRInput=6'd4;
	#(`PERIOD) ADDRInput=6'd5;
	#(`PERIOD) ADDRInput=6'd6;
	#(`PERIOD) ADDRInput=6'd7;
	#(`PERIOD) ADDRInput=6'd8;
	#(`PERIOD) ADDRInput=6'd9;
	#(`PERIOD) ADDRInput=6'd10;
	#(`PERIOD) ADDRInput=6'd11;
	#(`PERIOD) ADDRInput=6'd12;
	#(`PERIOD) ADDRInput=6'd13;
	#(`PERIOD) ADDRInput=6'd14;
	#(`PERIOD) ADDRInput=6'd15;
	#(`PERIOD) ADDRInput=6'd16;
	#(`PERIOD) ADDRInput=6'd17;
	#(`PERIOD) ADDRInput=6'd18;
	#(`PERIOD) ADDRInput=6'd19;
	#(`PERIOD) ADDRInput=6'd20;
	#(`PERIOD) ADDRInput=6'd21;
	#(`PERIOD) ADDRInput=6'd22;
	#(`PERIOD) ADDRInput=6'd23;
	#(`PERIOD) ADDRInput=6'd24;
	#(`PERIOD) ADDRInput=6'd25;
	#(`PERIOD) ADDRInput=6'd26;
	#(`PERIOD) ADDRInput=6'd27;
	#(`PERIOD) ADDRInput=6'd28;
	#(`PERIOD) ADDRInput=6'd29;
	#(`PERIOD) ADDRInput=6'd30;
	#(`PERIOD) ADDRInput=6'd31;
	#(`PERIOD) ADDRInput=6'd32;
	#(`PERIOD) ADDRInput=6'd33;
	#(`PERIOD) ADDRInput=6'd34;
	#(`PERIOD) ADDRInput=6'd35;
	#(`PERIOD) ADDRInput=6'd36;
	#(`PERIOD) ADDRInput=6'd37;
	#(`PERIOD) ADDRInput=6'd38;
	#(`PERIOD) ADDRInput=6'd39;
	#(`PERIOD) ADDRInput=6'd40;
	#(`PERIOD) ADDRInput=6'd41;
	#(`PERIOD) ADDRInput=6'd42;
	#(`PERIOD) ADDRInput=6'd43;
	#(`PERIOD) ADDRInput=6'd44;
	#(`PERIOD) ADDRInput=6'd45;
	#(`PERIOD) ADDRInput=6'd46;
	#(`PERIOD) ADDRInput=6'd47;
	#(`PERIOD) ADDRInput=6'd48;
	#(`PERIOD) ADDRInput=6'd49;
	#(`PERIOD) ADDRInput=6'd50;
	#(`PERIOD) ADDRInput=6'd51;
	#(`PERIOD) ADDRInput=6'd52;
	#(`PERIOD) ADDRInput=6'd53;
	#(`PERIOD) ADDRInput=6'd54;
	#(`PERIOD) ADDRInput=6'd55;
	#(`PERIOD) ADDRInput=6'd56;
	#(`PERIOD) ADDRInput=6'd57;
	#(`PERIOD) ADDRInput=6'd58;
	#(`PERIOD) ADDRInput=6'd59;
	#(`PERIOD) ADDRInput=6'd60;
	#(`PERIOD) ADDRInput=6'd61;
	#(`PERIOD) ADDRInput=6'd62;
	#(`PERIOD) ADDRInput=6'd63;
	#(`PERIOD) $finish;


//
//please write your code here according to the assignment
//
    
end	

									
//*****  generate waveform *****//	


			


initial begin
	`ifdef FSDB
	$fsdbDumpfile("input_memory_tb.fsdb");
	$fsdbDumpvars;
	#1400 $finish;
	`endif
	`ifdef VCD
	$dumpfile("input_memory_tb.vcd");
	$dumpvars;
	#1400 $finish;
	`endif
end
endmodule


