`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 11:54:25 AM
// Design Name: 
// Module Name: lab_0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_0(
    input [7:0] sw,
    output [7:0] led
    );
  
  //variable used for the generate statement in the main block of code  
  genvar i; 
  
  //Wires Created for led2 - Purpose is to reduce complexity in the main block of code
  wire led_connection1, led_connection2;
  assign led_connection1 = sw[1] & (~sw[2]);
  assign led_connection2 = sw[2] & sw[3]; 
  
  
  //Main Block of Code
  assign led[0] = ~sw[0];
  assign led[1] = led_connection1;
  assign led[2] = led_connection1 | led_connection2;
  assign led[3] = led_connection2;
  
  
  generate
    for(i = 4; i <= 7; i = i + 1) 
        begin
            assign led[i] = sw[i];
        end
  endgenerate
  
endmodule
