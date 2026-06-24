`include "../rtl/async_FIFO.v"

module tb;

    parameter DEPTH = 8;
    parameter DATA_WIDTH = 8;

    reg [DATA_WIDTH-1:0] data_in; 
    reg wclk;
    reg wrst_n;
    reg w_en;
    reg rclk;
    reg rrst_n;
    reg r_en;
    wire [DATA_WIDTH-1:0] data_out;
    wire full;  
    wire empty;

    async_FIFO DUT(

    );

    //initialize wclk and rclk
    initial begin
        wclk = 0;
        rclk = 0; 
   end

   //generate wclk and rclk
   //write clk
   always #10 wclk = ~wclk; //50 Mhz write clock
   always #35 rclk = ~rclk; //14 Mhz read clock

   intial 






endmodule