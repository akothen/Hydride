# Synthesis Benchmarks

This directory contains directories for the benchmarks and provides a script to run the iterative synthesis (with concrete values). Each benchmark is split into 3 seperate components.

1. *_common.rkt

This provides the definitions of various DSL instructions and function dependencies to define the DSL.
The default solver used by the SMT engine in Rosette is `Z3`. To switch to the `Boolector` solver, 
uncomment the `(current-solver boolector)` and `(current-bitwidth **)` statements.

2. *_synth.rkt

This provides the synthesis function which either does regular synthesis or cost-based synthesis if the `optimize`
construct is to be used.

3. *_verify.rkt

This provides the verification command for testing whether the spec and the synthesized solution are equivalent over symbolic inputs.


