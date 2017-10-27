/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.1.01  ---------------------- //
// ---------------------- Date : 2016.03.08 ---------------------- //
// ---------------------- ALU reference code  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

// ---------------------- define ---------------------- //
`define AddrSize   3
`define DataSize   32
`define RegSize    8
module regfile (clk,rst,enable,RegIndex,OutData,
		RegOutput0,
		RegOutput1,
		RegOutput2,
		RegOutput3,
		RegOutput4,
		RegOutput5,
		RegOutput6,
		RegOutput7);

// ---------------------- input  ---------------------- //
input 						clk;
input 						rst;
input 						enable;
input 	[`AddrSize-1:0]		RegIndex;
input   [`DataSize-1:0]		OutData;

// ---------------------- output ---------------------- //
output  [`DataSize-1:0]		RegOutput0;
output  [`DataSize-1:0]		RegOutput1;
output  [`DataSize-1:0]		RegOutput2;
output  [`DataSize-1:0]		RegOutput3;
output  [`DataSize-1:0]		RegOutput4;
output  [`DataSize-1:0]		RegOutput5;
output  [`DataSize-1:0]		RegOutput6;
output  [`DataSize-1:0]		RegOutput7;
	

// ----------------------  reg   ---------------------- //
reg  [`DataSize-1:0]		RegOutput0;
reg  [`DataSize-1:0]		RegOutput1;
reg  [`DataSize-1:0]		RegOutput2;
reg  [`DataSize-1:0]		RegOutput3;
reg  [`DataSize-1:0]		RegOutput4;
reg  [`DataSize-1:0]		RegOutput5;
reg  [`DataSize-1:0]		RegOutput6;
reg  [`DataSize-1:0]		RegOutput7;
reg  [`DataSize-1:0]		REG[`RegSize-1:0] ;


integer i;

always@(posedge clk)begin
	
	if(rst)begin
		for(i=0; i<`RegSize;i=i+1)
			REG[i] <=32'b0;
			RegOutput0 <=32'b0;
			RegOutput1 <=32'b0;
			RegOutput2 <=32'b0;
			RegOutput3 <=32'b0;
			RegOutput4 <=32'b0;
			RegOutput5 <=32'b0;
			RegOutput6 <=32'b0;
			RegOutput7 <=32'b0;
		end
	else begin
		if(enable)begin
			
				REG[RegIndex] <=OutData;
			

			end
		else begin
			RegOutput0 <=32'b0;
			RegOutput1 <=32'b0;
			RegOutput2 <=32'b0;
			RegOutput3 <=32'b0;
			RegOutput4 <=32'b0;
			RegOutput5 <=32'b0;
			RegOutput6 <=32'b0;
			RegOutput7 <=32'b0;
			end
		end
	 
		
	end
always@(*)begin
			RegOutput0 <=REG[0];
			RegOutput1 <=REG[1];
			RegOutput2 <=REG[2];
			RegOutput3 <=REG[3];
			RegOutput4 <=REG[4];
			RegOutput5 <=REG[5];
			RegOutput6 <=REG[6];
			RegOutput7 <=REG[7];


end




endmodule
