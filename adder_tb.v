`timescale 1ns / 1ps
`include "adder.v"

module adder_tb;
    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    
    // Output
    wire [31:0] result;
    
    Adder adder (a, b, result);
    
    // Test process
    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);

        // Test case: 1 + 2
        a = 32'd1;
        b = 32'd2;
        #10;

        //Test case: 10 + 20
        a = 32'd10;
        b = 32'd10;

        #10

        $finish;
    end
    
endmodule
