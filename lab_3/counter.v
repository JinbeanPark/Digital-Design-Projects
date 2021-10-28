`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:53 10/28/2021 
// Design Name: 
// Module Name:    counter 
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
module counter(
countclk,
adjclk,
mincounter,
seccounter,
sel,
adj
    );
output reg [5:0] mincounter;
output reg [5:0] seccounter;
input clk;
input adj;
input sel;
initial
begin
	mincounter = 0;
	seccounter = 0;
end


always @(posedge countclk)
begin
	if (adj == 0)
	begin
		seccounter = seccounter + 1;
		if (seccounter % 60 == 0)
		begin
			seccounter = 0;
			mincounter = mincounter + 1;
		end
	end
end
always @(posedge adjclk)
begin
	if (adj == 1)
	begin
		if (sel == 1)
		begin
			seccounter = seccounter + 1;
			if (seccounter % 60 == 0)
			begin
				seccounter = 0;
				mincounter = mincounter + 1;
			end
		end
		else
		begin
			mincounter = mincounter + 1; //no handling for overflow
		end
	end
end


endmodule
