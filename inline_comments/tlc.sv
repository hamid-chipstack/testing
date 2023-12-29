module traffic_light_controller(
    input logic clk,
    input logic reset,
    input logic [2:0] current_state,
    output logic [2:0] next_state
);
    cover property (@(posedge clk) current_state == 3'b001 |-> next_state == 3'b010);
endmodule
