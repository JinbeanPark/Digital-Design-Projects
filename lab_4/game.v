`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11/15/21
// Design Name: 
// Module Name:    game 
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
module game(
	clr,
	gameclk,
	scoreclk,
	barpos, 
	holepos,
	plrpos,
	timealive,
	lives
);

output reg [3:0] barpos;
output reg [3:0] holepos;
input [3:0] plrpos;
output reg [15:0] timealive;
output reg [1:0] lives;
input gameclk;
input clr;
input scoreclk;

integer cyclecounter;
integer cyclesneeded;

initial
begin
	barpos = 4'd0;
	holepos = 4'd0;
	//plrpos = 8;
	lives <= 3;
	timealive <= 0;
	cyclecounter = 0;
	cyclesneeded = 8;
end

always @(posedge gameclk or posedge clr)
begin
	if (clr == 1)
	begin
		barpos = 0;
		holepos = ($urandom & 15)%14;
		//plrpos = 8;
		lives <= 3;
		cyclecounter = 0;
		cyclesneeded = 8;
	end
	else
	begin
		cyclecounter = cyclecounter + 1;
		if (cyclecounter == cyclesneeded)
		begin
			if (barpos == 440 && (plrpos < holepos || plrpos > holepos + 2)) 
				lives <= lives - 1;
			if (barpos == 510) // bar no longer onscreen
			begin
				barpos = 0;
				holepos = ($urandom & 15)%14;
				cyclecounter = 0;
				if (cyclesneeded > 1)
					cyclesneeded = cyclesneeded - 1;
			end
			barpos = barpos + 1;
		end
	end
	
	
end

// score timer
always @(posedge scoreclk or posedge clr)
begin
	if (clr == 1)
	begin
		timealive <= 0;
	end
	else
	begin
		if (lives > 0 && clr == 0)
		begin
			timealive <= timealive + 1;
		end
	end
end

endmodule
