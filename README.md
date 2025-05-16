# Strait of Messina Evolutionary Algorithm (SOMA)

SOMA is a novel hybrid evolutionary algorithm inspired by Bacterial Evolutionary Algorithms, Differential Evolution, and Genetic Algorithms. It introduces two custom operators — the **Scylla Operator** and the **Charybdis Bacterial Mutation** — inspired by Greek mythology, combined with a differential evolution-like mechanism.

This repository contains the MATLAB implementation of SOMA and the experiments described in our [conference paper](#publication).

## 🌊 Algorithm Overview

The SOMA algorithm operates in three evolutionary phases:

1. **Scylla Operator** – Enhances exploration with parallel, randomized mutation and crossover operations.
2. **Charybdis Bacterial Mutation** – Provides greedy convergence in early iterations, using local search inspired by bacterial behavior.
3. **Differential Evolution Step** – Combines the evolved population with a memory-based step to refine the search direction.

These steps are applied iteratively to solve optimization problems in both synthetic and real-world domains.
## 📁 Repository Structure

```
SOMA/
├── Main.m                         # Entry point for running SOMA
├── SOMA.m                         # Main SOMA implementation
├── CalculateCost.m                # Fitness function interface
└── SpecifyFunctionParameters.m    # Problem and algorithm parameters

## 🚀 Getting Started

### Requirements

- MATLAB R2024b or later
- No additional toolboxes required

### Usage

Run the main script:

```matlab
Main
```

This will execute the algorithm on one of the benchmark functions, depending on the settings in `SpecifyFunctionParameters.m`.

## 📜 Publication

This implementation is part of the research submitted as:

**"Solving Inverse Kinematics Problems Using Strait of Messina Algorithm"**  
*Szilárd Dávid Fecht, Márk Domonkos, János Botzheim*  
To appear at IntRobFAIR '25, June 23–25, 2025, Budapest, Hungary.

📄 [PDF coming soon]  
🔗 DOI: _to be updated_

## 📖 Citation

If you use this algorithm in your research, please cite our paper:

```bibtex
@inproceedings{fecht2025soma,
  author       = {Fecht, Szilárd Dávid and Domonkos, Márk and Botzheim, János},
  title        = {Solving Inverse Kinematics Problems Using Strait of Messina Algorithm},
  booktitle    = {Proceedings of IntRobFAIR '25},
  year         = {2025},
  publisher    = {ACM},
  address      = {Budapest, Hungary},
  doi          = {XXXXXXX.XXXXXXX}
}
```

## 🔓 License

This code is made available for **academic and non-commercial use**.  
License: [MIT License](LICENSE)

> For questions or contributions, please contact: [fecht@inf.elte.hu](mailto:fecht@inf.elte.hu)
