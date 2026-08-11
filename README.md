# digital-stopwatch-
Digital Stopwatch – Verilog

Description

A digital stopwatch designed using Verilog HDL to measure elapsed time in minutes and seconds with start, stop, and reset controls.

Features

- Start stopwatch
- Stop/pause stopwatch
- Reset stopwatch
- Counts seconds and minutes
- 7-segment display outputs
- Synchronous digital design

Inputs

Signal| Width| Description
"clk"| 1| Clock signal
"reset"| 1| Resets the stopwatch to 00:00
"start_stop"| 1| Starts or stops the stopwatch

Outputs

Signal| Width| Description
"minutes"| 2| Minute counter
"seconds"| 6| Second counter

Working

The stopwatch uses a clock divider to generate a 1-second timing pulse. When "start_stop" is enabled, the seconds counter increments every second. After 59 seconds, the seconds counter resets to zero and the minute counter increments.

The reset signal clears both counters and returns the stopwatch to "00:00".

Files

- "digital_stopwatch.v" – Stopwatch design
- "digital_stopwatch_tb.v" – Testbench for simulation

Simulation Using Icarus Verilog

iverilog -o stopwatch_sim digital_stopwatch.v digital_stopwatch_tb.v
vvp stopwatch_sim

To view the waveform:

gtkwave stopwatch.vcd

Expected Simulation

The simulation demonstrates:

00:00 → 00:01 → 00:02 → ... → 00:59 → 01:00

The stopwatch can be started, stopped, and reset during simulation.
author: Harshitha 