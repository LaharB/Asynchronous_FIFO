module wptr_handler #(parameter PTR_WIDTH = 3)(
    input wclk, wrst_n, w_en,
    input [PTR_WIDTH:0] g_rptr_sync, //coming from read domain thorugh synchr
    output reg [PTR_WIDTH:0] b_wptr, //going to FIFO mem 
    output reg [PTR_WIDTH:0] g_wptr, //going to read_domain through synchr
    output reg full //full flag 
);

    wire [PTR_WIDTH:0] b_wptr_next; //var to store next value of b_wptr
    wire [PTR_WIDTH:0] g_ptr_next;  //var to store next value of g_wptr

    wire wfull;

    //bin2gray coversion
    assign b_wptr_next = b_wptr + (w_en + !full);
    assign g_wptr_next = (b_wptr_next>>1)^b_wptr_next;

    //always block for incrementing bin and gray write ptr 
    always@(posedge wclk or negedge wrst_n) //async w_rst 
        begin
            if(!wrst_n) 
                begin
                    b_wptr <= 0; //set default value 
                    g_wptr <= 0;  
                end
            else 
                begin
                    b_wptr <= b_wptr_next; //pass the incremented bin wr ptr
                    g_wptr <= g_wptr_next; //pass the increment gray wr ptr
                end
        end

    //always block for computing full flag status  
    always@(posedge wclk or negedge wrst_n)
        begin
            if(!wrst_n)
                begin
                    full <= 0;
                end
            else 
                begin
                    full <= wfull;
                end
        end

    //computation of wrap around condition
    assign wfull = (g_wptr_next == {g_rptr_sync[PTR_WIDTH:PTR_WIDTH-1], g_rptr_sync[PTR_WIDTH-2:0]}); //2 MSBs and rest 2 bits


endmodule 
