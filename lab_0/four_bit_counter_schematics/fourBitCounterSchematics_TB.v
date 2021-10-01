`timescale 1ns / 1ps
 
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:31:16 09/27/2021
// Design Name:   fourBitCounter
// Module Name:   C:/Project/test/fourBitCounter_TB.v
// Project Name:  test
// Target Device:
// Tool versions:
// Description: 
//
// Verilog Test Fixture created by ISE for module: fourBitCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
 
module fourBitCounterSchematics_TB;
 
    reg clk, rst;
 
    wire a0;
    wire a1;
    wire a2;
    wire a3;
 
    fourBitCounterSchematics UUT (
        .clk(clk),
        .rst(rst),
        .a0(a0),
        .a1(a1),
        .a2(a2),
        .a3(a3)
    );
 
 
    initial begin
        clk <= 1'b0;
        rst <= 1'b1;
        #30;
        rst <= 1'b0;
    end
 
    always begin
        clk = ~clk;
        #5;
    end
 
    initial
        #160 $finish;
 
endmodule