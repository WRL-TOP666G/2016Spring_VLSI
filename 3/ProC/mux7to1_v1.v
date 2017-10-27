// include mux2to1
`include "mux2to1_nand.v"
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
wire z3;
wire z4;
wire z5;
// Hierarchical structure
mux2to1_nand m0(.Z(z0),  .Sel(Sel[0]), .A(A),  .B(B));
mux2to1_nand m1(.Z(z1),  .Sel(Sel[0]), .A(C),  .B(D));
mux2to1_nand m2(.Z(z2),  .Sel(Sel[0]), .A(E),  .B(F));
mux2to1_nand m3(.Z(z3),  .Sel(Sel[0]), .A(G),  .B(G));
mux2to1_nand m4(.Z(z4),  .Sel(Sel[1]), .A(z0), .B(z1));
mux2to1_nand m5(.Z(z5),  .Sel(Sel[1]), .A(z2), .B(z3));
mux2to1_nand m6(.Z(Z),   .Sel(Sel[2]), .A(z4), .B(z5));


endmodule
