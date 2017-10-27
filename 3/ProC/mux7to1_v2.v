// Module name and I/O port
module mux7to1 (Z, Sel, A, B, C, D, E, F, G);  
// Input ports declaration
input [2:0] Sel;
input 		A;
input 		B;
input		 C;
input 		D;
input 		E;
input 		F;
input 		G;
// Output ports declaration
output Z;
// Internal wires declaration
wire z0;
wire z1;
wire z2;
wire a;
wire b;
wire c;
wire d;
wire e;
wire f;
wire g;
// Boolen
not(z0,Sel[0]);
not(z1,Sel[1]);
not(z2,Sel[2]);
and(a,A,z0,z1,z2);
and(b,B,Sel[0],z1,z2);
and(c,C,z0,Sel[1],z2);
and(d,D,Sel[0],Sel[1],z2);
and(e,E,z0,z1,Sel[2]);
and(f,F,Sel[0],z1,Sel[2]);
and(g,G,z0,Sel[1],Sel[2]);
or (Z,a,b,c,d,e,f,g);


endmodule
