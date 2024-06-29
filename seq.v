module seq(
    input x,         // Input signal x
    input clk,       // Clock signal
    input clr,       // Asynchronous clear signal
    output reg z     // Output signal z
);

    // State encoding
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
    reg [2:0] PS, NS;  // PS: Present State, NS: Next State

    // State transition logic (synchronous with asynchronous clear)
    always @(posedge clk or posedge clr) begin
        if (clr)
            PS <= S0;    // Reset to initial state S0 when clear is active
        else
            PS <= NS;    // Transition to next state
    end

    // Next state logic (combinational)
    always @(*) begin
        case (PS)
            S0: NS = x ? S1 : S0;  // If x is 1, go to S1, otherwise stay in S0
            S1: NS = x ? S1 : S2;  // If x is 1, stay in S1, otherwise go to S2
            S2: NS = x ? S3 : S0;  // If x is 1, go to S3, otherwise go to S0
            S3: NS = x ? S1 : S4;  // If x is 1, go to S1, otherwise go to S4
            S4: NS = x ? S5 : S0;  // If x is 1, go to S5, otherwise go to S0
            S5: NS = x ? S1 : S4;  // If x is 1, go to S1, otherwise stay in S4
            default: NS = S0;      // Default state is S0
        endcase
    end

    // Output logic (synchronous with asynchronous clear)
    always @(posedge clk or posedge clr) begin
        if (clr)
            z <= 0;    // Reset output z when clear is active
        else begin
            case (PS)
                S0: z <= 0;  // Output z is 0 in state S0
                S1: z <= 0;  // Output z is 0 in state S1
                S2: z <= 0;  // Output z is 0 in state S2
                S3: z <= 0;  // Output z is 0 in state S3
                S4: z <= 0;  // Output z is 0 in state S4
                S5: z <= x ? 0 : 1;  // Output z is 0 if x is 1, otherwise 1 in state S5
                default: z <= 0;  // Default output is 0
            endcase
        end
    end
endmodule
