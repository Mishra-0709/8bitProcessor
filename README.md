# 8bitProcessor
This Verilog module implements a simple CPU (Central Processing Unit) with basic functionality such as instruction execution, memory access, register operations, and control logic. The CPU operates on a positive edge-triggered clock signal and supports a reset signal to initialize its state. It communicates with external components via various input and output ports.

Module Ports:

clk (input): Clock input signal for synchronization.
reset (input): Reset signal to initialize the CPU's state.
addr_bus (output[7:0]): Address bus output for memory access.
c_ri (output): Control signal indicating register input operation.
c_ro (output): Control signal indicating register output operation.
mem_clk (output): Clock signal for memory access synchronization.
mem_io (output): Selects memory if low or I/O if high.
bus (inout[7:0]): Bidirectional data bus for communication with external components.
Usage:
Instantiate this module in your Verilog design and provide appropriate connections to the input and output ports. Ensure that the necessary control signals and clock signals are properly connected. Customize the module parameters and connections according to your specific CPU design requirements.
