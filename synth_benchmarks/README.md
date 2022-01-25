# Benchmarks

This directory contains directories for the benchmarks and provides a script to run the iterative synthesis (with concrete values). The file `common/dsl_common.rkt` provides a common dependency for all the benchmarks which provides definitions for various bitvector operations, DSL defintions using deep embedding which enable introspecting each operation recursively which are used to enforce various constraints such as type checking (compatibility on bitvector sizes and paramaeters), a simple cost model with a specific cost per operation, and structural re-enforcement.

## Description

| Benchmark         | Description                                                    |
| ----------------- | ---------------------------------------------------------------| 
| Matrix Multiply   | Matrix Multiplication between tensors of shape (2,4) and (4,6) |
| Convolution  2D   | 2D Convolution between a 4x4 input matrix and a 2x2 Kernel     |
| Blur              | Box Blur on a 6x6 Input matrix with a 3x3 blur window          |




Each benchmark requires a `JSON` file which describes the mode of synthesis and various configurable knobs which can control how synthesis and the constraints are specified.  An example of this benchmark is shown below:

```json
{
"SPEC_NAME": "tensor-conv2D",
"ARG_SIZES": [128, 32],
"SPEC_INVOKE_STR": "(tensor-conv2D {} 4 4 2 2 8)",
"SOLVER": "Z3",
"BITWIDTH": -1,
"DO_OPTIMIZE": 1,
"SPEC_IMPL": "conv_spec.rkt",
"GRAMMAR_IMPL": "conv_grammar.rkt",
"SYMMETRY": 1,
"COST_BOUND": -1
}

```

`SPEC_NAME` simplify is an identifier for the benchmark.

`ARG_SIZES` defines the sizes of the input vector/tensors in the number of bits in the order they are required in the reference implementation. For example, the above dictionary corresponds to the 2D convolution example
whose inputs are (4x4) image (with 8 bit precision per value) which corresponds to 128 bits, and a (2x2) filter which corresponds to 32 bits.

`SPEC_INVOKE_STR` defines the racket function call which invokes the reference implementation with a `{}` which would be replaced with specific arguments during synthesis. These values may correspond to concrete instances of tensors (e.g. during synthesis), or
symbolic bitvectors (e.g. during verification).

`SOLVER`: Refers to the underlying solver to use during synthesis. Valid options include `Z3` and `Boolector`.

`BITWIDTH`: By default, rosette models integers with infinite precision. If this value is set to `-1` then it will continue to use that modelling. By specifying a positive value ke for this field, non-bitvector integers will be modelled using finite precision k bit integers. This can speed up synthesis for the solvers. 

`DO_OPTIMIZE`:  If set to `1`, during synthesis the `optimize` construct is used in Rossette instead of `synthesis`. The `optimize`construct incorporates an additional constraint which is to minimize the cost of the synthesized result. Note that the output with `optimize` is *optimal* with respect to the costs assigned to the individual operations.

`SPEC_IMPL`: Defines the path to the reference implementation which contains the function specification in Rossette.

`GRAMMAR_IMPL`: Defines the path to the file which contains the grammar used for synthesis. The grammar defines the specific Target agnostic DSL instructions to use, what are the valid ways in which they can be stitched together and certain parameter values such as precision and vector lengths.

`SYMMETRY`: If set to `1`, this includes an additional constraint during synthesis which requires that the sub-expressions for all elements in the output vector/tensor have *identical* structure. That is, they must be composed of the same heirarchy of DSL instructions. Note that the specific parameter values of the DSL instructions may (and will) be different. This would introduce redundant operations in some of the sub-expressions (e.g. rotate by 0, add 0), however the structural constraint can enable us to _re-roll_ the output and potentially learn an inductive definition of the solution.

`COST_BOUND`: By setting this value to a positive integer k, this includes an additional constraint during synthesis which requires that the synthesized function's total cost be less than k.


## Usage
To execute each benchmark, the following command should be run (from within the specific benchmark directory):

```
python3 ../common/iteration.py <benchmark>.json
```


## Synthesis Limitations

Certain configurations of parameters are not-valid due to the limitations of the individual solvers. 

1. The `DO_OPTIMIZE` flag can not be used with the `SOLVER` set to `Boolector`. This is due to lack of native optimizations support in the `Boolector`. To control the cost of the synthesized function, users may set the `COST_BOUND` field to a positive value
to enforce an upper bound on the cost.

2. When the `Solver` is set tot `Boolector`, the `BITWIDTH` field must be set to some positive value k. This is due to the fact that `Boolector` can not model infinite precision Integers (as it's specialized to operation on bitvectors).













