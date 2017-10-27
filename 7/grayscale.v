//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Grayscale
//*************************************************


module grayscale(clk,
                 rst,
                 en,
                 addr,
                 d,
                 q0,
                 q1,
                 q2,
                 q3,
				 q4,
				 q5,
				 q6,
				 q7,
				 q8);

// ---------------------- input  ---------------------- //
  input clk;
  input rst;
  input en;
  input [3:0]addr;
  input [23:0]d;
  
// ---------------------- output ---------------------- //  
  output reg[7:0]q0;
  output reg[7:0]q1;
  output reg[7:0]q2;
  output reg[7:0]q3;
  output reg[7:0]q4;
  output reg[7:0]q5;
  output reg[7:0]q6;
  output reg[7:0]q7;
  output reg[7:0]q8;

  always@(posedge clk or posedge rst) 
	begin
		if(rst) 
			begin
				q0<=8'd0;
				q1<=8'd0;
				q2<=8'd0;
				q3<=8'd0;
				q4<=8'd0;
				q5<=8'd0;
				q6<=8'd0;
				q7<=8'd0;
                q8<=8'd0;
			end
		else if (en)begin
		case(addr)
			4'd0:begin
					q0<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=q8;
				end
			4'd1:begin
					q0<=q0;
					q1<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=q8;
				end
			4'd2:begin
					q0<=q0;
					q1<=q1;
					q2<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=q8;
				end
			4'd3:begin
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=q8;
				end
			4'd4:begin	
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=q8;
				end
			4'd5:begin	
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q6<=q6;
					q7<=q7;
                    q8<=q8;
				end
			4'd6:begin	
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
					q7<=q7;
                    q8<=q8;
				end
			4'd7:begin	
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
                    q8<=q8;
				end
                4'd8:begin	
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=(d[23:16]*0.3+d[15:8]*0.6+d[7:0]*0.1);
				end
			default:begin
					q0<=q0;
					q1<=q1;
					q2<=q2;
					q3<=q3;
					q4<=q4;
					q5<=q5;
					q6<=q6;
					q7<=q7;
                    q8<=q8;
					end
		endcase
		end
	end


endmodule
