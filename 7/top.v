//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Top
//*************************************************

/////////////////////////////////////////////////////////
//													   //
//              Do not modify this code!!!!!           //
//													   //
/////////////////////////////////////////////////////////

`include "input_memory.v"
`include "grayscale.v"
`include "sobel.v"
`include "shiftscale.v"
`include "output_memory.v"
`include "controller.v"
module top(clk,
           rst,
           done);

  input clk;
  input rst;
  output done;

  wire clk;
  wire rst;
  wire en_in_mem;
  wire [31:0]in_mem_addr;
  wire en_gray;
  wire [3:0]gray_addr;
  wire en_sobel;
  wire en_shiftscale;
  wire en_out_mem;
  wire [31:0]out_mem_addr;
  wire done;

  wire [23:0]in_mem_q;

  wire [7:0]gray_q0;
  wire [7:0]gray_q1;
  wire [7:0]gray_q2;
  wire [7:0]gray_q3;
  
  wire [7:0]gray_q4;
  wire [7:0]gray_q5;
  wire [7:0]gray_q6;
  wire [7:0]gray_q7;

  wire [7:0]gray_q8;
  
  wire [8:0]sobel_value1;
  wire [8:0]sobel_value2;
  wire [8:0]sobel_value3;
  wire [8:0]sobel_value4;
  wire [8:0]sobel_value5;

  wire [7:0]result;

  input_memory in_mem(.clk(clk),
                      .en(en_in_mem),
                      .addr(in_mem_addr),
                      .q(in_mem_q));

  grayscale gray(.clk(clk),
                 .rst(rst),
                 .en(en_gray),
                 .addr(gray_addr),
                 .d(in_mem_q),
                 .q0(gray_q0),
                 .q1(gray_q1),
                 .q2(gray_q2),
                 .q3(gray_q3),
				 .q4(gray_q4),
				 .q5(gray_q5),
				 .q6(gray_q6),
				 .q7(gray_q7),
				 .q8(gray_q8));

  sobel sobel(.clk(clk),
              .rst(rst),
              .en(en_sobel),
              .i0(gray_q0),
              .i1(gray_q1),
              .i2(gray_q2),
              .i3(gray_q3),
			  .i4(gray_q4),
			  .i5(gray_q5),
			  .i6(gray_q6),
			  .i7(gray_q7),
			  .i8(gray_q8),
              .o1(sobel_value1),
              .o2(sobel_value2),
			  .o3(sobel_value3),
			  .o4(sobel_value4),
			  .o5(sobel_value5));

  shiftscale ss(.clk(clk),
                .rst(rst),
                .en(en_shiftscale),
                .i1(sobel_value1),
                .i2(sobel_value2),
				.i3(sobel_value3),
				.i4(sobel_value4),
				.i5(sobel_value5),
                .o(result));

  output_memory out_mem(.clk(clk),
                        .rst(rst),
                        .en(en_out_mem),
                        .addr(out_mem_addr),
                        .d(result));

  controller ctrl(.clk(clk),
                  .rst(rst),
                  .en_in_mem(en_in_mem),
                  .in_mem_addr(in_mem_addr),
                  .en_gray(en_gray),
                  .gray_addr(gray_addr),
                  .en_sobel(en_sobel),
                  .en_shiftscale(en_shiftscale),
                  .en_out_mem(en_out_mem),
                  .out_mem_addr(out_mem_addr),
                  .done(done));

endmodule