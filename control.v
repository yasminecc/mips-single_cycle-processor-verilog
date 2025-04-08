module Control(opcode,reg_dst, jump, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);

input wire [5:0] opcode;

output reg  reg_dst;
output reg  alu_src;
output reg  mem_to_reg;
output reg  reg_write;
output reg  mem_read;
output reg  mem_write;
output reg  branch;
output reg  jump;
output reg  [1:0]alu_op;

always @* begin
  case (opcode)
    6'b000000: begin
      reg_dst    <= 1;
      alu_src    <= 0;
      mem_to_reg <= 0;
      reg_write  <= 1;
      mem_read   <= 0;
      mem_write  <= 0;
      branch     <= 0;
      jump       <= 0;
      alu_op     <= 2'b10;  
    end
    6'b100011: begin
      reg_dst    <= 0;
      alu_src    <= 1;
      mem_to_reg <= 1;
      reg_write  <= 1;
      mem_read   <= 1;
      mem_write  <= 0;
      branch     <= 0;
      jump       <= 0;
      alu_op     <= 2'b00; 
    end
    6'b101011: begin
      reg_dst    <= 1'bx;
      alu_src    <= 1;
      mem_to_reg <= 1'bx;
      reg_write  <= 0;
      mem_read   <= 0;
      mem_write  <= 1;
      branch     <= 0;
      jump       <= 0;
      alu_op     <= 2'b00; 
    end
    6'b000100: begin
      reg_dst    <= 1'bx;
      alu_src    <= 0;
      mem_to_reg <= 1'bx;
      reg_write  <= 0;
      mem_read   <= 0;
      mem_write  <= 0;
      branch     <= 1;
      jump       <= 0;
      alu_op     <= 2'b01; 
    end
    6'b001000: begin
      reg_dst    <= 0;
      alu_src    <= 1;
      mem_to_reg <= 0;
      reg_write  <= 1;
      mem_read   <= 0;
      mem_write  <= 0;
      branch     <= 0;
      jump       <= 0;
      alu_op     <= 2'b11; 
    end
    6'b000010: begin
      reg_dst    <= 0;
      alu_src    <= 0;
      mem_to_reg <= 0;
      reg_write  <= 0;
      mem_read   <= 0;
      mem_write  <= 0;
      branch     <= 0;
      jump       <= 1;
      alu_op     <= 2'b00; 
    end
  endcase
end 

endmodule