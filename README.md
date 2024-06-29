# Overlapping Sequence Detector for Serial Input Sequence 101010

This repository contains the Verilog code and testbench for an overlapping sequence detector. The sequence detector identifies the serial input sequence `101010`.

## Overview

The sequence detector is designed to detect overlapping occurrences of the sequence `101010` in a serial bitstream. The detector outputs a high signal (`z = 1`) whenever it recognizes the sequence, including overlapping sequences.

## Features

- **Overlapping Detection**: The detector can identify overlapping sequences, ensuring that even if the sequence starts before the previous detection is complete, it will still be recognized.
- **Behavioral Description**: The detector is described behaviorally in Verilog, making it easy to understand and modify.

## Files

- `seq.v`: Verilog code for the sequence detector.
- `seq_tb.v`: Verilog testbench for simulating and verifying the sequence detector.
- `example.vcd`: Value Change Dump (VCD) file generated from the testbench simulation.

## Simulation

To simulate the sequence detector and visualize the results, use the provided testbench and VCD file. The simulation can be viewed using GTKWave.

![image](https://github.com/AKSHARDASH/Sequence-Detector/assets/134735494/61a75990-f160-41a6-a340-bc21f28462f9)



## Usage

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/yourusername/sequence-detector.git
    cd sequence-detector
    ```

2. **Run the Simulation**:
    Ensure you have a Verilog simulator (like Icarus Verilog) and GTKWave installed. Then, run the following commands:
    ```sh
    iverilog -o seq_tb seq.v seq_tb.v
    vvp seq_tb
    gtkwave example.vcd
    ```

3. **Observe the Output**:
    Open the generated `example.vcd` file in GTKWave to visualize the sequence detection.


