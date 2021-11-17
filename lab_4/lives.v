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
    scoreclk,
    clr,
    lives,
    led
);

input scoreclk;
input clr;
input lives;
output reg [2:0] led;

always @(posedge scoreclk or posedge clr)
begin
    if (clr == 1)
        lives <= 0;
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
