module fifo_mem #(parameter DEPTH = 8, DATA_WIDTH = 8, PTR_WIDTH = 3)(
    //input data
    input [DATA_WIDTH-1:0] data_in, 
    //form write domain 
    input wclk, w_en, 
    input [PTR_WIDTH:0] bwptr,
    input full,
    //from read domain resp 
    input rclk, r_en, 
    input [PTR_WIDTH:0] b_rptr, 
    input empty,
    //output data
    output [DATA_WIDTH-1:0] data_out
);


    //FIFO
    reg [DATA_WIDTH-1:0] fifo[]




endmodule