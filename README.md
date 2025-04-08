# MIPS Microprocessor in Verilog – Multi-Module Design & Simulation

This project implements a simplified single-cycle MIPS microprocessor using Verilog HDL. It includes core datapath components such as ALU, control units, memory modules, and a top-level testbench to simulate instruction execution.

All modules were tested using individual Verilog testbenches and simulated using ModelSim.

---

## 🧠 Features

- **R-type and I-type instruction support**
- Modular design of datapath components:
  - ALU
  - Register File
  - Program Counter
  - Instruction/Data Memory
  - Control & ALU Control Units
  - Sign Extend, Shift Left 2, Muxes
- Fully integrated `top.v` simulates the processor with a real instruction program
- Testbenches provided for each module

---

## 🗂 File Structure

| File                | Description                                      |
|---------------------|--------------------------------------------------|
| `top.v`             | Top-level module integrating all submodules      |
| `top_tb.v`          | Testbench for top-level processor simulation     |
| `sample.s`          | Sample program (used for initializing memory)    |
| `alu.v`             | ALU implementation                               |
| `aluctrl.v`         | ALU control logic                                |
| `control.v`         | Main control unit                                |
| `pc.v`              | Program counter                                  |
| `regfile.v`         | Register file with dual-read, write capabilities |
| `dmem.v`, `imem.v`  | Data and instruction memory                      |
| `mux.v`, `shiftleft2.v`, `sigext.v` | Supporting components             |
| `*_tb.v`            | Testbenches for each module                      |
| `Yasmine_Elsisi_yme2013_lab_4.pdf` | Project documentation/report        |

---

## ▶️ How to Simulate

Run the modules using ModelSim or any Verilog simulator:

```sh
vlog top.v top_tb.v
vsim work.top_tb
run -all
```

Or simulate components individually with their testbenches.

---

## 🧾 Report

See `Yasmine_Elsisi_yme2013_lab_4.pdf` for:
- Instruction breakdown
- Simulation outputs
- Design notes and results

---

## 👩‍💻 Author

**Yasmine Elsisi**  
Computer Engineering @ NYU Abu Dhabi  
[GitHub](https://github.com/YasmineElsisi)
