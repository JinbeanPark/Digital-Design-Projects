`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:48:13 10/19/2021
// Design Name:   rounding
// Module Name:   C:/Project/lab2/rounding_TB.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rounding
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rounding_TB;

	// Inputs
	reg [2:0] exponent;
	reg [3:0] significand;
	reg fifth;

	// Outputs
	wire [3:0] rounded_float;
	wire [2:0] rounded_exp;

	// Instantiate the Unit Under Test (UUT)
	rounding uut (
		.exponent(exponent), 
		.significand(significand), 
		.fifth(fifth), 
		.rounded_float(rounded_float), 
		.rounded_exp(rounded_exp) 
	);

	initial begin
		// Initialize Inputs
		exponent = 0;
		significand = 0;
		fifth = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		exponent = 3'b010;
		significand = 4'b1011;
		fifth = 1'b1;
	end
endmodule

