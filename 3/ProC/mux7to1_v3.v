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
wire h;
wire i;
wire j;
wire k;
wire l;
wire m;
wire n;
wire o;
wire p;
wire q;
wire r;
// Boolen
not(z0,Sel[0]);
not(z1,Sel[1]);
not(z2,Sel[2]);
and(a,A,z0);
and(b,B,Sel[0]);
and(c,C,z0);
and(d,D,Sel[0]);
and(e,E,z0);
and(f,F,Sel[0]);
and(g,G,z0);
or (h,a,b);
or (i,c,d);
or (j,e,f);
and(k,h,z1);
and(l,i,Sel[1]);
and(m,j,z1);
and(n,g,Sel[1]);
or (o,k,l);
or (p,m,n);
and(q,o,z2);
and(r,p,Sel[2]);
or (Z,q,r);



endmodule
