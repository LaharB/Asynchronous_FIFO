module fifo_mem #(parameter DEPTH = 8, DATA_WIDTH = 8, PTR_WIDTH = 3)(
    //input data
    input [DATA_WIDTH-1:0] data_in, 
    //form write domain 
    input wclk, 
    input w_en, 
    input [PTR_WIDTH:0] b_wptr,
    input full,
    //from read domain resp 
    input rclk, 
    input r_en, 
    input [PTR_WIDTH:0] b_rptr, 
    input empty,
    //output data
    output reg [DATA_WIDTH-1:0] data_out//add reg when doing syncr READ
);

    //FIFO
    reg [DATA_WIDTH-1:0] fifo[0:DEPTH-1];

    //wRITE into FIFO wrt write domain
    always@(posedge wclk)
        begin
            if(w_en && !full) //WRITE 
                begin
                    //need only 3 bits of PTR_WIDTHs for WRITE & READ
                    fifo[b_wptr[PTR_WIDTH-1:0]] <= data_in;     
                end 
        end


    //READ into FIFO wrt read domain
    always@(posedge rclk)
        begin
            if(r_en && !empty)
                begin
                    data_out <= fifo[b_rptr[PTR_WIDTH-1:0]];
                end
        end 
    
    /*
    //we are performing READ asynchronously
    assign data_out = fifo[b_rptr[PTR_WIDTH-1:0]];
    */


endmodule