//*************************************************
//** 2016 spring iVCAD                          
//** Description: Moore machine
//** Mar. 2014 Tim revised  
//** Mar. 2015 Jimmy revised   
//** Mar. 2016 Yip revised     
//*************************************************
module moore(clk, rst, din, qout);   

output qout;
input  clk, rst, din;

reg qout;
reg [1:0]cs, ns;

parameter s0 = 2'b00, 
          s1 = 2'b01,
          s2 = 2'b10, 
          s3 = 2'b11;

always @( posedge clk, posedge rst ) begin
  if( rst ) 
    cs <= 2'b00;
  else      
    cs <= ns;
end

always @(cs, din) begin //control 
  case(cs)
	s0:if(din)ns=s1;
	   else   ns=s0;
	s1:if(din)ns=s2;
	   else   ns=s3;
	s2:if(din)ns=s0;
	   else   ns=s2;
	s3:if(din)ns=s2;
	   else   ns=s3;
  endcase    
end

always @(cs) begin  //data path
  case(cs)
	s0:qout=0;
	s1:qout=1;
	s2:qout=0;
	s3:qout=1;
	default:qout=0;
  endcase
end

endmodule

