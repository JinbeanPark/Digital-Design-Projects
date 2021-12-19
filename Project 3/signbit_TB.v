
   
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:41:31 10/14/2021
// Design Name:   signbit
// Module Name:   /home/ise/lab2/signbit_TB.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signbit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module signbit_TB;

	// Inputs
	reg [11:0] float;

	// Outputs
	wire [11:0] result;
	wire sign;

	// Instantiate the Unit Under Test (UUT)
	signbit uut (
		.sign_result(result), 
		.sign(sign), 
		.float(float)
		);

	initial 
		begin
		// Initialize Inputs
		float = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		float = 12'b100100000000;
		$display ("%b is float, %b is result, %b is sign", float, result, sign);
		end
	
endmodule
