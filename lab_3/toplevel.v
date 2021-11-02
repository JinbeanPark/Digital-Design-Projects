`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:00:46 11/02/2021 
// Design Name: 
// Module Name:    toplevel 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module toplevel(
// Top level inputs
clk,
pause,
sel,
adj,
rstBtn,
pueBtn,
//outputs for TB
minutes,
seconds
);
input clk;
input pause;
input sel;
input adj;
input rstBtn;
input pueBtn;
//outputs for TB
output reg [5:0] minutes;
output reg [5:0] seconds;

//wiring
wire [5:0] mincounter;
wire [5:0] seccounter;
wire btn0_val; //reset
wire btn1_val; //pause
wire blinkclk;
wire adjclk;
wire countclk;
wire fastclk;
wire [3:0] anode;
wire [6:0] led;
wire validRstBtn;
wire validPueBtn;
wire validSel;
wire validAdj;

//wiring
display display_ (
             .fastclk(fastclk),
				 .blinkclk(blinkclk),
				 .sel(sel),
				 .adj(adj),
				 .mincounter(mincounter[5:0]),
				 .seccounter(seccounter[5:0]),
				 .anode(anode[3:0]),
				 .led(led[6:0])
				 );
				 
debouncer debouncer_ (
				 .clk(clk), //clk in this is slower than master, change)
				 .rstBtn(rstBtn),
				 .pueBtn(pueBtn),
				 .sel(sel),
				 .adj(adj),
				 .validRstBtn(validRstBtn),
				 .validPueBtn(validPueBtn),
				 .validSel(validSel),
				 .validAdj(validAdj)
				 );
counter counter_ (
				 .clk(clk),
				 .countclk(countclk),
				 .adjclk(adjclk),
				 .mincounter(mincounter[5:0]),
				 .seccounter(seccounter[5:0]),
				 .sel(sel),
				 .adj(adj),
				 .btn0_val(validRstBtn),
				 .btn1_val(validPueBtn)
				 );
clock clock_ (
				 .clk(clk),
				 .blinkclk(blinkclk),
				 .adjclk(adjclk),
				 .countclk(countclk),
				 .fastclk(fastclk)
				 );
always @*
begin
	minutes = mincounter;
	seconds = seccounter;
end

endmodule
