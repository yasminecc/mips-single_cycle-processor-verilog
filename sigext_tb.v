`timescale 1ns / 1ps
`include "sigext.v"

module sigext_tb;

    // Inputs
    reg [15:0] in;
    // Output
    wire [31:0] out;
    
    Sigext sigext (in, out);
    
    // Test process
    initial begin
        $dumpfile("sigext.vcd");
        $dumpvars(0, sigext_tb);

        // Test case 1: Sign extend positive number 
        in = 16'h1234;
        #10;

        // Test case 2: Sign extend negative number 
        in = 16'hFFFF;
        #10;

        // Test case 3: Sign extend zero 
        in = 16'h0000;
        #10;

        // Test case 4: Sign extend large positive number 
        in = 16'hFFAA;
        #10;

        // Test case 5: Sign extend smallest negative number 
        in = 16'h8000;
        #10;

        // Finish the simulation
        $finish;
    end
    
endmodule
