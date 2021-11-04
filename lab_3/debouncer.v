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
rstBtn,
pueBtn,
sel,
adj,
validRstBtn,
validPueBtn,
validSel,
validAdj
    );
input clk; //clk in this case is slower than master clock
input rstBtn;
input pueBtn;
input sel;
input adj;
output reg validRstBtn;
output reg validPueBtn;
output reg validSel;
output reg validAdj;

reg [11:0] cnt;
reg switchedPueBtn;
reg regHold;
reg prevSel;
reg prevAdj;


  initial 
  begin
    cnt = 12'b0;
    switchedPueBtn = 1'b0;
    regHold = 1'b0;
    prevSel = sel;
    prevAdj = adj;
    validRstBtn = 1'b0;
    validPueBtn = 1'b0;
    validSel = 1'b0;
    validAdj = 1'b0;
  end

   always @ (posedge clk)
    if (rstBtn == 1 || pueBtn == 1 || prevSel != sel || prevAdj != adj)
    begin
      cnt = cnt + 1'b1;
      if (cnt == 12'b111111111111)
      begin
        regHold = 1'b1;
        if (rstBtn == 1) 
          validRstBtn = rstBtn;
        else if (pueBtn == 1) 
        begin
          validPueBtn = pueBtn;
        end
        else if (prevSel != sel)
        begin
          validSel = sel;
          prevSel = sel;
        end
        else
        begin
          validAdj = adj;
          prevAdj = adj;
        end
      end
    end
    else
    begin
      // Handling noise
      if (regHold == 1'b0 && cnt > 1'b0) begin
        $display ("%dns Noise: ", cnt);
        cnt = 12'd0;
      end
      else if (regHold == 1'b1)
      begin
        cnt = cnt - 1'b1;
        if (cnt == 1'b0) 
        begin
           regHold = 1'b0; 
           $display ("regHold complete");
                 
        cnt = 12'd0;
        validPueBtn = 0;
        validRstBtn = 0;
            
        end
      end

    end

endmodule
