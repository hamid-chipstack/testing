module debounce(
    input logic clk,
    input logic reset,
    input logic switch_in,
    output logic switch_out
);
    reg [9:0] debounce_reg = 10'd0;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            debounce_reg <= 10'd0;
        else
            debounce_reg <= {debounce_reg[8:0], switch_in};
    end

    assign switch_out = (&debounce_reg); // Output is high only if all bits in debounce_reg are high
endmodule
