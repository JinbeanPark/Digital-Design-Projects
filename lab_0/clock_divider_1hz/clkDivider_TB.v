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
 
module clkDivider_TB;
 
    reg clk_T;
    reg rst_T;
    wire led_T;
 
    clkDivider UUT (
        .clk(clk_T),
        .rst(rst_T),
        .led(led_T)
    );
 
    initial begin
        clk_T = 1'b0;
        rst_T = 1'b1;
        #55000000;
        rst_T <= 1'b0;
    end
 
    always begin
        #50000000;
        clk_T = ~clk_T;
    end
endmodule