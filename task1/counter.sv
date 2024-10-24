module counter #(
    parameter BIT_WIDTH = 8
)( 
    input logic [BIT_WIDTH-1:0]     incr,
    input logic                     clk,
    input logic                     rst,
    input logic                     en,
    output logic [BIT_WIDTH-1:0]    count,
);

always_ff @(posedge clk) 
    if(rst) count <= {BIT_WIDTH{1'b0}};
    else if (en) count <= count + incr;
    else count <=  count;

endmodule
