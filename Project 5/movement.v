`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:56 11/18/2021 
// Design Name: 
// Module Name:    movement 
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

//{jstkData[9:8], jstkData[23:16]} : {jstkData[25:24], jstkData[39:32]};
module movement(
clk,
plrpos,
posData,
lives
    );
input [1:0] lives;
input [9:0] posData; // joystick movement
input clk;			 // updated based on this clock
output reg [3:0] plrpos;
reg [1:0] action;

initial
begin
plrpos = 8;
action = 2'b00;
end

always @(posedge clk)
begin
    if(lives > 0)
    begin
        //calculations here
        if(posData <= 300) action = 2'b11;
        else if(posData >=700) action = 2'b00;
        else action = 2'b01;
        
        case(action)
            2'b00: //left
            begin
                if (plrpos > 0) plrpos = plrpos - 1;
            end
            2'b01: //stay
            begin
            //debug here:
            end
            2'b11: //right
            begin
                if(plrpos < 15) plrpos = plrpos + 1;
            end
        endcase
    end
end


endmodule
