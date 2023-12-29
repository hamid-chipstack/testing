module memory_module #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10
)(
    input logic clk,
    input logic we, // Write enable
    input logic [ADDR_WIDTH-1:0] addr,
    input logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out
);
    reg [DATA_WIDTH-1:0] mem_array [(2**ADDR_WIDTH)-1:0];

    always_ff @(posedge clk) begin
        if (we)
            mem_array[addr] <= data_in;
    end

    assign data_out = mem_array[addr];
endmodule
