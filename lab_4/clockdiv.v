`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:36 03/19/2013 
// Design Name: 
// Module Name:    clockdiv 
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
module clockdiv(
	input wire clk,		//master clock: 100MHz
	input wire clr,		//asynchronous reset
	output wire dclk,		//pixel clock: 25MHz
	output wire segclk,	//7-segment clock: 381.47Hz
	output wire gameclk
	);

// 17-bit counter variable
reg [17:0] q;
integer gamecounter;
initial
begin
	gameclk = 0;
	gamecounter = 0;
end

// Clock divider --
// Each bit in q is a clock signal that is
// only a fraction of the master clock.
always @(posedge clk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		q <= 0;
		gamecounter = 0;
	end
	// increment counter by one
	else
	begin
		q <= q + 1;
		gamecounter = gamecounter + 1;
		if (gamecounter == 32'd24999999)
		begin
			gamecounter = 0;
			gameclk = ~gameclk;
		end
	end
end

// 50Mhz � 2^17 = 381.47Hz
assign segclk = q[17];

// 50Mhz � 2^1 = 25MHz
assign dclk = q[1];

endmodule
