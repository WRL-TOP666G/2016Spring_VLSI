module test2(out1, 
             out2,
             out3, 
             in1, 
             in2,
	     in3);
            
input  in1 , in2 , in3;
output out1 , out2, out3;

assign out1 = ~in2;         //not
assign out2 = in1 | in2;   //or
assign out3 = in3 ^ in2;   //xor

endmodule
