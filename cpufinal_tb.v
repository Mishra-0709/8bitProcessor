`timescale 1ns / 1ps

module cpu_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg clk = 0;
  reg reset = 0;

  wire [7:0] addr_bus;
  wire c_ri;
  wire c_ro;
  reg mem_clk;
  wire mem_io;
  wire [7:0] bus;

  // Instantiate the CPU
  cpu cpu_inst (
    .clk(clk),
    .reset(reset),
    .addr_bus(addr_bus),
    .c_ri(c_ri),
    .c_ro(c_ro),
    .mem_clk(mem_clk),
    .mem_io(mem_io),
    .bus(bus)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk <= ~clk;

  // Reset generation
  initial begin
    reset = 1;
    #50;
    reset = 0;
  end

  // Test case 1: Simple memory read operation
  initial begin
    #100; // Wait for a few cycles
    $display("Test Case 1: Simple memory read operation");
    // Set memory address to read from
    addr_bus = 8'hFF;
    // Assert read enable signal
    c_ri = 1;
    // Wait for a few cycles
    #10;
    // Check if data is received correctly
    if (bus !== 8'h00)
      $display("Test Case 1 failed! Expected: 8'h00, Got: %h", bus);
    else
      $display("Test Case 1 passed!");
    // Deassert read enable signal
    c_ri = 0;
    // Finish simulation
    $finish;
  end

  // Test case 2: Simple memory write operation
  initial begin
    #200; // Wait for a few cycles
    $display("Test Case 2: Simple memory write operation");
    // Set memory address to write to
    addr_bus = 8'hFF;
    // Set data to be written
    bus = 8'hFF;
    // Assert write enable signal
    c_ro = 1;
    // Wait for a few cycles
    #10;
    // Deassert write enable signal
    c_ro = 0;
    // Finish simulation
    $finish;
  end

  // Add more test cases here...

endmodule
