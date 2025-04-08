module Shiftleft2 #(parameter WIDTH_in = 32, WIDTH_out = 32)(in, out);

input wire [WIDTH_in-1:0] in;
output wire [WIDTH_out-1:0] out;

assign out = in << 2;

endmodule