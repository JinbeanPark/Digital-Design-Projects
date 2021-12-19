`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:20:39 12/04/2021
// Design Name:   movement
// Module Name:   C:/Project/lab4/movement_TB.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: movement
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module movement_TB;

	// Inputs
	reg clk;
	reg [9:0] posData;
	reg [1:0] lives;

	// Outputs
	wire [3:0] plrpos;
	
	integer hitWall;
	integer cntClk;

	// Instantiate the Unit Under Test (UUT)
	movement uut (
		.clk(clk), 
		.plrpos(plrpos), 
		.posData(posData), 
		.lives(lives)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		posData = 0;
		lives = 2'b11;
		hitWall = 0;
		cntClk = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #5 clk = ~clk;
	
	
	always @(posedge clk)
	begin
		if (hitWall == 1'b0)
		begin
			posData = 800;
			//if (plrpos == 5)
			//	hitWall = 1'b1;
		end
		//else
		//begin
		//	posData = 200;
		//	if (plrpos == 10)
		//		hitWall = 1'b0;
		//end
	end
      
endmodule

