`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:46:59 12/04/2021
// Design Name:   lives
// Module Name:   C:/Project/lab4/lives_TB.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lives
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lives_TB;

	// Inputs
	reg gameclk;
	reg [1:0] lives;

	// Outputs
	wire [2:0] led;
	
	integer cntGameClk;

	// Instantiate the Unit Under Test (UUT)
	lives uut (
		.gameclk(gameclk), 
		.lives(lives), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		gameclk = 0;
		lives = 0;
		cntGameClk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always 
	begin
		#100000 gameclk = ~gameclk;
		if (gameclk == 1'b1)
			cntGameClk = cntGameClk + 1;
		if (cntGameClk == 3'b101)
		begin
			lives = lives - 1;
			cntGameClk = 0;
		end
	end
      
endmodule

