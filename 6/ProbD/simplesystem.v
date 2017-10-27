//*************************************************
//** 2016 spring iVCAD                          
//** Author: Doris
//** Description: simplesystem
//** Mar. 2014 Tim revised
//** Mar. 2015 Jimmy revised	
//** Mar. 2016 Yip revised  		
//*************************************************
`timescale 1ns/10ps
`define PERIOD 20
`include "controller.v"
`include "input_memory.v"
`include "output_memory.v"
`include "regfile.v"
`include "operation.v"

module simplesystem(clk,rst,Done);
	input 	clk,rst;
	output	Done;		
	wire	[5:0] 	AddrReading, AddrWriting;
	wire	[2:0] 	RegIndex;
	wire			EnableInputMEM, EnableReg;
	wire			EnableOperation, EnableOutputMEM;
	wire	[31:0]	OutData;
	wire	[31:0]	RegOutput0, RegOutput1, 
					RegOutput2, RegOutput3,
					RegOutput4, RegOutput5, 
					RegOutput6, RegOutput7;
	wire	[31:0]	outResult;                          
	


	controller con1(
	clk,
	rst,								 
	AddrReading,					
	AddrWriting,					
	RegIndex,
	EnableInputMEM,		
	EnableReg,							
	EnableOperation,	
	EnableOutputMEM,	
	Done											
		);
	


	input_memory imem1(clk, rst, EnableInputMEM, AddrReading, OutData);
			
  
					 
	regfile reg1(
		clk,rst,EnableReg,RegIndex,OutData,
		RegOutput0,
		RegOutput1,
		RegOutput2,
		RegOutput3,
		RegOutput4,
		RegOutput5,
		RegOutput6,
		RegOutput7
		);	

				
						
	operation op1( 
	clk,
	rst,
       EnableOperation,															
	RegOutput0,
	RegOutput1,
	RegOutput2,
	RegOutput3,
	RegOutput4,
	RegOutput5,
	RegOutput6,
	RegOutput7,
	outResult
		);


							
	output_memory omem1(clk, rst, EnableOutputMEM, AddrWriting, outResult); 

endmodule 



