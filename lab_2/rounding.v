`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:51 10/19/2021 
// Design Name: 
// Module Name:    rounding 
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
module rounding(
exponent,
significand,
fifth,
rounded_float,
rounded_exp,
clk
    );
input [2:0] exponent;
input [3:0] significand;
input fifth;
input clk;
output reg [3:0] rounded_float;
output reg [2:0] rounded_exp;
integer temp;

always @(posedge clk)
begin
	if(fifth == 1'b1)
	//rounding up
	begin
		temp = significand + 1;
		//if(temp == 4'b0000)
		if(temp == 5'b10000)
		//check overflow
		begin
			if (exponent == 3'b111)
				begin
					rounded_float = significand;
					rounded_exp = exponent;
				end
			else
				begin
					rounded_float = significand >> 1;
					rounded_exp = exponent + 1;
				end
		end
		else
		begin
			rounded_float = temp;
			rounded_exp = exponent;
		end
	end
	else
	//round down (keep current calculated values)
	begin
		rounded_float = significand;
		rounded_exp = exponent;
	end
end
endmodule
