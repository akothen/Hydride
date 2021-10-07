# Iterative DSL Synthesis

## Overview
The `run_synth.py` tool parses a dictionary file containing a description of racket function definitions and description of it's parameter types to synthesise an equivalent implementation as specified by Domain Specific Instructions defined in `tensor_dsl.py`.

The user must specify the dictionary for their racket code according to the following structure:
```
{
	"<FUNCTION-NAME>" : {
		"semantics" : "<RACKET FUNCTION DEFINITION STRING>",
		"args" : [<LIST OF ARG NAMES>],
		"arg_types" : ["BitVector"*],
		"input_precision" : [<INTEGER BITWIDTH>]
	},
	...
}
```

The currently supported types for arguments include only Bitvectors. For each argument
we need to know the bit width of the argument being passed in. An example can be found in `user_spec.py`

## Usage
```
usage: run_synth.py [-h] [-v] [--utils UTILS] [--depth DEPTH] [--iterations ITERATIONS] reference

  
positional arguments:

reference Path to the file for the reference implementation dictionary

  
optional arguments:

-h, --help  show this help message and exit

-v, --verbose Print debug messages during execution

--utils UTILS Path to the racket file which contains definitions of helper functions used by reference

--depth DEPTH The depth of the grammar tree considered during synthesis (default = 1)

--iterations ITERATIONS

Maximum number of iterations to use during iterative synthesis (default = 3)
```

