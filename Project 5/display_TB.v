`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:10 12/04/2021
// Design Name:   display
// Module Name:   C:/Project/lab4/display_TB.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module display_TB;

	// Inputs
	reg segclk;
	reg [15:0] timealive;

	// Outputs
	wire [3:0] anode;
	wire [6:0] segment;
	
	integer cntSegClk;

	// Instantiate the Unit Under Test (UUT)
	display uut (
		.segclk(segclk), 
		.timealive(timealive), 
		.anode(anode), 
		.segment(segment)
	);

	initial begin
		// Initialize Inputs
		segclk = 0;
		timealive = 0;
		cntSegClk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always 
	begin
		#1308900 segclk = ~segclk;
		if (segclk == 1'b1)
		begin
			cntSegClk = cntSegClk + 1;
			if (cntSegClk == 37)
			begin
				timealive = timealive + 1;
				cntSegClk = 0;
			end
		end
	end
      
endmodule

