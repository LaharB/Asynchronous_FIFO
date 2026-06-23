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
    input w_en,
    //from read domain
    input rclk,
    input rrst_n,
    input r_en,
    //output data
    output [DATA_WIDTH-1:0] data_out,
    //output from FIFO
    output full,  //coming from write domain
    output empty //coming from read domain 
);
    //FIFO DEPTH calc
    parameter PTR_WIDTH = $clog2(DEPTH);

    //wires 
    wire [PTR_WIDTH:0] g_wptr_sync, g_rptr_sync;
    wire [PTR_WIDTH:0] b_wptr, b_rptr;
    wire [PTR_WIDTH:0] g_wptr, g_rptr;

    //2FF synchronizers
    //sending write pointer to read domain
    synchronizer #(PTR_WIDTH) sync_wptr(
        .clk(rclk),
        .rst_n(rrst_n),
        .data_in(g_wptr),
        .data_out(g_wptr_sync)
    );

    //sending read pointer to write domain
    synchronizer #(PTR_WIDTH) sync_rptr(
        .clk(wclk),
        .rst_n(wrst_n),
        .data_in(g_rptr),
        .data_out(g_rptr_sync)
    );

    //Write pointer handler
    wptr_handler #(PTR_WIDTH) wptr_hlr(
        .wclk(wclk), 
        .wrst_n(wrst_n), 
        .w_en(w_en),
        .g_rptr_sync(g_rptr_sync), //coming from read domain thorugh synchr
        .b_wptr(b_wptr), //going to FIFO mem 
        .g_wptr(g_wptr), //going to read_domain through synchr
        .full(full)
    );

    //Read pointer handler
    rptr_handler #(PTR_WIDTH) rptr_hlr(
        .rclk(rclk), 
        .rrst_n(rrst_n), 
        .r_en(r_en),
        .g_wptr_sync(g_wptr_sync), //coming from write domain through Synchr
        .b_rptr(b_rptr), 
        .g_rptr(g_rptr), //going to write domain through Synchr
        .empty(empty)   
    );

    //FIFO Mem
    fifo_mem #(DEPTH, DATA_WIDTH, PTR_WIDTH)(
        .data_in(data_in), 
        //form write domain 
        .wclk(wclk), 
        .w_en(w_en), 
        .b_wptr(b_wptr),
        .full(full),
        //from read domain resp 
        .rclk(rclk), 
        .r_en(r_en), 
        .b_rptr(b_rptr), 
        .empty(empty),
        //output data
        .data_out(data_out)
    );

endmodule