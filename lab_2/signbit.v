`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:34 10/14/2021 
// Design Name: 
// Module Name:    signbit 
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
module signbit(
	sign_result,
	sign,
	float,
	clk
    );

//output
output reg [10:0] sign_result;
output reg sign;
//input
input [11:0] float;
input clk;

always @ (posedge clk)
begin
	sign = float[11];
	if(sign)
		begin
			sign_result = ~float[10:0]+1;
		end
	else
		begin
			sign_result = float[10:0];
		end
end


endmodule
