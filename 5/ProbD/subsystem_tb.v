/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2016 Spring ---------------------- //
// ---------------------- Editor : PHYang   ---------------------- //
// ---------------------- Version : v.3.01  ---------------------- //
// ---------------------- Date : 2016.03.21 ---------------------- //
// ---------------------- Subsystem tb      ---------------------- //
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// 				DO NOT MODIFY THIS TESTBENCH !!!!!!!!!!!		   //
//			 MODIFY YOUR OWN CODE TO SATISFY THIS TESTBENCH	       //
//		   TA WILL USE THIS TESTBENCH TO CHECK YOUR HOMEWORK	   //
//		    SO MAKE SURE YOUR DESIGN CAN PASS THIS TESTBENCH  	   // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`include "subsystem.v"

// ---------------------- define ---------------------- //
`define DataSize	32
`define RegSize		64
`define AddrSize	6
`define clkPeriod	10
//define ALUop
`define	ADDop		4'b0000
`define SUBop		4'b0001
`define ANDop		4'b0010
`define ORop		4'b0011
`define XORop		4'b0100
`define NORop		4'b0101
`define SRLop		4'b0110
`define	ROTRop		4'b0111
`define NOTop		4'b1000
`define NANDop		4'b1001
`define MAXop		4'b1010
`define MINop		4'b1011
`define ABSop		4'b1100
`define SLTSop		4'b1101
`define SLLop		4'b1110
`define ROTLop		4'b1111

module subsystem_tb;

// ----------------------   reg  ---------------------- //
reg							clk;
reg							rst;
reg							reg_enable;
reg 						reg_write;
reg		[`AddrSize-1:0]		src1_addr;
reg		[`AddrSize-1:0]		src2_addr;
reg		[`AddrSize-1:0]		write_addr;
reg		[`DataSize-1:0]		write_data;
reg							alu_enable;
reg 	[`ALUopSize-1:0] 	alu_op;
reg							write_sel;
reg		[`DataSize-1:0]		golden_reg[`RegSize-1:0];

// ----------------------  wire  ---------------------- //
wire						alu_overflow;


integer i, error;

subsystem
	sub(//input
		.clk(clk),
        .rst(rst),
        .reg_enable(reg_enable),
        .reg_write(reg_write),
        .src1_addr(src1_addr),
        .src2_addr(src2_addr),
        .write_addr(write_addr),
        .write_data(write_data),
		.alu_enable(alu_enable),
        .alu_op(alu_op),
        .write_sel(write_sel),
		//output
		.alu_overflow(alu_overflow)
		);
		

//monitor
initial begin
	$readmemh("golden_reg.txt",golden_reg);
	#500
	error=0;
	$display("-----------------------------------------------------------");
	for(i=0;i<`RegSize;i=i+1)begin
		if(sub.RF.REG[i]==golden_reg[i])begin
			$display("REG[%d] = %h PASS!!!",i,sub.RF.REG[i]);
			end
		else begin
			$display("REG[%d] = %h ERROR!!!, EXPECTED ANSWER REG[%d] = %h",i,sub.RF.REG[i],i,golden_reg[i]);
			error = error +1;
			end
		end
	$display("-----------------------------------------------------------");
	if(error==0)begin
        $display("        ****************************        ");
        $display("        **                        **        ");
        $display("        **  Congratulations !!    **        ");
        $display("        **                        **        ");
        $display("        **  Simulation PASS !!    **        ");
        $display("        **                        **        ");
        $display("        *************** ************        ");
		end
	end

//clock generator
always #(`clkPeriod/2) clk = ~clk;

initial begin
	clk = 0; rst = 1; reg_enable = 0; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd0;   write_data = 32'd0;
#10			 rst = 0;
//write data                                                                                  
#7                    reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd1;   write_data = 32'h0000_0053;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd2;   write_data = 32'h0000_00af;
#10                   reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd3;   write_data = 32'h7000_0fff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd4;   write_data = 32'h0000_0004;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd5;   write_data = 32'h8000_00af;
#10                   reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd6;   write_data = 32'h0000_0fff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd7;   write_data = 32'h8000_0004;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd8;   write_data = 32'hf000_00af;
//ADD                                                                                                       
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ADDop;   src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `ADDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd32;  write_data = 32'hffff_ffff;
//SUB                                                                                                                                             
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `SUBop;   src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `SUBop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd33;  write_data = 32'hffff_ffff;
//AND                                                                                                                                             
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ANDop;   src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `ANDop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd34;  write_data = 32'hffff_ffff;
//OR                                                                                                                                             
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ORop;    src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `ORop;    src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd35;  write_data = 32'hffff_ffff;
//XOR                                                                                                                                             
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `XORop;   src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `XORop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd36;  write_data = 32'hffff_ffff;
//NOR                                                                                                                                             
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `NORop;   src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `NORop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd37;  write_data = 32'hffff_ffff;
//SRL                                                                                                                                             
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `SRLop;   src1_addr = 6'd3;  src2_addr = 6'd4;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `SRLop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd38;  write_data = 32'hffff_ffff;
//ROTR                                                                                                                                           
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ROTRop;  src1_addr = 6'd3;  src2_addr = 6'd4;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `ROTRop;  src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd39;  write_data = 32'hffff_ffff;
//NOT
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `NOTop;   src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `NOTop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd40;  write_data = 32'hffff_ffff;
//NAND
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `NANDop;  src1_addr = 6'd1;  src2_addr = 6'd2;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `NANDop;  src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd41;  write_data = 32'hffff_ffff;
//MAX
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `MAXop;   src1_addr = 6'd5;  src2_addr = 6'd6;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `MAXop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd42;  write_data = 32'hffff_ffff;
//MIN
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `MINop;   src1_addr = 6'd7;  src2_addr = 6'd8;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `MINop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd43;  write_data = 32'hffff_ffff;
//ABS
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ABSop;   src1_addr = 6'd3;  src2_addr = 6'd4;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `ABSop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd44;  write_data = 32'hffff_ffff;
//SLTS
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `SLTSop;  src1_addr = 6'd7;  src2_addr = 6'd8;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `SLTSop;  src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd45;  write_data = 32'hffff_ffff;
//SLTS
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `SLTSop;  src1_addr = 6'd5;  src2_addr = 6'd6;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `SLTSop;  src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd46;  write_data = 32'hffff_ffff;
//SLL
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `SLLop;   src1_addr = 6'd3;  src2_addr = 6'd4;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `SLLop;   src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd47;  write_data = 32'hffff_ffff;
//ROTL
#10 		 		  reg_enable = 1; reg_write = 0; write_sel = 0; alu_enable = 0; alu_op = `ROTLop;  src1_addr = 6'd3;  src2_addr = 6'd4;  write_addr = 6'd0;   write_data = 32'hffff_ffff;
#10 		 		  reg_enable = 1; reg_write = 1; write_sel = 1; alu_enable = 1; alu_op = `ROTLop;  src1_addr = 6'd0;  src2_addr = 6'd0;  write_addr = 6'd48;  write_data = 32'hffff_ffff;

#200 $finish;
end

initial begin
	`ifdef FSDB
	$fsdbDumpfile("subsystem.fsdb");
	$fsdbDumpvars;
	`endif
	`ifdef VCD
	$dumpfile("subsystem.vcd");
	$dumpvars;
	`endif
end
endmodule