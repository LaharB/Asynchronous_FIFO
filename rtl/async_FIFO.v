`include "synchronizer.v"
`include "wptr_handler.v"
`include "rptr_handler.v"
`include "fifo_mem.v"

module async_FIFO #(parameter DEPTH = 8, DATA_WIDTH = 8)(
    //input data
    input [DATA_WIDTH-1:0] data_in,
    //from write domain 
    input wclk,
    input wrst_n,
    //from read domain
    input rclk,
    input rrst_n,
    //output data
    output reg [DATA_WIDTH-1:0] data_out,
    //output from FIFO
    output reg full,  //coming from write domain
    output reg empty //coming from read domain 
);
    //FIFO DEPTH calc
    parameter PTR_WIDTH = $clog2(DEPTH);

    //wires 
    wire [PTR_WIDTH:0] g_wptr_sync, g_rptr_sync;
    wire [PTR_WIDTH:0] b_wptr, b_rptr;
    wire [PTR_WIDTH:0] g_wptr, g_rptr;




endmodule