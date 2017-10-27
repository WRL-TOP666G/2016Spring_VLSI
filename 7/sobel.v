//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Sobel
//*************************************************

module sobel(clk,
             rst,
             en,
             i0,
             i1,
             i2,
             i3,
			 i4,
			 i5,
			 i6,
			 i7,
			 i8,
             o1,
             o2,
			 o3,
			 o4,
			 o5);

// ---------------------- input  ---------------------- //
  input 		clk;
  input 		rst;
  input 		en;
  input [7:0]	i0;
  input [7:0]	i1;
  input [7:0]	i2;
  input [7:0]	i3;
  input [7:0]	i4;
  input [7:0]	i5;
  input [7:0]	i6;
  input [7:0]	i7;
  input [7:0]	i8;

// ---------------------- output ---------------------- //
  output reg signed [8:0]	o1;
  output reg signed [8:0]	o2;
  output reg signed [8:0]	o3;
  output reg signed [8:0]	o4;
  output reg signed [8:0]	o5;
  
  
  reg signed [10:0]value1, value1_;
  reg signed [10:0]value2, value2_;
  reg signed [10:0]value3, value3_;
  reg signed [10:0]value4, value4_;
  reg signed [10:0]value5, value5_;
  
  wire signed [10:0] max=11'd255, min=-11'd255;
  
  
  always@(*)
  begin
    value1 = i0*(-2'd1) + i3*(-2'd2) + i6*(-2'd1) + i2*2'd1 + i5*2'd2 + i8*2'd1;
    value2 = i0*2'd1 + i1*2'd2 + i2*2'd1 + i6*(-2'd1) + i7*(-2'd2) + i8*(-2'd1);
    value3 = i0*2'd2 + i1*2'd2 + i3*2'd2 + i2*(-2'd1) + i4*(-2'd1) + i5*(-2'd1) 
            + i6*(-2'd1) + i7*(-2'd1) + i8*(-2'd1);
    value4 = i2*2'd2 + i1*2'd2 + i5*2'd2 + i0*(-2'd1) + i4*(-2'd1) + i3*(-2'd1) 
            + i6*(-2'd1) + i7*(-2'd1) + i8*(-2'd1);
    value5 = i0*(-2'd1) + i2*2'd1+ i6*2'd1 + i8*(-2'd1);
    value1_ = -value1;
    value2_ = -value2;
    value3_ = -value3;
    value4_ = -value4;
    value5_ = -value5;    
  end
 always@(posedge clk or posedge rst)begin
    if (rst)
    begin
        o1 <= 0;
        o2 <= 0;
        o3 <= 0;
        o4 <= 0;
        o5 <= 0;
    end
    else if(en)begin
        o1<=(value1 > max)? 9'd255 : (value1 < min)? -9'd255 : 
            (value1 >= 11'd0)? value1[8:0] : -(value1_[8:0]);
        o2<=(value2 > max)? 9'd255 : (value2 < min)? -9'd255 : 
            (value2 >= 11'd0)? value2[8:0] : -(value2_[8:0]);
        o3<=(value3 > max)? 9'd255 : (value3 < min)? -9'd255 : 
            (value3 >= 11'd0)? value3[8:0] : -(value3_[8:0]);
        o4<=(value4 > max)? 9'd255 : (value4 < min)? -9'd255 : 
            (value4 >= 11'd0)? value4[8:0] : -(value4_[8:0]);
        o5<=(value5 > max)? 9'd255 : (value5 < min)? -9'd255 : 
            (value5 >= 11'd0)? value5[8:0] : -(value5_[8:0]);
	end
 end
endmodule
