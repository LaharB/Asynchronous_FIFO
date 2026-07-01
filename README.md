# Design and Verification of Asynchronous FIFO 

This project showcases the design and verification of a parametrized Asynchronous FIFO with CDC handling.
The schematic has been generated and simulation has been performed using Siemens QuestaSim 10.7c Simulator.

An **Asynchronous First-In-First-Out (FIFO)** is memory buffer or queue.

- It is a critical structural component used to safely pass data between two systems operating on different, unsynchronized clock frequencies.
- Since write and read clocks are not synchronized, it is referred to as **asynchronous** FIFO.

-------------------------------------------------------------------

# Use Cases of FIFO

- Clock Domain Crossing (CDC): Transfer data between blocks running on different clocks.
- Data Buffering: Smoothens data transfer between producer and consumer.
- Rate Matching: Balances data rates between fast and slow subsystems.
- Serial Communication: UART, SPI buffering.
- Pipeline Staging: Holds data in pipelined digital designs.
