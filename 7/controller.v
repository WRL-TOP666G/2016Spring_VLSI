//*************************************************
//** 2016 spring iVCAD                          
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- controller
//*************************************************
`define S_reset 		4'd0
`define S_in_mem 		4'd1
`define S_grayscale 	4'd2
`define S_sobel 		4'd3
`define S_shiftscale 	4'd4
`define S_write_back 	4'd5
`define S_branch 		4'd6
`define S_done 			4'd7




module controller(clk,
                  rst,
                  en_in_mem,
                  in_mem_addr,
                  en_gray,
                  gray_addr,
                  en_sobel,
                  en_shiftscale,
                  en_out_mem,
                  out_mem_addr,
                  done);

				  
// ---------------------- input  ---------------------- //
  input 		clk;
  input 		rst;
  
// ---------------------- output ---------------------- //
  output reg	en_in_mem;
  output reg [31:0]	in_mem_addr;
  output reg	en_gray;
  output reg [3:0]	gray_addr;
  output reg	en_sobel;
  output reg	en_shiftscale;
  output reg	en_out_mem;
  output reg [31:0]	out_mem_addr;
  output reg	done;

 
  reg [3:0] state, next_state;
  
  reg [9:0] X, Y;
  
  always@(posedge clk or posedge rst) begin //state 
		if(rst) state <= `S_reset;
		else    state <= next_state;
	end
	
  always@(*) begin         //state control
		case(state)
			`S_reset     :  next_state = `S_in_mem;
			`S_in_mem    :  next_state = `S_grayscale;
			`S_grayscale :  if (gray_addr != 4'd9 )
                                next_state = `S_in_mem;
						    else
                                next_state = `S_sobel;
			`S_sobel     :  next_state = `S_shiftscale;
			`S_shiftscale:  next_state = `S_write_back;
			`S_write_back:  next_state = `S_branch;
			`S_branch    :  if(X==`width-1 & Y== `height-1)
						   next_state = `S_done;
						   else
						   next_state = `S_in_mem;			
		endcase
	end
  
  always@(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            in_mem_addr <= 32'd0;
            gray_addr <= 4'd0;
			out_mem_addr <= 0;
            X<= 0;
            Y<= 0;
        end
        else
        begin            
            case (state)
            `S_reset:
            begin
                in_mem_addr <= 32'd0;
                gray_addr <= 4'd0;
                out_mem_addr <= 0;
                X<= 0;
                Y<= 0;
            end
            `S_in_mem:
            begin
                gray_addr <= gray_addr;
				out_mem_addr <= out_mem_addr;
                X <= X;
                Y <= Y;
                case (gray_addr)
                    4'b0000:
                    begin
                        if (X == 0 || Y == 0)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= (Y-1)*`width + (X-1);
                    end
                    4'b0001:
                    begin
                        if (Y == 0)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= (Y-1)*`width + X;
                    end
                    4'b0010:
                    begin
                        if (X == `width-1 || Y == 0)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= (Y-1)*`width + (X+1);
                    end
                    4'b0011:
                    begin
                        if (X == 0)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= Y*`width + (X-1);
                    end
                    4'b0100:
                    begin
                        in_mem_addr <= Y*`width + X;
                    end
                    4'b0101:
                    begin
                        if (X == `width-1)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= Y*`width + (X+1);
                    end
                    4'b0110:
                    begin
                        if (X == 0 || Y == `height-1)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= (Y+1)*`width + (X-1);
                    end  
                    4'b0111:
                    begin
                        if (Y == `height-1)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= (Y+1)*`width + X;
                    end    
                    4'b1000:
                    begin
                        if (X == `width-1 || Y == `height-1)
                            in_mem_addr <= `size;
                        else
                            in_mem_addr <= (Y+1)*`width + (X+1);
                    end
                    default:
                    begin
                        in_mem_addr <= 'bz;
                    end                
                endcase
            end
            `S_grayscale:
            begin
                X <= X;
                Y <= Y;
                in_mem_addr <= in_mem_addr;
                gray_addr <= gray_addr+1;
				out_mem_addr <= out_mem_addr;
            end
			`S_sobel:
			begin
                X <= X;
                Y <= Y;
                in_mem_addr <= in_mem_addr;
                gray_addr <= 0;
				out_mem_addr <= out_mem_addr;
            end
			`S_write_back:
			begin
                X <= X;
                Y <= Y;
				in_mem_addr <= in_mem_addr;
                gray_addr <= gray_addr;
				out_mem_addr <= out_mem_addr+1;
			end
            `S_branch    :
            begin
                if (X == `width-1)
                begin
                    X <= 0;
                    Y <= Y+1;
                end
                else
                begin
                    X <= X+1;
                    Y <= Y;
                end
                in_mem_addr <= in_mem_addr;
                gray_addr <= gray_addr;
				out_mem_addr <= out_mem_addr;
            end
            default:
            begin
                X <= X;
                Y <= Y;
                in_mem_addr <= in_mem_addr;
                gray_addr <= gray_addr;
				out_mem_addr <= out_mem_addr;
            end
            endcase
        end
    end 
	
	always@(*) begin         //data control
		case(state)
			`S_reset   : begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 0;
		              	end
			`S_in_mem   :begin
							en_in_mem = 1;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 0;
		              	end
			`S_grayscale:begin
							en_in_mem = 0;
							en_gray  = 1;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 0;
		              	end
		    `S_sobel    :begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 1;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 0;
		              	end
			`S_shiftscale:begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 1;
							en_out_mem = 0;
							done = 0;
		              	end	
			`S_write_back:begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 1;
							done = 0;
		              	end	
			`S_branch    :begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 0;
		              	end	
			`S_done    :begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 1;
		              	end	
						
		  default  :  begin
							en_in_mem = 0;
							en_gray  = 0;
							en_sobel = 0;
							en_shiftscale = 0;
							en_out_mem = 0;
							done = 1;
		              	end	
		endcase
	end


endmodule
