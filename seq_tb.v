module seq_tb();
    // Declare testbench signals
    reg x, clk, clr;    // Input signals for the DUT (Device Under Test)
    wire z;             // Output signal from the DUT

    // Instantiate the DUT
    seq DUT(.x(x), .clk(clk), .z(z), .clr(clr));

    // Initial block for initializing signals and controlling the test sequence
    initial begin
        clk = 1'b0;     // Initialize clock to 0
        clr = 1'b1;     // Initialize clear to 1 (active)
        #15 clr = 1'b0; // Deactivate clear after 15 time units
    end

    // Clock generation logic: toggle the clock every 5 time units
    always #5 clk = ~clk;

    // Initial block for test stimulus and waveform generation
    initial begin
        $dumpfile("example.vcd");   // Specify the name of the VCD file for waveform dumping
        $dumpvars(0, seq_tb);       // Dump all variables in the testbench
        $monitor($time, " x=%2b, z=%2b", x, z); // Monitor and display changes in x and z

        // Apply test stimulus
        #12 x = 1'b1; #10 x = 1'b0; // Apply x = 1, then x = 0 after 10 time units
        #10 x = 1'b1; #10 x = 1'b0; // Repeat the process to cover various state transitions
        #10 x = 1'b1; #10 x = 1'b0;
        #10 x = 1'b1; #10 x = 1'b0;
        #10 x = 1'b1; #10 x = 1'b0;
        #10 x = 1'b1; #10 x = 1'b0;
        #10 x = 1'b1; #10 x = 1'b0;
        #10 x = 1'b1; #10 x = 1'b0;
        #5 $finish; // End the simulation
    end
endmodule
