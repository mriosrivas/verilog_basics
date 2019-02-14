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