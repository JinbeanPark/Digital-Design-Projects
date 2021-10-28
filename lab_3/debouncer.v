`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:43 10/28/2021 
// Design Name: 
// Module Name:    asdfgh 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module debouncer(
clk,
rst,
btn_val,
switch_val
    );
input clk; //clk in this case is slower than master clock
input rst;
input btn;
input sw;
reg [2:0] step_d_btn;
reg [2:0] step_d_sw;
output reg btn_val;
output reg switch_val;


   always @ (posedge clk)
     if (rst)
       begin
          step_d_btn[2:0]  <= 0;
			 step_d_sw[2:0]  <= 0;
       end
     else if (clk_en)
       begin
          step_d_btn[2:0]  <= {btnS, step_d[2:1]};
			 step_d_sw[2:0]  <= {btnS, step_d[2:1]};
       end

   always @ (posedge clk)
     if (rst)
	  begin
       btn_val <= 1'b0;
		 switch_val <= 1'b0;
	  end
     else
	  begin
       btn_val <= ~step_d_btn[0] & step_d_btn[1] & clk;
		 switch_val <= ~step_d_sw[0] & step_d_sw[1] & clk;
	  end

endmodule
