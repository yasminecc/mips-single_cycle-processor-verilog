module Mux #(parameter WIDTH = 32)(in1, in2, select, out);

input wire [WIDTH-1:0] in1;
input wire [WIDTH-1:0] in2;
input wire select;
output wire [WIDTH-1:0] out;

assign out = select? in2:in1 ;

endmodule