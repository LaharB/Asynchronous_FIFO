`include "../rtl/async_FIFO.v"
`timescale 1ns/1ps

module tb();
    
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

    async_FIFO #(
        .DEPTH(DEPTH),
        .DATA_WIDTH(DATA_WIDTH)
        )
    DUT(
        .data_in(data_in),
        .wclk(wclk),
        .wrst_n(wrst_n),
        .w_en(w_en),
        .rclk(rclk),
        .rrst_n(rrst_n),
        .r_en(r_en),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    //initialize wclk and rclk
    initial begin
        wclk = 0;
        rclk = 0; 
   end

    //generate clock
    //write clk
    always #10 wclk = ~wclk; //50 Mhz write clock
    //read clk
    always #35 rclk = ~rclk; //14 Mhz read clock

    //task for write 
    task write_data(input [DATA_WIDTH-1:0]d_in);
        begin
            @(posedge wclk); //sync to positive edge of clock
            w_en = 1; //make w_en HIGH
            data_in = d_in;
            $display("Time:%0t, Data_in:%0d", $time, data_in);
            @(posedge wclk);
            w_en = 0;
        end


    endtask



   initial begin

   end 






endmodule