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
	float   
);

//output
output reg [11:0] sign_result;
output reg sign;
//input
input [11:0] float;
always @*
begin
	sign = float[11];
	if(sign)
		begin
			if(float[10:0] != 11'b0000000000)
			//check if overflow from rounding
			begin
				sign_result = ~float[11:0]+1;
			end
			else
			//case of 12'b100000000000
			begin
				sign_result = 12'b011111111111;
			end
		end
	else
		begin
			sign_result = float[11:0];
		end
end
endmodule
