//*************************************************
//** 2016 spring iVCAD                         
//** Author: Doris
//** Project: testbench of the simple system
//** Mar. 2014 Tim revised	
//** Mar. 2015 Jimmy revised
//** Mar. 2016 Yip revised 
//*************************************************
`timescale 1ns/10ps
`include "simplesystem.v"
`define PERIOD 20

// *** please modify parameter here by yourself ***
`define GOLDEN_OM "golden_outputmem.dat"
`define IM 		  "inputmemory.dat"
`define WAVEFORM  "simplesystem.fsdb"
// ************************************************

// please DO NOT modify the code below
module simplesystem_tb;
	reg 		   clk, rst;	
	wire		   Done;
	reg 	[5:0]  i;
	reg    	[31:0] exp_om [63:0];
	integer  	   om_err, om_cnt;
	
	simplesystem u1( clk, rst, Done);
	
	always
		#((`PERIOD)/2)	clk=~clk;
				
	initial	begin
		clk=0;rst=1;			
		#(`PERIOD)	rst=1;	
		#(`PERIOD)	rst=0;	
		//*** setup input memory ***//
		$readmemh(`IM,u1.imem1.input_mem);
	end
	
	
									
	//*** Generate Waveform *** //
	initial	begin
		$fsdbDumpfile(`WAVEFORM);
		$fsdbDumpvars();
	end

	//*** load reference data ***//
	initial $readmemh(`GOLDEN_OM,exp_om);
	
	//*** data comparing ***//
	initial begin
		om_err = 0;
		wait(Done);
		for (om_cnt=0; om_cnt<64; om_cnt=om_cnt+1) begin
			if (exp_om[om_cnt] == u1.omem1.output_mem[om_cnt]);
			else begin
				om_err = om_err + 1;
				$display(">>>>> ERROR AT%8t,  ERROR DATA : the data at output_memory address%2d = %8h, but the EXPECTED DATA is %8h",
				$realtime, om_cnt, u1.omem1.output_mem[om_cnt], exp_om[om_cnt]);
			end
		end
	end

	//*** result output ***//
	initial begin
		wait(Done);
		#1
		$display("--------------------------- simplesystem simulation FINISH !!---------------------------");
		if (om_err) begin 
     		$display("======================================================================================\n");
     		$display(" (T_T)  The simulation result of simplesystem is FAIL!!! Please debug your RTL code !!\n");
			$display("======================================================================================");
		end
		else begin 
     		$display("======================================================================================");
			$display("\n               \\(^o^)/  The simulation result of simplesystem is PASS!!!\n");
			$display("======================================================================================");
		end
		$finish;
	end

endmodule 


