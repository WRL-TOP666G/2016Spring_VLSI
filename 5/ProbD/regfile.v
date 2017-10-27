/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.1.01  ---------------------- //
// ---------------------- Date : 2016.03.08 ---------------------- //
// ---------------------- ALU reference code  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

// ---------------------- define ---------------------- //
`define AddrSize   6
`define DataSize   32
`define RegSize    64
module regfile (clk,rst,reg_enable,reg_write,src1_addr,
				src2_addr,write_addr,write_data,src1,src2);

// ---------------------- input  ---------------------- //
input 						clk;
input 						rst;
input 						reg_enable;
input 						reg_write;
input 	[`AddrSize-1:0]		src1_addr;
input 	[`AddrSize-1:0]		src2_addr;
input 	[`AddrSize-1:0]		write_addr;
input   [`DataSize-1:0]		write_data;

// ---------------------- output ---------------------- //
output  [`DataSize-1:0]		src1;
output 	[`DataSize-1:0]		src2;		

// ----------------------  reg   ---------------------- //
reg		[`DataSize-1:0]		src1;
reg		[`DataSize-1:0]		src2;	
reg		[`DataSize-1:0]		REG[`RegSize-1:0] ;


integer i;

always@(posedge clk)begin
	
	if(rst)begin
		for(i=0; i<`RegSize;i=i+1)
			REG[i] <=32'b0;
		src1 <=32'b0;
		src2 <=32'b0;
		end
	else begin
		if(reg_enable)begin
			if(reg_write)
				REG[write_addr] <=write_data;
			else begin
				src1 <=REG[src1_addr];
				src2 <=REG[src2_addr];
				end
			end
		else begin
			src1 <=32'b0;
			src2 <=32'b0;
			end
		end
	 
		
	end
endmodule
