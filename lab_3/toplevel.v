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
sel,
adj,
rstBtn,
pueBtn,
//outputs for TB
minutes,
seconds,
boardAnode,
segmentLed
);
input clk;
input sel;
input adj;
input rstBtn;
input pueBtn;
//outputs for TB
output reg [3:0] boardAnode;
output reg [6:0] segmentLed;

//wiring
wire [5:0] mins;
wire [5:0] secs;
wire btn0_val; //reset
wire btn1_val; //pause
wire blinkclk;
wire adjclk;
wire fastclk;
wire [3:0] anode;
wire [6:0] segment;
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
				 .mincounter(mins[5:0]),
				 .seccounter(secs[5:0]),
				 .anode(anode[3:0]),
				 .segment(segment[6:0])
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
				 .adjclk(adjclk),
				 .mincounter(mins[5:0]),
				 .seccounter(secs[5:0]),
				 .sel(sel),
				 .adj(adj),
				 .btn0_val(validRstBtn),
				 .btn1_val(validPueBtn)
				 );
clock clock_ (
				 .clk(clk),
				 .blinkclk(blinkclk),
				 .adjclk(adjclk),
				 .fastclk(fastclk)
				 );
always @*
begin
    segmentLed = segment;
    boardAnode = anode;
end

endmodule
