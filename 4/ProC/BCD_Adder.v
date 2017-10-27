`timescale 1ns/10ps
`include "BCD.v"
`include "Dec_BCDto7S.v"
module BCD_Adder(A1,B1,A2,B2,Out_0,Out_1,ov_flag) ;
	output [6:0] Out_0,Out_1;
	output       ov_flag;
  input  [3:0] A1,A2,B1,B2;
  
  wire [3:0] S0,S1;
  wire       C_out;
  
  BCD          bcd0(A1,B1,C_out,S0,1'b0);
  Dec_BCDto7S  m0(S0[3],S0[2],S0[1],S0[0],Out_0[6],Out_0[5],Out_0[4],Out_0[3],Out_0[2],Out_0[1],Out_0[0]);
  
  
  BCD          bcd1(A2,B2,ov_flag,S1,C_out);
  Dec_BCDto7S  m1(S1[3],S1[2],S1[1],S1[0],Out_1[6],Out_1[5],Out_1[4],Out_1[3],Out_1[2],Out_1[1],Out_1[0]);
  


//Note : primary gates doesn't need instance name when called

endmodule
