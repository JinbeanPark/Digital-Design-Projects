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
jstkData,
//simulate
    );

input [39:0] jstkData; // joystick movement
input clk;			 // updated based on this clock
output reg [3:0] plrpos;
//input [9:0] simulate;

reg [9:0] position;
reg [1:0] action;

initial
begin
plrpos = 4'd8;
position = 10'd500;
action = 2'b00;
end

always @(posedge clk)
begin
	position = {jstkData[9:8], jstkData[23:16]}; // change if using other axis
	//position = simulate;
	//calculations here
	if(position <= 300) action = 2'b00;
	else if(position >=700) action = 2'b11;
	else action = 2'b01;
	
	case(action)
		2'b00: //left
		begin
			if(plrpos == 0) plrpos = 0;
			else plrpos = plrpos - 1;
		end
		2'b01: //stay
		begin
		//debug here:
		end
		2'b11: //right
		begin
			if(plrpos == 15) plrpos = 15;
			else plrpos = plrpos + 1;
		end
	endcase
	
end


endmodule
