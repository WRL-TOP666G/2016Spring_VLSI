/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.1.01  ---------------------- //
// ---------------------- Date : 2016.03.08 ---------------------- //
// ---------------------- ALU reference code  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "regfile.v"
`include "ALU.v"

// ---------------------- define ---------------------- //
`define AddrSize   6
`define DataSize   32
`define ALUopSize  4
`define RegSize	64

module subsystem (clk,rst,reg_enable,reg_write,src1_addr,src2_addr,write_addr,write_data,alu_enable,alu_op,write_sel,alu_overflow);

// ---------------------- input  ---------------------- //
input 						clk;
input 						rst;
input 						reg_enable;
input 						reg_write;
input 	[`AddrSize-1:0]		src1_addr;
input 	[`AddrSize-1:0]		src2_addr;
input 	[`AddrSize-1:0]		write_addr;
input 	            		write_sel;
input   [`DataSize-1:0]		write_data;
input 	            		alu_enable;
input 	[`ALUopSize-1:0] 	alu_op;
// ---------------------- output ---------------------- //
output                      alu_overflow;
// ----------------------  reg   ---------------------- //
wire		[`DataSize-1:0]		src1;
wire		[`DataSize-1:0]		src2;	
wire		[`DataSize-1:0]		alu_out;
reg     [`DataSize-1:0]	    write_data_1;

always@(negedge clk)begin
		if(write_sel)
			write_data_1=alu_out;
		else
			write_data_1=write_data;
		
	end





		regfile RF(clk,rst,reg_enable,reg_write,src1_addr,src2_addr,write_addr,write_data_1,src1,src2);
		ALU  ALU(alu_enable, alu_op, src1, src2, alu_out, alu_overflow);
	
	
endmodule
