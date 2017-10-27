// include mux2to1
`include "mux2to1_nand.v"
// Module name and I/O port
module mux4to1_nand (Z, Sel, A, B, C, D);  
// Input ports declaration
input [1:0] Sel;
input 		A;
input 		B;
input		C;
input 		D;
// Output ports declaration
output Z;
// Internal wires declaration
wire z0;
wire z1;
// Hierarchical structure
mux2to1_nand m0(.Z(z0), .Sel(Sel[0]), .A(A), .B(B));
mux2to1_nand m1(.Z(z1), .Sel(Sel[0]), .A(C), .B(D));
mux2to1_nand m2(.Z(Z), .Sel(Sel[1]), .A(z0), .B(z1));


endmodule
