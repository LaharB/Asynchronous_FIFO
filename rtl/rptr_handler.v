module rptr_handler #(parameter PTR_WIDTH = 3)(
    input rclk, rrst_n, r_en,
    input [PTR_WIDTH:0] g_wptr_sync, //coming from write domain through Synchr
    output reg [PTR_WIDTH:0] b_rptr, 
    output reg [PTR_WIDTH:0] g_prtr //going to write domain through Synchr
);

    wire [PTR_WIDTH:0] b_rptr_next; //next value of b_rptr_next
    wire [PTR_WIDTH:0] g_rptr_next; //



endmodule 