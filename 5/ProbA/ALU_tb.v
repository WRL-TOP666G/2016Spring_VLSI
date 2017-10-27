/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.2.02  ---------------------- //
// ---------------------- Date : 2016.03.21 ---------------------- //
// ---------------------- Register File tb  ---------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`include "ALU.v"

// ---------------------- define ---------------------- //
`define DataSize	32
`define RegSize		64
`define AddrSize	6
`define clkPeriod	10

module ALU_tb;
				
// ----------------------   reg  ---------------------- //
reg					alu_enable;
reg		[`ALUopSize-1:0] 	alu_op;
reg		[`DataSize-1:0] 	src1;
reg 		[`DataSize-1:0] 	src2;


// ----------------------  wire  ---------------------- //
wire	[`DataSize-1:0] 	alu_out;
wire				alu_overflow;





ALU alu (.alu_enable(alu_enable), .alu_op(alu_op), .src1(src1),
		 .src2(src2), .alu_out(alu_out), .alu_overflow(alu_overflow) );
			
			



//clock generator


initial begin
	alu_enable=1;
#10	alu_op=4'b1000 ; src1=32'h0f0f_0f0f ; src2=32'h0000_0000 ; 
#10	alu_op=4'b1001 ; src1=32'haf3c_ff00 ; src2=32'h50c3_ff00 ;
#10	alu_op=4'b1010 ; src1=32'h8000_1234 ; src2=32'h0fff_0111 ;
#10	alu_op=4'b1011 ; src1=32'h0fff_0111 ; src2=32'h8000_1234 ;
#10	alu_op=4'b1100 ; src1=32'hffff_ffff ; src2=32'h0000_0000 ;
#10	alu_op=4'b1101 ; src1=32'h8000_1234 ; src2=32'h0fff_0111 ;
#10	alu_op=4'b1110 ; src1=32'hff00_00ff ; src2=32'h0000_0002 ;
#10	alu_op=4'b1111 ; src1=32'hff00_00ff ; src2=32'h0000_0002 ;
//-------You should type the rest of the test patterns here-------//

#130 $finish;
end

initial begin
	`ifdef FSDB
	$fsdbDumpfile("ALU.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("ALU.vcd");
	$dumpvars;
	`endif
end
endmodule
