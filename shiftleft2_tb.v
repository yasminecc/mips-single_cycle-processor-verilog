`timescale 1ns / 1ps
`include "shiftleft2.v"

module shiftleft2_tb;

    // Parameters
    parameter WIDTH_in = 32;
    parameter WIDTH_out = 32;

    // Inputs
    reg [WIDTH_in-1:0] in;
    
    // Output
    wire [WIDTH_out-1:0] out;
    
    Shiftleft2 #(WIDTH_in, WIDTH_out) shiftleft2 (in, out);
    
    initial begin
        $dumpfile("shiftleft2.vcd");
        $dumpvars(0, shiftleft2_tb);

        // Test case 1: 
        in = 32'h00000001;
        #10;
        
        // Test case 2: 
        in = 32'h12345678;
        #10;

        // Test case 3: 
        in = 32'hFAAABBBB;
        #10;

        // Test case 4: 
        in = 32'h00000000;
        #10;

        // Finish the simulation
        $finish;
    end
    
endmodule
