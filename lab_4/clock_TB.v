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

module clock_TB;
	reg clk;
	reg clr;

	// Outputs
	wire dclk;
	wire segclk;
	wire scoreclk;
	wire plrclk;
	wire gameclk;

	// Instantiate the Unit Under Test (UUT)
	clockdiv clockdiv_ (
		.clk (clk),
		.dclk (dclk),
		.segclk (segclk),
		.scoreclk (scoreclk),
		.plrclk (plrclk),
		.gameclk (gameclk)
	
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #5 clk = ~clk;
	
      
endmodule

