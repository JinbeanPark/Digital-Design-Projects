`timescale 100ms / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:20:07 10/28/2021
// Design Name:   counter
// Module Name:   /home/kevinhuang/Documents/F21/CSM152A/lab3/counter_TB.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_TB;
	reg clk;
	
	wire [5:0] seccounter;
	wire [5:0] mincounter;
	
	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk (clk),
		.seccounter (seccounter),
		.mincounter (mincounter)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		clk = 0;
		// Add stimulus here

	end
   always #5 clk = ~clk;
endmodule

