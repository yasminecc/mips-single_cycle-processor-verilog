`timescale 1ns / 1ps
`include "aluctrl.v"

module aluctrl_tb;

    // Inputs
    reg [1:0] alu_op;
    reg [5:0] func;
    
    // Output
    wire [3:0] alu_ctrl;
    
    Aluctrl aluctrl (alu_op, func, alu_ctrl);
    
    initial begin

        $dumpfile("aluctrl.vcd");
        $dumpvars(0, aluctrl_tb);

        // Test case 1: alu_op = 00 (ADD)
        alu_op = 2'b00;
        #10;

        // Test case 2: alu_op = 01 (SUB)
        alu_op = 2'b01;
        #10;

        // Test case 3: alu_op = 10 and func = ADD (func = 100000)
        alu_op = 2'b10;
        func = 6'b100000;  // ADD
        #10;

        // Test case 4: alu_op = 10 and func = SUB (func = 100010)
        alu_op = 2'b10;
        func = 6'b100010;  // SUB
        #10;

        // Test case 5: alu_op = 10 and func = AND (func = 100100)
        alu_op = 2'b10;
        func = 6'b100100;  // AND
        #10;

        // Test case 6: alu_op = 10 and func = OR (func = 100101)
        alu_op = 2'b10;
        func = 6'b100101;  // OR
        #10;

        // Test case 7: alu_op = 11 (ADDI)
        alu_op = 2'b11;
        #10;

        // Test case 5: alu_op = 10 and undefined func
        alu_op = 2'b10;
        func = 6'b111111;  // Undefined function code
        #10;

        // Finish the simulation
        $finish;
    end
    
endmodule