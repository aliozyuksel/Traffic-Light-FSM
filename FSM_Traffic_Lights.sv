typedef enum logic [1:0] {
    ST_A_GREEN  = 2'b00, 
    ST_A_YELLOW = 2'b01, 
    ST_B_GREEN  = 2'b10, 
    ST_B_YELLOW = 2'b11  
} state_t;

module traffic_light_fsm (
    input  logic clk,
    input  logic reset,
    input  logic TAORB,
    output logic [2:0] LA, 
    output logic [2:0] LB  
);

    state_t current_state, next_state;
    logic [3:0] timer;

    //state Register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= ST_A_GREEN;
            timer <= 0;
        end else begin
            current_state <= next_state;
            if (current_state == next_state && (current_state == ST_A_YELLOW || current_state == ST_B_YELLOW))
                timer <= timer + 1;
            else
                timer <= 0;
        end
    end

    //next state
    always_comb begin
        next_state = current_state;
        case (current_state)
            ST_A_GREEN:  if (!TAORB) next_state = ST_A_YELLOW;
            ST_A_YELLOW: if (timer >= 4) next_state = ST_B_GREEN; //5 time unit delay! CHECK SIM RESULTS TO VERIFY!
            ST_B_GREEN:  if (TAORB)  next_state = ST_B_YELLOW;
            ST_B_YELLOW: if (timer >= 4) next_state = ST_A_GREEN; //DELAY RESULTS ATTACHED INTO GITHUB REPO AS WELL!
        endcase
    end

    //output
    always_comb begin
        case (current_state)
            ST_A_GREEN:  begin LA = 3'b001; LB = 3'b100; end
            ST_A_YELLOW: begin LA = 3'b010; LB = 3'b100; end
            ST_B_GREEN:  begin LA = 3'b100; LB = 3'b001; end
            ST_B_YELLOW: begin LA = 3'b100; LB = 3'b010; end
            default:     begin LA = 3'b100; LB = 3'b100; end
        endcase
    end
endmodule