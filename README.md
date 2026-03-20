
# Traffic Light Controller FSM (with Delay)

[cite_start]This repository contains the SystemVerilog implementation of a timed Finite State Machine (FSM) for a Traffic Light Controller, developed as part of the **Hacettepe University ELE432 Advanced Digital Design** course[cite: 1, 2].

## Project Overview
[cite_start]The goal of this assignment is to design a 4-state FSM that manages traffic lights for two intersecting streets (Street A and Street B) with a specific timing constraint: a **5-second delay** for yellow light transitions[cite: 4, 20].

### System Specifications
* [cite_start]**Inputs:** `clk`, `reset`, `TAORB` (Traffic at Street A or Street B)[cite: 15].
* [cite_start]**Outputs:** Light states for Street A (LA) and Street B (LB) in [Red, Yellow, Green] format[cite: 19].
* [cite_start]**Timing:** Internal counter resets upon state transitions and ensures 5 units of delay during Yellow states (S1 and S3)[cite: 23, 33].

## FSM State Diagram
The FSM consists of the following states:
1.  **S0 (ST_A_GREEN):** Street A is Green, Street B is Red. [cite_start]Stays here while `TAORB` is true[cite: 21].
2.  **S1 (ST_A_YELLOW):** Street A is Yellow, Street B is Red. [cite_start]Holds for 5 cycles[cite: 23].
3.  **S2 (ST_B_GREEN):** Street A is Red, Street B is Green. [cite_start]Stays here while `~TAORB` is true[cite: 25].
4.  **S3 (ST_B_YELLOW):** Street A is Red, Street B is Yellow. [cite_start]Holds for 5 cycles[cite: 27].

## Simulation Results
Below is the simulation waveform captured from QuestaSim, demonstrating the state transitions and the 5-unit timer logic:

![Simulation Waveform](./results.png)

## Implementation Details
* [cite_start]**Language:** SystemVerilog[cite: 12].
* [cite_start]**Methodology:** Separated state register, next-state logic, and output logic for synthesizability[cite: 32].
* [cite_start]**Version Control:** Developed using Git workflow as per assignment requirements[cite: 6].

## Author
* [Adın Soyadın] - Electrical and Electronics Engineering, Hacettepe University
