# Hydride

Hydride is a retargetable and extensible synthesis-based compiler for modern hardware architectures. 

Hydride has two major components:
- Automatic IR Generator - It is responsible for automatically designing and generating code generation support for language- and target-independent, retargetable compiler IR that we call AutoLLVM IR. 
- Code Synthesizer - It automatically generates AutoLLVM IR instructions in a solver-aided language called Rosette for a given domain-specific code implemented in Halide, Pytorch and TensorFlow.

## Prerequisites

### Python
- Install [Python](https://www.python.org/downloads/) > 3.0.

### Z3
- Install [z3](https://github.com/Z3Prover/z3):
    - MacOS: `brew install z3`
    - Linux example: `sudo apt-get install -y z3`

### Racket 
- Install [Racket](https://download.racket-lang.org/)
    - Linux example (works for all versions of Racket): 
    ```bash
    wget https://download.racket-lang.org/installers/8.6/racket-8.6-x86_64-linux-cs.sh
    sh racket-8.6-x86_64-linux-cs.sh
    ```

## Directory Structure
- `code-syntheizer` contains the experimental files for adding the notion of cost for different benchmark kernels and code for grammar generator.
- `codegen-generator` contains the custom compiler to generate target-agnostic semantics for target ISAs in Rosette for synthesis, LLVM IR extensions and legalization code for generating low-level code executable on a given supported target.
- `frontends` contains modified versions of DSL compilers Hydride supports (Halide and MLIR).
- `backends` contains modified version of low-level compilers like LLVM that contains backends to different targets.
- `rosette` is the modified version of Rosette necessary for Hydride.
- `benchmarks` contains the benchmarks on which Hydride is evaluated against other mainline DSL compilers.

## Instructions to install Hydride
From the root directory, run the setup bash script to set up appropriate paths first.
```
source setup.sh
```
Install the frontends and backends, and Rosette and Hydride code synthesizer by running the following install script. 
```
bash install.sh
```
Now you are ready to use Hydride!

## Targets Supported

Hydride, as a vectorizer supports the following instruction sets:

- x86 (SSE, SSE2, AVX, AVX2, AVX512 (includes VNNI), MMX, FMA)
- Hexagon (HVX)
- AArch64 (Neon)

## Publication

The first paper on Hydride was published at ASPLOS 2024. In this paper we demonstrate Hydride's powerful vectorization capabilities and competitive performance of the code it generates for a variety of vector instruction sets. You can download the
paper [from ACM Digital Library](https://dl.acm.org/doi/abs/10.1145/3620665.3640385).
If you use Hydride, please cite both the compiler and the paper!

```
@inproceedings{kothari2024hydride,
  title={Hydride: A Retargetable and Extensible Synthesis-based Compiler for Modern Hardware Architectures},
  author={Kothari, Akash and Noor, Abdul Rafae and Xu, Muchen and Uddin, Hassam and Baronia, Dhruv and Baziotis, Stefanos and Adve, Vikram and Mendis, Charith and Sengupta, Sudipta},
  booktitle={Proceedings of the 29th ACM International Conference on Architectural Support for Programming Languages and Operating Systems, Volume 2},
  pages={514--529},
  year={2024}
}
```

