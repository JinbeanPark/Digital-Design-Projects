`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:24:34 10/19/2021
// Design Name:   mainModule
// Module Name:   C:/Project/lab2/mainModule_TB.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mainModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mainModule_TB;
	// Inputs
	reg clk;
	reg [11:0] value;
	// Outputs
	wire [7:0] floating_rep;
	integer num;
	// Instantiate the Unit Under Test (UUT)
	mainModule mainModule_ (
		.two_comp				(value),
		.clk						(clk),
		.float_rep				(floating_rep)
	);
	/*
	mainModule mainModule_ (
		.two_comp				(value[11:0]),
		.clk						(clk),
		.float_rep				(floating_rep[7:0])
	);
	*/
	
	reg [11:0] instructs [0:1023];
	initial begin
		// Initialize Inputs
		clk = 0;
		value = 12'd0;
		// Wait 100 ns for global reset to finish
		#100;
		$readmemb("float.code", instructs);
		$display("# of instr: %d", instructs[0]);
		num = 1;
		begin
			
			
		end
		$display("Done");
	end
always #5 clk = ~clk;

always @(posedge clk)  
begin
	if(num < instructs[0] + 1)
	begin
		value = instructs[num];
		// Add stimulus here
		#100;
		$display("Line %d: \n %b two's component \n %b float", num, value, floating_rep);
		num = num + 1;
	end
end
endmodule

