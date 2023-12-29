module error_handling_module(
    input logic clk,
    input logic [7:0] data_in,
    output logic [7:0] data_out,
    output logic error_flag
);
    always_ff @(posedge clk) begin
        if (data_in == 8'hFF) begin
            error_flag <= 1'b1;
            data_out <= 8'h00;
        end else begin
            error_flag <= 1'b0;
            data_out <= data_in;
        end
    end
endmodule
