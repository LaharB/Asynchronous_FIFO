module wptr_handler #(parameter PTR_WIDTH=3)(
    input wclk, wrst_n, w_en,
    input [PTR_WIDTH:0] g_rptr_sync, //coming from read domain thorugh synchr
    output [PTR_WIDTH:0] b_wptr, //going to FIFO mem 
    output [PTR_WIDTH:0]g_wptr, //going to read_domain through synchr
    output reg full //full flag 
);

    reg [PTR_WIDTH:0] b_wptr_next; //next value of b_wptr
    reg [PTR_WIDTH:0] g_ptr_next;  //next value of g_wptr

    wire wfull;

    


endmodule 
