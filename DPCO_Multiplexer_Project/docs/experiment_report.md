# Experiment: Design and Simulation of a 4-to-1 Multiplexer

**Subject:** Digital Principles & Computer Organization (DPCO)

---

## 1. Aim
To design a 4-to-1 line Multiplexer using Verilog HDL, simulate it, and verify its truth table using a testbench.

## 2. Apparatus / Tools Required
- Computer with Verilog simulator (Icarus Verilog / ModelSim / Xilinx Vivado)
- GTKWave (for waveform viewing) — optional
- Text editor / IDE

## 3. Theory
A Multiplexer (MUX) is a combinational circuit with multiple input lines and a single output line. Select lines determine which one input line is connected to the output. For `n` select lines, up to `2^n` inputs can be selected. A 4-to-1 MUX therefore requires **2 select lines** to address **4 inputs**.

An **Enable (EN)** input is generally included: when EN = 0, the output remains LOW regardless of the data inputs or select lines, effectively disabling the circuit.

## 4. Boolean Expression
```
Y = EN . [ (I0.S1'.S0') + (I1.S1'.S0) + (I2.S1.S0') + (I3.S1.S0) ]
```

## 5. Truth Table

| EN | S1 | S0 | Y  |
|----|----|----|----|
| 0  |  X |  X | 0  |
| 1  |  0 |  0 | I0 |
| 1  |  0 |  1 | I1 |
| 1  |  1 |  0 | I2 |
| 1  |  1 |  1 | I3 |

## 6. Algorithm
1. Define module inputs (`I0`–`I3`, `SEL[1:0]`, `EN`) and output (`Y`).
2. Write the Boolean-expression-based `assign` statement (dataflow model) OR use a `case` statement inside an `always` block (behavioral model).
3. Write a testbench that applies distinct data patterns and sweeps through every `SEL` combination, with `EN` both off and on.
4. Compile the design and testbench together.
5. Run the simulation and observe/verify the console output or waveform against the truth table.

## 7. Verilog Program

### Dataflow Model
See [`../src/mux_4to1.v`](../src/mux_4to1.v)

### Behavioral Model
See [`../src/mux_4to1_behavioral.v`](../src/mux_4to1_behavioral.v)

### Testbench
See [`../testbench/mux_4to1_tb.v`](../testbench/mux_4to1_tb.v)

## 8. Procedure (Simulation)
```bash
iverilog -o sim/mux_sim src/mux_4to1.v testbench/mux_4to1_tb.v
vvp sim/mux_sim
```

## 9. Observed Output
```
===================================================
 EN | I0 I1 I2 I3 | SEL |  Y (expected)
===================================================
  0  |  1  0  1  0 |  00  |   0
  1  |  1  0  1  0 |  00  |   1
  1  |  1  0  1  0 |  01  |   0
  1  |  1  0  1  0 |  10  |   1
  1  |  1  0  1  0 |  11  |   0
  1  |  0  1  0  1 |  00  |   0
  1  |  0  1  0  1 |  01  |   1
  1  |  0  1  0  1 |  10  |   0
  1  |  0  1  0  1 |  11  |   1
===================================================
```

## 10. Result
The truth table of the 4-to-1 Multiplexer was verified through Verilog HDL simulation. All output combinations matched the expected theoretical values, confirming correct design and functionality.

## 11. Viva / Review Questions
1. What is the difference between a Multiplexer and a Demultiplexer?
2. Why does a 4-to-1 MUX need exactly 2 select lines?
3. What happens to the output when the Enable input is 0?
4. How would you extend this design to an 8-to-1 MUX?
5. Name two real-world applications of a Multiplexer.
6. What is the IC number commonly used for a Dual 4-to-1 line Multiplexer?
7. Write the Boolean expression for the output of a 4-to-1 MUX when S1S0 = 10.
8. How can a Multiplexer be used to implement any Boolean function?
