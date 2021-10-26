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

	// Outputs
	wire blinkclk;
	wire countclk;
	wire adjclk;
	wire fastclk;

	// Instantiate the Unit Under Test (UUT)
	clock clock_ (
		.clk (clk),
		.blinkclk (blinkclk),
		.countclk (countclk),
		.adjclk (adjclk),
		.fastclk (fastclk)
	
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #5 clk = ~clk;
	/*
	always @(posedge clk)
	begin 
		if (countclk == 1'b1) 
		begin
			$display("ping");
		end
	end */

      
endmodule

