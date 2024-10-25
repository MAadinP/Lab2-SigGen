module sigdelay #(
    parameter   A_WIDTH = 9,
                D_WIDTH = 8
)(  
    input logic                 clk,
    input logic                 en,
    input logic                 rst,
    input logic                 wen,
    input logic                 ren,
    input logic [D_WIDTH-1:0]   mic_signal,
    input logic [A_WIDTH-1:0]   offset,
    output logic [D_WIDTH-1:0]  delayed_signal,
    output logic [A_WIDTH-1:0]  addr
);

logic [A_WIDTH-1:0] address;
assign addr = address;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .count (address)
);

ram2ports ram (
    .clk (clk),
    .wen (wen),
    .ren (ren),
    .waddr (address + offset),
    .raddr (address),
    .din (mic_signal),
    .dout (delayed_signal)
);


endmodule
