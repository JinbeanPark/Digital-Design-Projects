`timescale 10ms / 1ps

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
	reg adjclk;
	reg adj;
	reg sel;
	reg btn0_val;
	reg btn1_val;
	
	wire [5:0] seccounter;
	wire [5:0] mincounter;
	
	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.adjclk (adjclk),
		.adj (adj),
		.sel (sel),
		.btn0_val (btn0_val),
		.btn1_val (btn1_val),
		.seccounter (seccounter),
		.mincounter (mincounter)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
		adj = 0;
		sel = 0;
		btn0_val = 0;
		btn1_val = 0;
        
		 
		adjclk = 0;
		// Add stimulus here

	end
   always #25 adjclk = ~adjclk;
endmodule

