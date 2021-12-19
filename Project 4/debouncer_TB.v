`timescale 1ns / 1ps

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

module debouncer_TB;
	reg clk;
    reg sel;
    reg adj;
    reg rstBtn;
    reg pueBtn;

    wire validRstBtn;
    wire validPueBtn;
    wire validSel;
    wire validAdj;
	
	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk (clk),
        .adj (adj),
        .sel (sel),
        .rstBtn (rstBtn),
        .pueBtn (pueBtn),
        .validRstBtn (validRstBtn),
        .validPueBtn (validPueBtn),
        .validSel (validSel),
        .validAdj (validAdj)
	);

	initial begin
		// Initialize Inputs
        sel = 1'b0;
        adj = 1'b0;
        rstBtn = 1'b0;
        pueBtn = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		clk = 0;
		// Add stimulus here
	end

   always #5 clk = ~clk;
   always begin
    /* Below 8 lines are for noises*/
    pueBtn = ~pueBtn;
    #5000;
    pueBtn = ~pueBtn;
    #5000;
    pueBtn = ~pueBtn;
    #2500;
    pueBtn = ~pueBtn; 
    #2500;
    /* Below 4 lines are for normal input */
    pueBtn = ~pueBtn;
    #50000;
    pueBtn = ~pueBtn;
    #50000;
   end
endmodule

