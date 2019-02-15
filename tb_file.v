module top_tb;
    reg [7:0] t_in;
    reg t_clk;
    wire [7:0] t_out;

top tb_top( .in(t_in), .clk(t_clk), .out(t_out));


initial
begin
$monitor(t_clk, t_in, t_out);

t_in = 23;
t_clk = 1'b0;

#10 t_in = 7;
#10 t_in = 10;
#10 t_in = 4;
#10 t_in = 13;
end


always
 #5  t_clk =  !t_clk;
   
endmodule
