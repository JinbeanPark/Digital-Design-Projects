`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:42 10/14/2021 
// Design Name: 
// Module Name:    float 
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
module float(
sign_result,
exponent,
significand,
fifth,
clk
    );

input [10:0] sign_result; 
output reg [2:0] exponent;
output reg [3:0] significand;
input clk;
integer i;
output reg fifth;
integer j;

always @(posedge clk)
begin
	i=10;
	j=0;
	exponent = 8;
	while(sign_result[i] == 0 && i > 3)
	begin
		i = i - 1;
		exponent = exponent - 1;
	end
	while(j < 4)
	begin
		significand[3-j] = sign_result[i];
		i = i - 1;
		j = j + 1;
	end
	if(i-4 >= 0) 
	begin
		fifth = sign_result[i-4];
	end
	else
	begin
	fifth = 0;
	end
end

endmodule
