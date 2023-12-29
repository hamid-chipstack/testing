module clock_divider(
    input logic clk_in,
    input logic reset,
    output logic clk_out
);
    reg [31:0] counter = 32'd0;
    always_ff @(posedge clk_in or posedge reset) begin
        if (reset)
            counter <= 32'd0;
        else
            counter <= counter + 1'b1;
    end

    assign clk_out = counter[31]; // Divides the clock frequency by 2^32
endmodule
