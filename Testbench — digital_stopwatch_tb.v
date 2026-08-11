`timescale 1ns/1ps

module digital_stopwatch_tb;

reg clk;
reg reset;
reg start_stop;

wire [5:0] seconds;
wire [5:0] minutes;

// Use a small clock frequency for fast simulation
digital_stopwatch #(
    .CLK_FREQ(10)
) uut (
    .clk(clk),
    .reset(reset),
    .start_stop(start_stop),
    .seconds(seconds),
    .minutes(minutes)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("stopwatch.vcd");
    $dumpvars(0, digital_stopwatch_tb);

    $monitor("Time=%0t | Reset=%b | Start/Stop=%b | Minutes=%d | Seconds=%d",
             $time, reset, start_stop, minutes, seconds);

    // Initial values
    clk = 0;
    reset = 1;
    start_stop = 0;

    #20;

    // Release reset
    reset = 0;

    // Start stopwatch
    #10;
    start_stop = 1;
    #10;
    start_stop = 0;

    // Run stopwatch
    #650;

    // Stop stopwatch
    start_stop = 1;
    #10;
    start_stop = 0;

    #100;

    // Reset stopwatch
    reset = 1;
    #20;
    reset = 0;

    #50;

    $finish;
end

endmodule