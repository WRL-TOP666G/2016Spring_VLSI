module mux2to1_nand (Z, Sel, A, B); 
 
input Sel;
input A;
input B;

output Z;

wire a;
wire b;
wire c;

nand(b,Sel,B);
nand(a,Sel,Sel);
nand(c,a,A);
nand(Z,b,c);

endmodule
