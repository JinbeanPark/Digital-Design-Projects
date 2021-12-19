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
	output wire segclk,	//7-segment clock: 381.47Hz, also gameclk
	output reg scoreclk,
	output wire plrclk,
    output reg gameclk
	);

// 17-bit counter variable
reg [31:0] q;
integer scorecounter;
integer gamecounter;
initial
begin
	scorecounter = 0;
	scoreclk = 0;
    gamecounter = 0;
    gameclk = 0;
	q <= 0;
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
		scorecounter = 0;
	end
	// increment counter by one
	else
	begin
		q <= q + 1;
		scorecounter = scorecounter + 1;
        gamecounter = gamecounter + 1;
		if (scorecounter == 32'd49999999)
		begin
			scorecounter = 0;
			scoreclk = ~scoreclk;
		end
        if (gamecounter == 32'd100000)
        begin
            gamecounter = 0;
            gameclk = ~gameclk;
        end
	end
end
// 100Mhz � 2^17 = 381.47Hz
assign segclk = q[17];
// 100Mhz / 2^23 = 11.92Hz
assign plrclk = q[23];
// 100Mhz � 2^1 = 25MHz
assign dclk = q[1];

endmodule
