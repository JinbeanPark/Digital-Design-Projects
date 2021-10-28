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
btn0,
btn1,
sw,
step_d_btn0,
step_d_btn1,
step_d_sw,
btn0_val,
btn1_val,
switch_val
    );
input clk; //clk in this case is slower than master clock
input rst;
input btn0;
input btn1;
input sw;
reg [2:0] step_d_btn0;
reg [2:0] step_d_btn1;
reg [2:0] step_d_sw;
output reg btn0_val;
output reg btn1_val;
output reg switch_val;


   always @ (posedge clk)
     if (rst)
       begin
          step_d_btn0[2:0]  <= 0;
			 step_d_btn1[2:0]  <= 0;
			 step_d_sw[2:0]  <= 0;
       end
     else if (clk_en)
       begin
          step_d_btn0[2:0]  <= {btnS, step_d_btn0[2:1]};
			 step_d_btn1[2:0]  <= {btnS, step_d_btn1[2:1]};
			 step_d_sw[2:0]  <= {btnS, step_d_sw[2:1]};
       end

   always @ (posedge clk)
     if (rst)
	  begin
       btn_val <= 1'b0;
		 switch_val <= 1'b0;
	  end
     else
	  begin
       btn0_val <= ~step_d_btn0[0] & step_d_btn0[1] & clk;
		 btn1_val <= ~step_d_btn1[0] & step_d_btn1[1] & clk;
		 switch_val <= ~step_d_sw[0] & step_d_sw[1] & clk;
	  end

endmodule
