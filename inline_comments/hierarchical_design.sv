module hierarchical_design(
    input logic clk,
    input logic reset
);
    logic [7:0] counter_out;

    simple_counter u_counter(
        .clk(clk),
        .reset(reset),
        .count(counter_out[3:0])
    );

    complex_alu #(.WIDTH(8)) u_alu(
        .a(counter_out),
        .b(8'hAA),
        .operation(3'b010),
        .result()
    );
endmodule
