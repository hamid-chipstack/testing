module bus_monitor(
    input logic clk,
    input logic [31:0] address_bus,
    input logic read_enable,
    input logic write_enable
);
    property p_read_write_exclusive;
        @(posedge clk) !(read_enable && write_enable);
    endproperty
    assert property (p_read_write_exclusive) else $error("Read and write are both enabled");
endmodule
