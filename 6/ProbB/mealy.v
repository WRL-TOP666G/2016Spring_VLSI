//*************************************************
//** 2016 spring iVCAD                          
//** Description: Mealy machine
//** Mar. 2014 Tim revised  
//** Mar. 2015 Jimmy revised
//** Mar. 2016 Yip revised        
//*************************************************
module mealy(clk, rst, din, qout);   

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

always @(cs, din) begin
  case(cs)
	s0:if(din)ns=s0;
	   else   ns=s1;
	s1:if(din)ns=s2;
	   else   ns=s1;
	s2:if(din)ns=s0;
	   else   ns=s1;
  endcase    
end

always @(cs, din) begin
  case(cs)
	s0:if(din)qout=0;
	   else   qout=0;
	s1:if(din)qout=0;
	   else   qout=0;
	s2:if(din)qout=0;
	   else   qout=1;
	default:qout=0;
  endcase
end

endmodule
