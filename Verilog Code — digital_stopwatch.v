module digital_stopwatch #(
    parameter CLK_FREQ = 10
)(
    input  wire       clk,
    input  wire       reset,
    input  wire       start_stop,
    output reg  [5:0] seconds,
    output reg  [5:0] minutes
);

reg [31:0] count;
reg running;

always @(posedge clk) begin

    if (reset) begin
        count   <= 0;
        seconds <= 0;
        minutes <= 0;
        running <= 0;
    end

    else begin

        // Start/Stop control
        if (start_stop)
            running <= ~running;

        // Time counting
        if (running) begin

            if (count == CLK_FREQ - 1) begin
                count <= 0;

                if (seconds == 59) begin
                    seconds <= 0;

                    if (minutes == 59)
                        minutes <= 0;
                    else
                        minutes <= minutes + 1;

                end
                else begin
                    seconds <= seconds + 1;
                end

            end
            else begin
                count <= count + 1;
            end
        end
    end
end

endmodule