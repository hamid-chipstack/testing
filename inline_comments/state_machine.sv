module state_machine(
    input logic clk,
    input logic reset,
    input logic start,
    output logic done
);
    typedef enum logic [1:0] {IDLE, RUN, FINISH} state_t;
    state_t current_state, next_state;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always_comb begin
        case (current_state)
            IDLE: next_state = start ? RUN : IDLE;
            RUN: next_state = FINISH;
            FINISH: begin
                done = 1'b1;
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end
endmodule
