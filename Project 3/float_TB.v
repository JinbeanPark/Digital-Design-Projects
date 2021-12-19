`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:22:50 10/14/2021
// Design Name:   float
// Module Name:   /home/ise/lab2/float_TB.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: float
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module float_TB;

	// Inputs
	reg [11:0] sign_result;

	// Outputs
	wire [2:0] exponent;
	wire [3:0] significand;
	wire fifth;

	// Instantiate the Unit Under Test (UUT)
	float uut (
		.sign_result(sign_result), 
		.exponent(exponent), 
		.significand(significand), 
		.fifth(fifth) 
	);

	initial begin
		// Initialize Inputs
		sign_result = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sign_result = 12'b011111111111;
		end
endmodule
