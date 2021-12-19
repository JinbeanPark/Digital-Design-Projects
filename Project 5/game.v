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
    clb,
	barpos, 
	holepos,
	plrpos,
	timealive,
	lives,
    cyclesneeded
);

output reg [8:0] barpos;
output reg [3:0] holepos;
input [3:0] plrpos;
output reg [15:0] timealive;
output reg [1:0] lives;
input gameclk;
input clr;
input scoreclk;
input clb;

reg [2:0] cyclecounter;
output reg [2:0] cyclesneeded;
reg [1:0] rounds;
reg [3:0] rand;
integer roundsneeded;
initial
begin
	barpos = 9'd0;
	holepos = 4'd0;
	lives <= 3;
	timealive <= 0;
	cyclecounter = 0;
	cyclesneeded = 6;
	rounds = 0;
    rand = 0;
    roundsneeded = 2;
end
//pseudo-rand generator
always @(posedge clb)
begin
     rand = rand + 1;
     if(rand == 14)
     begin
        rand = 0;
     end
end

always @(posedge gameclk or posedge clr)
begin
	if (clr == 1)
	begin
		barpos = 80;
		holepos = 7;
		lives <= 3;
		cyclecounter = 0;
		cyclesneeded = 6;
		rounds = 0;
        roundsneeded = 2;
	end
	else
	begin
		cyclecounter = cyclecounter + 1;
		if (cyclecounter == cyclesneeded && lives > 0)
		begin
        	cyclecounter = 0;
            //player hits bar
			if (barpos == 438) 
			begin
				if (plrpos < holepos || plrpos > holepos + 2) 
                begin
                    lives <= lives - 1;
                end
				rounds = rounds + 1;
			end
            // bar no longer onscreen
			if (barpos == 510)
			begin
				barpos = 0;
				holepos = rand[3:0];//($urandom)%14
				if (cyclesneeded > 2 && rounds > roundsneeded)
				begin
					cyclesneeded = cyclesneeded - 1;
					rounds = 0;
                    
				end
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
