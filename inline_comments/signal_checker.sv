module signal_checker(
    input logic clk,
    input logic reset,
    input logic [7:0] data_signal
);

    // Check if data_signal is never all zeros after reset
    // Assertion to ensure data integrity
    property p_data_valid;
        @(posedge clk) reset || data_signal != 8'h00;
    endproperty
    assert property (p_data_valid) else $error("Data signal is invalid");

endmodule
