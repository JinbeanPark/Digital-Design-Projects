`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:48 10/19/2021 
// Design Name: 
// Module Name:    mainModule 
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
module mainModule(
float_rep,
two_comp,
clk
    );

input [11:0] two_comp;
input clk;
output reg [7:0] float_rep;
integer test;

//signbit
wire [11:0] sign_sign_result;
wire sign_sign;
//float
wire [2:0] float_exponent;
wire [3:0] float_significand;
wire float_fifth;
//rounding
wire [3:0] round_rounded_float;
wire [2:0] round_rounded_exp;

signbit signBit_ (// Outputs
             .sign_result                  (sign_sign_result[11:0]),
             .sign               			 (sign_sign),
             // Inputs
             .float                   		 (two_comp[11:0]),
             /*AUTOINST*/
             // Inputs
				 .clk									 (clk)
				 );



float float_ (// Outputs
             .exponent                  (float_exponent[2:0]),
             .significand               (float_significand[3:0]),
				 .fifth							 (float_fifth),
             // Inputs
             .sign_result               (sign_sign_result[11:0]),
             /*AUTOINST*/
             // Inputs
             .clk                       (clk)
				 );
				 
rounding rounding_ (
				 // Inputs
             .exponent                  (float_exponent[2:0]),
             .significand               (float_significand[3:0]),
				 .fifth							 (float_fifth),
             // Outputs
             .rounded_float                   (round_rounded_float[3:0]),
				 .rounded_exp					 (round_rounded_exp[2:0]),
             /*AUTOINST*/
             // Inputs
             .clk                       (clk)
				 );

always @(posedge clk)
begin
	float_rep = {sign_sign, round_rounded_exp, round_rounded_float};
end
endmodule
