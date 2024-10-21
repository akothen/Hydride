# ASL Interpreter

## Introduction

Example implementation of Arm's Architecture Specification Language (ASL).

The ASL interpreter is a collection of resources to help you to
understand and make use of Arm's architecture specifications.
It consists of lexer, parser, typechecker and interpreter for the ASL language
and an interactive interface for evaluating ASL statements and expressions.

There is a [blog post](https://alastairreid.github.io/using-asli/)
describing how to use ASLi with Arm's v8.6-A ISA specification.

## Requirements

To build and run the ASL interpreter, you will need:

  * OCaml version 4.09 or later
  * OPAM OCaml version 2.0.5 (other versions may work)
  * The following OPAM packages
      * ocaml     - OCaml compiler
      * odoc      - OCaml documentation generator (optional)
      * dune      - OCaml build system
      * menhir    - parser generator tool
      * ott.0.29  - tool for defining language grammars and semantics (this version or later required)
      * linenoise - OCaml line editing library
      * pprint    - OCaml pretty-printing library
      * z3.4.7.1  - OCaml bindings for the Z3 SMT solver (exactly this version is required)
      * zarith    - OCaml multiprecision arithmetic library

## License and contribution

The software is provided under the [BSD-3-Clause licence](https://spdx.org/licenses/BSD-3-Clause.html).
Contributions to this project are accepted under the same licence.

This software includes code from one other open source projects

 * The [CIL project](https://people.eecs.berkeley.edu/~necula/cil/)
   defines a useful
   [visitor class](https://github.com/cil-project/cil/blob/936b04103eb573f320c6badf280e8bb17f6e7b26/src/cil.ml#L931)
   for traversing C ASTs.
   The file `visitor.ml` is a modified copy of this class that generalizes
   the type to work with an arbitrary AST.

   CIL is distributed under a [BSD-3-Clause licence](https://github.com/cil-project/cil/blob/develop/LICENSE).


## Building and development

### Directory structure

This interpreter consists of a single directory organized as follows

  * Metadata, documentation, etc:
      * `LICENCE`             - Software licence
      * `README.md`           - This file
      * `Makefile`            - build system file
  * Source code consisting of
      * Lexer
          * `libASL/lexer.mll`       - ASL lexer (ocamllex file)
          * `libASL/lexersupport.ml` - indentation-based parsing support
      * Grammar and Parser
          * `libASL/asl.ott`         - used to generate the ASL parser and abstract syntax tree (OTT file)
          * `libASL/asl_visitor.ml`  - code to traverse abstract syntax tree
          * `libASL/asl_utils.ml`    - code to transform abstract syntax tree
      * Typechecker
          * `libASL/tcheck.ml`       - typechecker
      * Interpreter
          * `libASL/primops.ml`      - implementation of ASL builtin types and operations
          * `libASL/value.ml`        - interpreter support code
          * `libASL/eval.ml`         - evaluator for ASL language
      * ASL standard library
          * `libASL/prelude.asl`     - builtin types and functions
      * Programs
          * `bin/asli.ml`         - interactive ASL tool
          * `bin/testlexer.ml`    - test program that converts ASL code to list of tokens
      * Misc
          * `libASL/utils.ml`        - utility code
  * Code copied from other open source projects
      * `libASL/visitor.ml`


### Installing dependencies

Platform specific instructions:
```
    MacOS:
        brew install opam
        brew install gmp mpir
    Ubuntu:
        sudo apt-get install opam
```

Platform independent instructions:

```
    opam install ocaml.4.09.0
    opam install dune
    opam install menhir
    opam install ott
    opam install linenoise
    opam install pprint
    opam install z3.4.7.1
    opam install zarith

    # the following are optional and only needed if modifying asli code
    opam install odoc
    opam install ocamlformat

    # On OSX, you may need to use this command to install zarith
    env CFLAGS="-I$HOME/homebrew/include/" LDFLAGS="-L$HOME/homebrew/lib/" opam install zarith

    eval `opam config env`
```

You also need to execute this command

```
    MacOS: export DYLD_LIBRARY_PATH=`opam config var z3:lib`
    Linux: export LD_LIBRARY_PATH=`opam config var z3:lib`
```


### Building

To build the ASL lexer and ASL interpreter, execute this command.

```
    make install
```

If you get a lot of linker errors involving Z3, double-check that you installed
the right version.

### Using ASL lexer

This displays a list of tokens in an ASL file including the indent
and dedent tokens used to support indentation-based parsing.

```
    $ dune exec bin/testlexer.exe prelude.asl
```

### Using ASL interpreter

This reads ASL files specified on the command line and
provides an interactive environment for executing ASL
statements and expressions.

```
    $ asli
                _____  _       _    ___________________________________
        /\     / ____|| |     (_)   ASL interpreter
       /  \   | (___  | |      _    Copyright Arm Limited (c) 2017-2019
      / /\ \   \___ \ | |     | |
     / ____ \  ____) || |____ | |   Version 0.1.1 alpha
    /_/    \_\|_____/ |______||_|   ___________________________________

    Type :? for help
    ASLi> 1+1
    2
    ASLi> ZeroExtend('11', 32)
    '00000000000000000000000000000011'
    ASLi> bits(32) x = ZeroExtend('11', 32);
    ASLi> x
    '00000000000000000000000000000011'
    ASLi> :quit
```

### Using ASL interpreter with Arm's public specifications

You can download Arm's v8-A architecture specification at
[https://developer.arm.com/architectures/cpu-architecture/a-profile/exploration-tools](https://developer.arm.com/architectures/cpu-architecture/a-profile/exploration-tools).
Historically, these are updated every 6 months with the latest "8.x" release
released in December.
You can download tools to unpack Arm's specification from
[https://github.com/alastairreid/mra_tools](https://github.com/alastairreid/mra_tools).

Clone the MRA tools release and follow the instructions to unpack Arm's
specification.
In the following, I will assume that this is in directory "../mra_tools".

```
    # follow the instructions in ../mra_tools/README.md for downloading the Arm specs
    make -C ../mra_tools clean
    make -C ../mra_tools
    make install
    asli prelude.asl ../mra_tools/arch/regs.asl ../mra_tools/types.asl ../mra_tools/arch/arch.asl ../mra_tools/arch/arch_instrs.asl ../mra_tools/arch/arch_decode.asl ../mra_tools/support/aes.asl ../mra_tools/support/barriers.asl ../mra_tools/support/debug.asl ../mra_tools/support/feature.asl ../mra_tools/support/hints.asl ../mra_tools/support/interrupts.asl ../mra_tools/support/memory.asl ../mra_tools/support/stubs.asl ../mra_tools/support/fetchdecode.asl
```

After loading the v8.6-A architecture spec, you can configure the
implementation defined behaviour, load an ELF file and run the
program as follows.
```
    :project tests/test.prj
    :quit
```
The test program prints the line "Test" so you should see output like this
```
ASLi> :project tests/test.prj
Loading ELF file tests/test_O2.elf.
Entry point = 0x400168
Test
Program exited by writing ^D to TUBE
Exception taken
```


Enjoy!
