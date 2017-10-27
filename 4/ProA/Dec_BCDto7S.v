module Dec_BCDto7S(A,B,C,D,a,b,c,d,e,f,g);


input A,B,C,D;
output a,b,c,d,e,f,g;

wire Ab,Bb,Cb,Db;

wire an0,an1,an2,an3;
wire bn0,bn1,bn2,bn3;
wire cn0,cn1,cn2;
wire dn0,dn1,dn2,dn3,dn4;
wire en0,en1;
wire fn0,fn1,fn2,fn3;
wire gn0,gn1,gn2,gn3;



not (Ab, A) ;
not (Bb, B) ;
not (Cb, C) ;
not (Db, D) ;

//////a///////
 and (an0, Ab, C) ;	
 and (an1, A, Bb,Cb) ;
 and (an2, Ab,B,D) ;
 and (an3, Bb, Cb,Db) ;
 or (a,an0,an1,an2,an3);
//////////////

//////b///////
 and (bn0, Ab, Bb) ;	
 and (bn1, Bb, Cb) ;
 and (bn2, Ab,Cb,Db) ;
 and (bn3, Ab, C,D) ;
 or (b,bn0,bn1,bn2,bn3);
//////////////

//////c///////
 and(cn0,Ab,B);
 and(cn1,Bb,Cb);
 and(cn2,Ab,C,D);
 or(c,cn0,cn1,cn2);
//////////////



//////d///////
 and (dn0, Ab, Bb,Db) ;	
 and (dn1, Ab, Bb,C) ;
 and (dn2, Ab,C,Db) ;
 and (dn3, A, Bb,Cb) ;
 and (dn4, Ab, B,Cb,D) ;
 or (d,dn0,dn1,dn2,dn3,dn4);
//////////////


//////e///////
 and(en0,Ab,C,Db);
 and(en1,Bb,Cb,Db);
 or(e,en0,en1);
//////////////

//////f///////
 and (fn0, Ab, Cb,Db) ;	
 and (fn1, Ab, B,Cb) ;
 and (fn2, Ab,B,Db) ;
 and (fn3, A, Bb,Cb) ;
 or (f,fn0,fn1,fn2,fn3);

//////////////

//////g///////
 and (gn0, Ab, Bb,C) ;	
 and (gn1, Ab, B,Cb) ;
 and (gn2, Ab,B,Db) ;
 and (gn3, A, Bb,Cb) ;
 or (g,gn0,gn1,gn2,gn3);

//////////////

endmodule
