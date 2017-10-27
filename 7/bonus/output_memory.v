//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Output Memory 
//*************************************************

/////////////////////////////////////////////////////////
//													   //
//              Do not modify this code!!!!!           //
//													   //
/////////////////////////////////////////////////////////



module output_memory(clk,
                     rst,
                     en,
                     addr,
                     d);

// ---------------------- input  ---------------------- //
  input 		clk;
  input 		rst;
  input 		en;
  input [31:0]	addr;
  input [7:0]	d;

// ----------------------  reg   ---------------------- // 
  reg   [7:0]	mem[`size-1:0];
  
// ----------------------  wire  ---------------------- //
  wire 			clk;
  wire 			rst;
  wire 			en;
  wire [31:0]	addr;
  wire [7:0]	d;


  integer i;

  always @ (posedge clk or posedge rst) begin
    if(rst)begin
      for( i = 0 ; i < `size ; i = i + 1)begin
        mem[i] <= 0;
      end
    end
    else if( (en == 1) && (addr<`size) ) begin
      mem[addr] <= d;
    end
  end

endmodule
