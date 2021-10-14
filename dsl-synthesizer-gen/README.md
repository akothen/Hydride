# Iterative DSL Synthesis

## Overview
The `run_synth.py` tool parses a dictionary file containing a description of racket function definitions and description of it's parameter types to synthesise an equivalent implementation as specified by Domain Specific Instructions defined in `tensor_dsl.py`. Currently, we support fully concrete iterative synthesis as well as concolic iterative synthesis. 

The user must specify the dictionary for their racket code according to the following structure:
```
{
	"<FUNCTION-NAME>" : {
		"semantics" : "<RACKET FUNCTION DEFINITION STRING>",
		"args" : [<LIST OF ARG NAMES>],
		"arg_types" : ["[BitVectorSymbolic | BitVectorConst]"*],
		"input_length" : [<INTEGER BITWIDTH>],
        "output_precision" : [<OUTPUT PRECISION HINT>]
	},
	...
}
```

The currently supported types for arguments include only Bitvectors. For each argument
we need to know the bit width of the argument being passed in as well we whether that particular
argument should be left as concrete during synthesis or a symbolic hole. If all the values
have types `BitVectorSymbolic` then direct Symbolic synthesis should be used (Yet to be implemented). Otherwise
if all the values have types `BitVectorConst` then Fully concrete iterative synthesis will be used. When 
at least one `BitVectorSymbolic` and one `BitVectorConst` is available then Concolic Iterative syntheis will be used.

An example for concrete iterative synthesis can be found in `user_concrete.spec`.
An example for concolic iterative synthesis can be found in `user_concolic.spec`.

If your `racket` binary is not part of your `PATH`, you will need to define the environment variable `RACKET_BINARY` as follows:

```
export RACKET_BINARY=<PATH/TO/YOUR/RACKET/BINARY>
```

## Usage
```
usage: run_synth.py [-h] [-v] [--utils UTILS] [--depth DEPTH] [--iterations ITERATIONS] [--scheme {bvops,arg_superset}] [--grammar GRAMMAR] reference

positional arguments:
  reference             Path to the file for the reference implementation dictionary

optional arguments:
  -h, --help            show this help message and exit
  -v, --verbose         Print debug messages during execution
  --utils UTILS         Path to the racket file which contains definitions of helper functions used (default = racket_utils.rkt)
  --depth DEPTH         The depth of the grammar tree considered during synthesis (default = 1)
  --iterations ITERATIONS
                        Maximum number of iterations to use during iterative synthesis (default = 3)
  --scheme {bvops,arg_superset}
                        The heurstic to use identify dsl instruction usage in the synthesis grammar (default = "bvops")
  --grammar GRAMMAR     Use specfied grammar file instead of generating one automatically
```

An example usage can be found by running the command:
```
python3 run_synth.py user_concrete.spec
```
