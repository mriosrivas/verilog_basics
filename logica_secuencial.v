// Sequential Modules
module latch(
    input d,
    output reg q,
    input clk
    );
    
    always @(clk)
        q <= d;
endmodule


module flip_flop(
    input d,
    output reg q,
    input clk
    );
    
    always @(posedge clk)
        q <= d;
endmodule

// Testbenches for sequential logic

// Testbench for Latch
module latch_tb;
reg t_d, t_clk;
wire t_q;

latch tb_latch( .d(t_d), .q(t_q), .clk(t_clk) );


initial
begin
$monitor(t_clk, t_d, t_q);

t_d = 1'b0;
t_clk = 1'b0;

#3  t_d = 1'b1;
#3 t_d = 1'b1;
#3 t_d = 1'b0;
end


always
 #5  t_clk =  !t_clk;
   
endmodule


// Testbench for Flip_Flop
module flip_flop_tb;
reg t_d, t_clk;
wire t_q;

flip_flop tb_flip_flop( .d(t_d), .q(t_q), .clk(t_clk) );


initial
begin
$monitor(t_clk, t_d, t_q);

t_d = 1'b0;
t_clk = 1'b0;

#3  t_d = 1'b1;
#3 t_d = 1'b1;
#3 t_d = 1'b0;
end


always
 #5  t_clk =  !t_clk;
   
endmodule


// Testbench for both
module top_tb;
reg t_d, t_clk;
wire t_q_latch, t_q_flip_flop;

latch tb_latch( .d(t_d), .q(t_q_latch), .clk(t_clk) );
flip_flop tb_flip_flop( .d(t_d), .q(t_q_flip_flop), .clk(t_clk) );



initial
begin
$monitor(t_clk, t_d, t_q_latch, t_q_flip_flop);

t_d = 1'b0;
t_clk = 1'b0;

#3  t_d = 1'b1;
#3 t_d = 1'b1;
#3 t_d = 1'b0;
end


always
 #5  t_clk =  !t_clk;
   
endmodule
