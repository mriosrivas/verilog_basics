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


// Mux8Way16
module mux8way16(a, b, c, d, e ,f, g, h, sel, out);

	input [15:0] a, b, c, d, e, f, g, h;
	input [2:0] sel;
	output reg [15:0] out;

always @(sel)
  begin
        case (sel)
        3'b000 : out = a;
        3'b001 : out = b;
	   3'b010 : out = c;
	   3'b011 : out = d;
	   3'b100 : out = e;
	   3'b101 : out = f;
	   3'b110 : out = g;
	   3'b111 : out = h;
	   default out = 3'b000;
        endcase
  end

endmodule

//Testbench definition for Mux8Way16
module mux8way16_tb;
wire [15:0] t_out;
reg [15:0] t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_h;
reg [2:0] t_sel;

mux8way16 my_gate( .a(t_a), .b(t_b), .c(t_c), .d(t_d), .e(t_e), .f(t_f), .g(t_g), .h(t_h), .sel(t_sel), .out(t_out) );

initial
begin
$monitor(t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_h, t_out);

t_a = 16'b0000000000000000;
t_b = 16'b0000000000000011;
t_c = 16'b0000000000001100;
t_d = 16'b0000000000110000;
t_e = 16'b0000000011000000;
t_f = 16'b0000001100000000;
t_g = 16'b0000110000000000;
t_h = 16'b0011000000000000;
t_sel = 3'b000;

#5
t_sel = 3'b000;

#5 
t_sel = 3'b001;

#5
t_sel = 3'b010;

#5 
t_sel = 3'b011;

#5
t_sel = 3'b010;

#5 
t_sel = 3'b011;

#5
t_sel = 3'b100;

#5 
t_sel = 3'b101;

#5 
t_sel = 3'b111;

end
endmodule
