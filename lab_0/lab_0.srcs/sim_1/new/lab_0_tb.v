`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 12:26:42 PM
// Design Name: 
// Module Name: lab_0_tb
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


module lab_0_tb();

    //Testbench signals
    reg [7:0] sw_tb;
    wire [7:0] led_tb;
    
    //Instantiate testbench
    lab_0 uut(.sw(sw_tb),
                .led(led_tb)
                );
    
    //Tests
    initial begin
        $monitor("Time=%0t | sw=%b | led=%b", $time, sw_tb, led_tb);
        
        /// Test 1: all switches low
        sw_tb = 8'b00000000;
        #10;

        // Test 2: toggle sw[0]
        sw_tb = 8'b00000001;
        #10;

        // Test 3: drive sw[1]=1, sw[2]=0
        sw_tb = 8'b00000010;
        #10;

        // Test 4: drive sw[2]=1, sw[3]=1
        sw_tb = 8'b00001100;
        #10;

        // Test 5: direct pass-through for upper bits (sw[7:4])
        sw_tb = 8'b11110000;
        #10;

        // Sweep through all values for thoroughness
        sw_tb = 8'b00000000;
        repeat(16) begin
            #10 sw_tb = sw_tb + 1;
        end

        // Finish simulation
        #20;
        $finish;
    end
        
endmodule
