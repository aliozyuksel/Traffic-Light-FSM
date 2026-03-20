`timescale 1ns/1ps

module tb_traffic_light();
    logic clk;
    logic reset;
    logic TAORB;
    logic [2:0] LA, LB;

    traffic_light_fsm dut (
        .clk(clk),
        .reset(reset),
        .TAORB(TAORB),
        .LA(LA),
        .LB(LB)
    );

    // 10ns period clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        TAORB = 1;

        #20 reset = 0;

        #50;

        TAORB = 0;

        #200;

        TAORB = 1;
        
        #200;
        $stop; 
    end
endmodule