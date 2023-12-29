module complex_alu #(
    parameter WIDTH = 8
)(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    input logic [2:0] operation,
    output logic [WIDTH-1:0] result
);
    always_comb begin
        case (operation)
            3'b000: result = a + b;
            3'b001: result = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            default: result = {WIDTH{1'b0}};
        endcase
    end
endmodule
