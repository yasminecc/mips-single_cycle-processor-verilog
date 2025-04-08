module Aluctrl(
    input wire [1:0] alu_op,
    input wire [5:0] func,
    output reg [3:0] alu_ctrl
);

always @* begin
    case (alu_op)
        0: begin
            alu_ctrl <= 0;
        end

        1: begin
            alu_ctrl <= 1;
        end

        2: begin
            case (func)
                6'b100000: alu_ctrl <= 0;  // ADD
                6'b100010: alu_ctrl <= 1;  // SUB
                6'b100100: alu_ctrl <= 4;  // AND
                6'b100101: alu_ctrl <= 5;  // OR
                default: alu_ctrl <= 4'bx;
            endcase
        end

        3: begin
            alu_ctrl <= 0;
        end

    endcase
end

endmodule