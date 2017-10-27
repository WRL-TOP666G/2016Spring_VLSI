/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.2.02  ---------------------- //
// ---------------------- Date : 2016.03.21 ---------------------- //
// ---------------------- Register File tb  ---------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`include "regfile.v"

// ---------------------- define ---------------------- //
`define DataSize	32
`define AddrSize	6
`define clkPeriod	10

module regfile_tb;
				
// ----------------------   reg  ---------------------- //
reg							clk;
reg							rst;
reg							reg_enable;
reg 						reg_write;
reg		[`AddrSize-1:0]		src1_addr;
reg		[`AddrSize-1:0]		src2_addr;
reg		[`AddrSize-1:0]		write_addr;
reg		[`DataSize-1:0]		write_data;

// ----------------------  wire  ---------------------- //
wire	[`DataSize-1:0]		src1;
wire	[`DataSize-1:0]		src2;

integer i;

regfile RF (.clk(clk), .rst(rst), .reg_enable(reg_enable), .reg_write(reg_write),
			.src1_addr(src1_addr), .src2_addr(src2_addr), .write_addr(write_addr),
			.write_data(write_data), .src1(src1), .src2(src2));

//monitor
initial begin
	#350
	$display("-----------------------register file---------------------------");
  	for(i=0;i<`RegSize;i=i+1)begin
  		$display("REG[%d] = %d  ",i,RF.REG[i]);
		end
	
end

//clock generator
always #(`clkPeriod/2) clk = ~clk;

initial begin
	clk = 0; rst = 1; reg_enable = 0; reg_write = 0; write_addr = 6'd0;  write_data = 32'd0;src1_addr = 6'd0 ;  src2_addr = 6'd0 ;
#10	rst = 0;src1_addr = 6'd0 ;  src2_addr = 6'd0 ;
#6      reg_enable = 1; reg_write = 1; write_addr = 6'd0 ;  write_data = 32'hffff_0000;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[0]	=32'hffff_0000
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd12;  write_data = 32'hffff_0001;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[12]	=32'hffff_0001
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd25;  write_data = 32'hffff_0002;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[25]	=32'hffff_0002
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd32;  write_data = 32'hffff_0003;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[32]	=32'hffff_0003
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd41;  write_data = 32'hffff_0004;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[41]	=32'hffff_0004
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd51;  write_data = 32'hffff_0005;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[51]	=32'hffff_0005
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd56;  write_data = 32'hffff_0006;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[56]	=32'hffff_0006
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd60;  write_data = 32'hffff_0007;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[60]	=32'hffff_0007
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd62;  write_data = 32'hffff_0008;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[62]	=32'hffff_0008
#10	reg_enable = 1; reg_write = 1; write_addr = 6'd63;  write_data = 32'hffff_0009;  src1_addr = 6'd0 ;  src2_addr = 6'd0 ; // REG[63]	=32'hffff_0009
#10	reg_enable = 1; reg_write = 0; src1_addr = 6'd0 ;  src2_addr = 6'd51;      
#10	reg_enable = 1; reg_write = 0; src1_addr = 6'd12;  src2_addr = 6'd56;
#10	reg_enable = 1; reg_write = 0; src1_addr = 6'd25;  src2_addr = 6'd60;
#10	reg_enable = 1; reg_write = 0; src1_addr = 6'd32;  src2_addr = 6'd62;
#10	reg_enable = 1; reg_write = 0; src1_addr = 6'd41;  src2_addr = 6'd63;
//-------You should type the rest of the test patterns here-------//

#200 $finish;
end

initial begin
	`ifdef FSDB
	$fsdbDumpfile("regfile.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("regfile.vcd");
	$dumpvars;
	`endif
end
endmodule
