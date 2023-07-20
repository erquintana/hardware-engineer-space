# Project Title: UART (Universal Asynchronous Receiver Transmitter) Communication Module

## Project Description:
Design and implement a UART Communication module that supports asynchronous serial communication between two devices. The UART module should have configurable parameters for baud rate, data bits, stop bits, and parity. It should support both transmission (TX) and reception (RX) of data in a full-duplex manner.

## Module Specifications:

### UART Communication Module:

#### Parameters:
BAUD_RATE: Configurable baud rate for UART communication (e.g., 9600, 115200, etc.).
DATA_BITS: Number of data bits per UART frame (e.g., 8, 7, 6, etc.).
STOP_BITS: Number of stop bits per UART frame (e.g., 1, 1.5, 2, etc.).
PARITY: Type of parity (e.g., None, Odd, Even, etc.).
#### Inputs:
clk: Clock signal for synchronous operations.
rst: Asynchronous reset signal to reset the UART module to its initial state.
data_in: Input signal to provide data to be transmitted (TX) or received (RX).
tx_start: Input signal to initiate the transmission of data.
rx_start: Input signal to initiate the reception of data.
#### Outputs:
data_out: Output signal to provide received data from the UART module (for RX).
tx_done: Output signal to indicate the completion of data transmission.
rx_done: Output signal to indicate the completion of data reception.
busy: Output signal to indicate whether the UART module is busy with a TX or RX operation.

### Testbench Module:

Instantiate the UART module and generate test stimuli to perform data transmission and reception.
Verify the correctness of the transmitted and received data by comparing the expected results with the actual results obtained from the UART module.
You can start by defining the UART module with the specified inputs and outputs. Then, implement the UART communication protocol inside the module to handle data transmission and reception based on the configured parameters. Finally, create a testbench to verify the functionality of the UART module using different test cases.