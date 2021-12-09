`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:08 10/26/2021
// Design Name:   clock
// Module Name:   C:/Project/lab3/clock_TB.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_tb;
	reg dclk;
	reg clr;
	reg [8:0] barpos;
	reg [3:0] holepos;
	reg [3:0] plrpos;
	reg [1:0] lives;
	reg [2:0] cyclesneeded;

	wire hsync;
	wire vsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;

	// Instantiate the Unit Under Test (UUT)
	vga vga_ (
		.dclk (dclk),
		.clr (clr),
		.barpos (barpos),
		.holepos (holepos),
		.plrpos (plrpos),
		.lives (lives),
		.hsync (hsync),
		.vsync (vsync),
		.red (red),
		.green (green),
		.blue (blue),
		.cyclesneeded (cyclesneeded)
	
	);

	initial begin
		// Initialize Inputs

		dclk = 0;
		clr = 0;
		barpos = 3;
		holepos = 4;
		plrpos = 4;
		lives = 3;
		cyclesneeded = 2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #5 dclk = ~dclk;
	
      
endmodule

