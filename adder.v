module Adder(a,b, result);

input wire [31:0] a;
input wire [31:0] b;
output wire [31:0] result;

assign result = a + b;


endmodule