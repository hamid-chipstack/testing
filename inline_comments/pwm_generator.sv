module pwm_generator(
    input logic clk, // Clock input
    input logic reset, // Asynchronous reset
    input logic [7:0] duty_cycle, // Duty cycle input (0-255)
    output logic pwm_out // PWM output signal
);
    reg [7:0] counter = 0; // 8-bit counter

    // PWM logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 0; // Reset counter to 0 on reset
        else
            counter <= counter + 1'b1; // Increment counter

        pwm_out <= (counter < duty_cycle) ? 1'b1 : 1'b0; // Generate PWM signal
    end
endmodule
