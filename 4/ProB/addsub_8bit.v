`timescale 1ns/10ps
`include "add_8bit.v"
module addsub_8bit( S, cout,A,B,addsub,ov_flag) ;

	output [7:0] S;
	output       cout,ov_flag ;
	input        addsub ;
    input  [7:0] A,B;
  
  wire [7:0] b;
  
  xor(b[0],B[0],addsub);
  xor(b[1],B[1],addsub);
  xor(b[2],B[2],addsub);
  xor(b[3],B[3],addsub);
  xor(b[4],B[4],addsub);
  xor(b[5],B[5],addsub);
  xor(b[6],B[6],addsub);
  xor(b[7],B[7],addsub);

  add_8bit A0 (S,cout,A,b,addsub,ov_flag);


//Note : primary gates doesn't need instance name when called

endmodule
