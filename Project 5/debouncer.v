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
clrBtn,
clr,
    );
input clk; //clk in this case is slower than master clock
input clrBtn;
output reg clr;

reg [11:0] cnt;
reg regHold;
  initial 
  begin
    cnt = 12'b0;
    regHold = 1'b0;
    clr = 1'b0;
  end
  always @ (posedge clk)
  if (clrBtn == 1)
  begin
    cnt = cnt + 1'b1;
    if (cnt == 12'b111111111111)
    begin
      regHold = 1'b1;
      clr = clrBtn;;
    end
  end
  else
  begin
    // Handling noise
    if (regHold == 1'b0 && cnt > 1'b0) 
      cnt = 12'd0;
    else if (regHold == 1'b1)
    begin
      cnt = cnt - 1'b1;
      if (cnt == 1'b0) 
      begin
          regHold = 1'b0; 
          cnt = 12'd0;
          clr = 0; 
      end
    end
  end
endmodule
