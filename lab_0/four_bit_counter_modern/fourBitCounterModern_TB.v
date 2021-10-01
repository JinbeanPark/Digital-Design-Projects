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
/*test case where when initialized, we will set clk to 0 and rst to 1, wait 30 ns, then set rst to 0.
afterwards, the clk signal will pulse every 5 nanoseconds (turn on for 5 ns, then off for 5 ns)
*/
module fourBitCounterModern_TB;
 
    reg clk_T, rst_T;
    wire [3:0] a;

 
    fourBitCounterModern UUT (
        .clk(clk_T),
        .rst(rst_T),
        .a(a)
    );

 
    initial begin
        clk_T <= 1'b0;
        rst_T <= 1'b1;
        #30;
        rst_T <= 1'b0;
    end
 
    always begin
        clk_T = ~clk_T;
        #5;
    end
 
    initial
        #160 $finish;
 
endmodule
