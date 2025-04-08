`include "adder.v"
`include "alu.v"
`include "aluctrl.v"
`include "control.v"
`include "dmem.v"
`include "imem.v"
`include "mux.v"
`include "pc.v"
`include "regfile.v"
`include "shiftleft2.v"
`include "sigext.v"

module Top(clk);
    
    input wire clk;
    wire zero;
    
    // PC wires
    wire [31:0] pc_in; 
    wire [31:0] pc_out; 
    wire [31:0] pc_next; 
    
    // Instruction memory
    wire [31:0] instruction;
    
    // Control signals
    wire regDst;
    wire jump;
    wire branch;
    wire memRead;
    wire memtoReg;
    wire [1:0] aluOp;
    wire memWrite;
    wire aluSrc;
    wire regWrite;
    
    // Instruction fields
    wire [5:0] opcode = instruction[31:26];
    wire [4:0] rs_address = instruction[25:21];
    wire [4:0] rt_address = instruction[20:16];
    wire [4:0] rd_address = instruction[15:11];
    wire [5:0] funct = instruction[5:0];
    
    // Register file and ALU connections
    wire [31:0] rs_value;
    wire [31:0] rt_value;
    wire [31:0] alu_out;
    
    // Sign extension and shift wires
    wire [31:0] sigext_out;
    wire [27:0] shift_out;
    
    // Mux outputs
    wire [4:0] mux1_out;     // Select between rt and rd
    wire [31:0] mux2_out;    // Select between rt_value and immediate
    wire [31:0] mux3_out;    // Select between ALU result and memory data
    
    wire [3:0] alu_ctrl;
    wire [31:0] mem_read_out;
    wire [31:0] shift_out2;
    wire [31:0] branch_adder_out;
    wire [31:0] mux4_out;

    // PC Logic
    PC pc(clk, pc_in, pc_out);
    Adder adder_pc(pc_out, 4, pc_next);
    
    // Instruction Memory
    Imem imem(pc_out, instruction);
    
    // Control Unit
    Control control(opcode, regDst, jump, branch, memRead, memtoReg, aluOp, memWrite, aluSrc, regWrite);
    
    // Register File
    Mux #(5) mux1(rt_address, rd_address, regDst, mux1_out);  // Select between rt and rd
    RegisterFile regfile(clk, rs_address, rt_address, mux1_out, mux3_out, regWrite, rs_value, rt_value);
    
    // ALU control and execution
    Sigext sigext(instruction[15:0], sigext_out); // Sign extend immediate value
    Mux mux2(rt_value, sigext_out, aluSrc, mux2_out);  // Select between register value and immediate
    Aluctrl aluctrl(aluOp, funct, alu_ctrl); // ALU control signal generation
    Alu alu(alu_ctrl, rs_value, mux2_out, alu_out, zero); // ALU operation
    
    // Data Memory
    Dmem dmem(clk, alu_out, rt_value, memRead, memWrite, mem_read_out);
    
    // Final MUX for write-back stage
    Mux mux3(alu_out, mem_read_out, memtoReg, mux3_out); // Select between ALU output and memory data for write-back
    
    // Shift-left logic (for jump address calculation)
    Shiftleft2 #(26,28) shiftleft1(instruction[25:0], shift_out);
    
    // Shift-left logic for branch calculation
    Shiftleft2 shiftleft2(sigext_out, shift_out2);
    
    // Branch Adder (PC + Branch Offset)
    Adder branch_adder(shift_out2, pc_next, branch_adder_out);

    // Branch Decision Logic (branch AND zero)
    wire and_out = branch & zero;

    // MUX to select between PC + 4 or Branch Address
    Mux mux4(pc_next, branch_adder_out, and_out, mux4_out);

    // Jump address concatenation
    wire [31:0] jumpaddr = {pc_next[31:28], shift_out[27:0]};

    // MUX to select between PC for jump or branch
    Mux mux5(mux4_out, jumpaddr, jump, pc_in);

endmodule