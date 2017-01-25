`timescale 1ns / 1ps

//AND Gate
module andgate(a, b, out);
    input a, b;
    output out;
    
    assign out = a & b;

endmodule

//Testbench definition for AND Gate

module andgate_tb;
wire t_out;
reg t_a, t_b;

andgate my_gate( .a(t_a), .b(t_b), .out(t_out) );

initial
begin
$monitor(t_a, t_b, t_out);

t_a = 1'b0;
t_b = 1'b0;

#5
t_a = 1'b0;
t_b = 1'b1;

#5 
t_a = 1'b1;
t_b = 1'b0;

#5
t_a = 1'b1;
t_b = 1'b1;

end
endmodule



// AND Gate 16
module andgate16(a, b, out);
    input [15:0] a, b;
    output [15:0] out;
    
    assign out = a & b;

endmodule


//Testbench definition for AND Gate
module andgate16_tb;
wire [15:0] t_out;
reg [15:0] t_a, t_b;

andgate16 my_gate( .a(t_a), .b(t_b), .out(t_out) );

initial
begin
$monitor(t_a, t_b, t_out);

t_a = 16'b0;
t_b = 16'b0;

#5
t_a = 16'b0;
t_b = 16'b1111111111111111;

#5 
t_a = 16'b1111111111111111;
t_b = 16'b0;

#5
t_a = 16'b1111111111111111;
t_b = 16'b1111111111111111;

end
endmodule
