`timescale 1ns/10ps
`include "one_bit_fulladder.v"
module add_8bit( S,cout,A,B,addsub,ov_flag) ;
	output [7:0] S;
	output       cout,ov_flag ;
	input        addsub ;
   input  [7:0] A,B;
  
  
	one_bit_fulladder A0(S[0],c0   ,A[0],B[0],addsub  );
	one_bit_fulladder A1(S[1],c1   ,A[1],B[1],c0 );
	one_bit_fulladder A2(S[2],c2   ,A[2],B[2],c1 );
	one_bit_fulladder A3(S[3],c3   ,A[3],B[3],c2 );
	one_bit_fulladder A4(S[4],c4   ,A[4],B[4],c3 );
	one_bit_fulladder A5(S[5],c5   ,A[5],B[5],c4 );
	one_bit_fulladder A6(S[6],c6   ,A[6],B[6],c5 );
	one_bit_fulladder A7(S[7],cout ,A[7],B[7],c6 );
	xor(ov_flag,c6,cout);


//Note : primary gates doesn't need instance name when called

endmodule