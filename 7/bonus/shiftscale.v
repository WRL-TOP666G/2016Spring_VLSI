//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Shiftscale
//*************************************************

module shiftscale(clk,
                  rst,
                  en,
                  i1,
                  i2,
				  i3,
				  i4,
				  i5,
                  o);

// ---------------------- input  ---------------------- // 
  input clk;
  input rst;
  input en;
  input signed [8:0]i1;
  input signed [8:0]i2;
  input signed [8:0]i3;
  input signed [8:0]i4;
  input signed [8:0]i5;
  
// ---------------------- output ---------------------- //
  output reg [7:0]o;
  
  reg [8:0]value1;
  reg [8:0]value2;
  reg [8:0]value3;
  reg [8:0]value4;
  reg [8:0]value5;
  reg [9:0] sum;
  
 always@(posedge clk)begin
	if(en)begin
		if(i1[8]==1)
			value1=-i1 + 1'b1; 
		else
			value1=i1;
			
		if(i2[8]==1)
			value2=-i2 + 1'b1; 
		else
			value2=i2;
		if(i3[8]==1)
			value3=-i3 + 1'b1; 
		else
			value3=i3;
		if(i4[8]==1)
			value4=-i4 + 1'b1; 
		else
			value4=i4;
		if(i5[8]==1)
			value5=-i5 + 1'b1; 
		else
			value5=i5;
			
		sum = value1+value2+value3+value4+value5;
		if(sum/5<`threshold)
			o = 8'd0;
		else
			o = 8'd255;
 
	end
 end

  
endmodule
