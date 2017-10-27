`timescale 1ns/10ps
`include "one_bit_fulladder.v"
module BCD (A,B,Cb,S,Ci) ;
	output [3:0] S;
	output       Cb;
  input  [3:0] A,B;
  input        Ci;
  wire [3:0] D;
  wire b,c;
  wire C1,C2,C3,C11,C12,C13;
  wire cout,cout_2;
  
 	one_bit_fulladder A0(D[0],C1     ,A[0],B[0],Ci );
	one_bit_fulladder A1(D[1],C2     ,A[1],B[1],C1 );
	one_bit_fulladder A2(D[2],C3     ,A[2],B[2],C2 );
	one_bit_fulladder A3(D[3],cout   ,A[3],B[3],C3 );
  
  and(b,D[2],D[3]);
  and(c,D[1],D[3]);
  or(Cb,cout,b,c);
  
 	one_bit_fulladder A10(S[0],C11   ,1'b0   ,D[0],1'b0  );
	one_bit_fulladder A11(S[1],C12   ,Cb     ,D[1],C11   );
	one_bit_fulladder A12(S[2],C13   ,Cb     ,D[2],C12   );
	one_bit_fulladder A13(S[3],cout_2  ,1'b0   ,D[3],C13   );


//Note : primary gates doesn't need instance name when called

endmodule