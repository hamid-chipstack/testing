module data_path_checker(
    input logic clk,
    input logic reset,
    input logic valid_data,
    input logic [7:0] data
);
    property p_data_timing;
        @(posedge clk) valid_data |-> ##[1:3] data != 8'h00;
    endproperty
    assert property (p_data_timing) else $error("Data not received in time");
endmodule
