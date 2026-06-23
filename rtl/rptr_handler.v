module rptr_handler #(parameter PTR_WIDTH = 3)(
    input rclk, rrst_n, r_en,
    input [PTR_WIDTH:0] g_wptr_sync, //coming from write domain through Synchr
    output reg [PTR_WIDTH:0] b_rptr, 
    output reg [PTR_WIDTH:0] g_rptr, //going to write domain through Synchr
    output reg empty
);

    wire [PTR_WIDTH:0] b_rptr_next; //to store next value of b_rptr
    wire [PTR_WIDTH:0] g_rptr_next; //to store next value of g_rptr

    wire rempty; //to store status of 

    //bin2gray 
    assign b_rptr_next = b_rptr + (r_en && !empty);
    assign g_rptr_next = (b_rptr_next>>1) ^ b_rptr_next;

    //empty flag status computation 
    assign rempty = (g_wptr_sync == g_rptr_next);

    //always block to update bin and gray read ptr 
    always@(posedge rclk or negedge rrst_n) //async read reset 
        begin
            if(!rrst_n)
                begin
                    b_rptr <= 0; //default value
                    g_rptr <= 0; 
                end 
            else
                begin
                    b_rptr <= b_rptr_next;
                    g_rptr <= g_rptr_next;
                end   
        end
    
    //always block for updating empty flag status
    always@(posedge rclk or negedge rrst_n)
        begin
            if(!rrst_n)
                begin
                    empty <= 0; //default value 
                end 
            else 
                begin
                    empty <= rempty;
                end
        end



endmodule 