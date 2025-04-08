`timescale 1ns / 1ps
`include "mux.v"

module mux_tb;

    // Parameters
    parameter WIDTH = 32;

    // Inputs
    reg [WIDTH-1:0] in1;
    reg [WIDTH-1:0] in2;
    reg select;
    
    // Output
    wire [WIDTH-1:0] out;
  
    Mux #(WIDTH) mux (in1, in2, select, out);
    
    // Test process
    initial begin

        $dumpfile("mux.vcd");
        $dumpvars(0, mux_tb);

        // Test case 1: select = 0, should output in1
        in1 = 32'hABCDEF00;
        in2 = 32'h00FEDCBA;
        select = 1'b0;
        #10;
        
        // Test case 2: select = 1, should output in2
        select = 1'b1;
        #10;

        // Finish the simulation
        $finish;
    end
    
endmodule
