/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.2.02  ---------------------- //
// ---------------------- Date : 2016.03.21 ---------------------- //
// ---------------------- Register File tb  ---------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`include "regfile_sipo.v"

// ---------------------- define ---------------------- //
`define DataSize	32
`define AddrSize	7
`define clkPeriod	10

module regfile_sipo_tb;
				
// ----------------------   reg  ---------------------- //
reg							clk;
reg							rst;
reg							reg_enable;
reg 						reg_write;
reg		[`AddrSize-1:0]		src_addr;
reg		[`AddrSize-1:0]		write_addr;
reg		[`DataSize-1:0]		write_data;

// ----------------------  wire  ---------------------- //
wire	[`DataSize-1:0]		src1;
wire	[`DataSize-1:0]		src2;
wire	[`DataSize-1:0]		src3;
wire	[`DataSize-1:0]		src4;
wire	[`DataSize-1:0]		src5;


integer i;

regfile_sipo RF_SIPO (.clk(clk), .rst(rst), .reg_enable(reg_enable), .reg_write(reg_write),
			.src_addr(src_addr), .write_addr(write_addr),
			.write_data(write_data), .src1(src1), .src2(src2), .src3(src3), .src4(src4), .src5(src5));

//monitor
initial begin
	#350
	$display("-----------------------register file---------------------------");
  	for(i=0;i<`RegSize;i=i+1)begin
  		$display("REG[%d] = %d  ",i,RF_SIPO.REG[i]);
		end
	
end

//clock generator
always #(`clkPeriod/2) clk = ~clk;

initial begin
	clk = 0; rst = 1; reg_enable = 0; reg_write = 0; write_addr = 7'd0;  write_data = 32'd0;  		    src_addr = 7'd0   ; 
#10			 rst = 0;                                                                        		    src_addr = 7'd0   ; 
#6                   reg_enable = 1; reg_write = 1; write_addr = 7'd0  ;  write_data = 32'hffff_0000;  src_addr = 7'd0   ;  
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd1  ;  write_data = 32'hffff_0001;  
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd2  ;  write_data = 32'hffff_0002;   
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd3  ;  write_data = 32'hffff_0003;   
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd4  ;  write_data = 32'hffff_0004;    
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd120;  write_data = 32'hffff_0000;    
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd121;  write_data = 32'hffff_0001;   
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd122;  write_data = 32'hffff_0002;    
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd123;  write_data = 32'hffff_0003;   
#10					  reg_enable = 1; reg_write = 1; write_addr = 7'd124;  write_data = 32'hffff_0004;    
#13					  reg_enable = 1; reg_write = 0;   									src_addr = 7'd0   ;   
#10					  reg_enable = 1; reg_write = 0;   									src_addr = 7'd120 ;  

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
