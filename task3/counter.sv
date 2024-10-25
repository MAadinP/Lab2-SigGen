module counter #(
    parameter BIT_WIDTH = 9
)( 
    input logic                     clk,
    input logic                     rst,
    input logic                     en,
    output logic [BIT_WIDTH-1:0]    count
);

always_ff @(posedge clk) 
    if(rst) count <= {BIT_WIDTH{1'b0}};
    else count <= count + {{BIT_WIDTH-1{1'b0}}, 1};
endmodule
