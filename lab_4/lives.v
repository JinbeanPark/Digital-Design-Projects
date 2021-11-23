`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11/16/2021 
// Design Name: 
// Module Name:    lives
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
module lives (
    gameclk,
    lives,
    led
);

input gameclk;
input [1:0] lives;
output reg [2:0] led;

always @(posedge gameclk)
begin
    if (lives == 3)
        led [2:0] = 3'b111;
    else if (lives == 2)
        led [2:0] = 3'b011;
    else if (lives == 1)
        led [2:0] = 3'b001;
    else
        led [2:0] = 3'b000;
end

endmodule
