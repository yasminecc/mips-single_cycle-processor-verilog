`timescale 1ns / 1ps
`include "control.v"

module control_tb;

    // Inputs
    reg [5:0] opcode;
    
    // Outputs
    wire regDst;
    wire jump;
    wire branch;
    wire memRead;
    wire memtoReg;
    wire [1:0] aluOp;
    wire memWrite;
    wire aluSrc;
    wire regWrite;
    
    Control control (
        opcode, regDst, jump, branch, memRead, memtoReg, aluOp, memWrite, aluSrc, regWrite
    );
    
    initial begin

        $dumpfile("control.vcd");
        $dumpvars(0, control_tb);
        
        // Test case 1: R-type instruction (opcode = 000000)
        opcode = 6'b000000;
        #10;  // Wait 10 time units
        
        // Test case 2: lw (Load Word) instruction (opcode = 100011)
        opcode = 6'b100011;
        #10;  // Wait 10 time units
        
        // Test case 3: sw (Store Word) instruction (opcode = 101011)
        opcode = 6'b101011;
        #10;  // Wait 10 time units
        
        // Test case 4: beq (Branch if Equal) instruction (opcode = 000100)
        opcode = 6'b000100;
        #10;  // Wait 10 time units
        
        // Test case 5: jump instruction (opcode = 000010)
        opcode = 6'b000010;
        #10;  // Wait 10 time units

        // Test case 5: addi instruction (opcode = 001000)
        opcode = 6'b001000;
        #10;  // Wait 10 time units

        // Test case 6: default case (opcode = 111111, an invalid opcode)
        opcode = 6'b111111;
        #10;  // Wait 10 time units
        
        // Finish the simulation
        $finish;
    end
    
endmodule
