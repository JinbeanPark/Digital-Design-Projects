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
	reg sel;
	reg adj;
	reg rstBtn;
	reg pueBtn;
	
	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;
    wire [3:0] boardAnode;
    wire [6:0] segmentLed;
	
	// Instantiate the Unit Under Test (UUT)
	toplevel uut (
		.clk(clk), 
		.sel(sel), 
		.adj(adj), 
		.rstBtn(rstBtn), 
		.pueBtn(pueBtn),
		.minutes(minutes[5:0]),
		.seconds(seconds[5:0]),
        .boardAnode(boardAnode[3:0]),
        .segmentLed(segmentLed[6:0])
	);

	initial
		begin
		
		// Initialize Inputs
		clk = 0;
		sel = 0;
		adj = 0;
		rstBtn = 0;
		pueBtn = 0;
		
		rstBtn = 1;
		// Wait 100 ns for global reset to finish
		#100;
		$display("Starting clock here");
		rstBtn = 0; //should stop resetting, clock should start now
		//Normal case
		#500000;
		
		$display("Starting pause function");
		//Testing pause function
		//Simulate noise
		pueBtn = ~pueBtn;
		#5000;
		pueBtn = ~pueBtn;
		#5000;
		pueBtn = ~pueBtn;
		#2500;
		pueBtn = ~pueBtn; 
		#2500;
		//Below 4 lines are for normal input
		pueBtn = ~pueBtn;
		#50000;
		pueBtn = ~pueBtn;
		#50000;
		
		
		//at this point we should have clock paused
		
		//
		
		//Test adjust minutes
		adj = 1;
		#100;
		
		
		
		end
	always #5 clk = ~clk; //simulate master clock of 100MHz
	/*
	always @(posedge clk) 
	begin
		//$display("Real time is %0f\nWatch time is %0d:%0d", $realtime, minutes, seconds);
	end
	*/
      
endmodule

