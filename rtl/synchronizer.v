module synchronizer #(parameter WIDTH = 3)(
    input clk,
    input rst_n,
    input [WIDTH:0] data_in,
    output reg [WIDTH:0] data_out
);

    reg [WIDTH:0] data_ms; //2nd FF of the syncrhronizer

    always@(posedge clk)
        begin
            if(!rst_n) begin
                data_ms  <= 0;
                data_out <= 0;
            end 
            else begin
                data_ms <= data_in;
                data_out <= data_ms;
            end  
        end

endmodule 