`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:04 10/26/2021 
// Design Name: 
// Module Name:    clock 
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
module clock(
clk,
blinkclk,
adjclk,
countclk,
fastclk
    );
output reg blinkclk;
output reg adjclk;
output reg countclk;
output reg fastclk;
input clk;

//in-module variables
integer blinkcounter;
integer adjcounter;
integer countcounter;
integer fastcounter;

initial
begin
	blinkclk = 0;
	adjclk = 0;
	countclk = 0;
	fastclk = 0;
	
	blinkcounter = 0;
	adjcounter = 0;
	countcounter = 0;
	fastcounter = 0;
end

always @(posedge clk)
begin
	blinkcounter = blinkcounter + 1;
	adjcounter = adjcounter + 1;
	countcounter = countcounter + 1;
	fastcounter = fastcounter + 1;
	if (countcounter == 32'd49999999)
	begin
		countcounter = 0;
		countclk = ~countclk;
	end
	if (adjcounter == 32'd24999999)
	begin
		adjcounter = 0;
		adjclk = ~adjclk;
	end
	if (fastcounter == 32'd300000) 
	begin
		fastcounter = 0;
		fastclk = ~fastclk;
	end
	if (blinkcounter == 32'd33333333)
	begin
		blinkcounter = 0;
		blinkclk = ~blinkclk;
	end
		
end

endmodule
