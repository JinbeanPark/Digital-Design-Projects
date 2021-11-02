`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:30:06 11/02/2021
// Design Name:   toplevel
// Module Name:   /home/ise/Desktop/CS M152A/lab3/toplevel_TB.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: toplevel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module toplevel_TB;

	// Inputs
	reg clk;
	reg rst;
	reg pause;
	reg sel;
	reg adj;
	reg rstBtn;
	reg pueBtn;
	
	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;
	
	// Instantiate the Unit Under Test (UUT)
	toplevel uut (
		.clk(clk), 
		.rst(rst), 
		.pause(pause), 
		.sel(sel), 
		.adj(adj), 
		.rstBtn(rstBtn), 
		.pueBtn(pueBtn),
		.minutes(minutes[5:0]),
		.seconds(seconds[5:0])
	);

	initial
		begin
		rst = 1; //pretend reset
		// Initialize Inputs
		clk = 0;
		pause = 0;
		sel = 0;
		adj = 0;
		rstBtn = 0;
		pueBtn = 0;
		
		
		rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		end
	always #5 clk = ~clk; //simulate master clock of 100MHz
	/*
	always @(posedge clk) 
	begin
		//$display("Real time is %0f\nWatch time is %0d:%0d", $realtime, minutes, seconds);
	end
	*/
      
endmodule

