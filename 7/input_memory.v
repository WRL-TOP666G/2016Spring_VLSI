//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Input Memory 
//*************************************************

/////////////////////////////////////////////////////////
//													   //
//              Do not modify this code!!!!!           //
//													   //
/////////////////////////////////////////////////////////



module input_memory(clk,
                    en,
                    addr,
                    q);

// ---------------------- input  ---------------------- //
  input 		clk;
  input 		en;
  input [31:0]	addr;
  
// ---------------------- output ---------------------- //
  output [23:0]	q;

// ----------------------  reg   ---------------------- // 
  reg  [23:0]	q;
  reg  [23:0]	mem[`size:0];

// ----------------------  wire  ---------------------- //
  wire 			clk;
  wire 			en;
  wire [31:0]	addr;

  
  always @ (posedge clk) begin
    if (en == 1)
    begin
        if (addr<`size)
            q <= mem[addr];
        else if (addr == `size)
            q <= 0;
            
    end
  end

endmodule
