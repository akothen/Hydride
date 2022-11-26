# Benchmarks
This directory contains the benchmarks used to evaluate Hydride on the Halide DSL compilers for HVX and X86. The instructions required to compile the benchmarks for the given targets is described below:


## Required Paths (common)
Users are required to export the following environment variables to be able to compile the benchmarks through Halide:
```
export HYDRIDE_ROOT=<PATH TO ROOT OF HYDRIDE_DIRECTORY>
export LLVM_DIS_ROOT=<PATH TO LLVM INSTALL DIR> # Details described in frontends/halide/README.md
export LLVM_CONFIG=$LLVM_DIS_ROOT/bin/llvm-config
export HALIDE_DISTRIB=<PATH TO HALIDE DISTRIB DIR built with Hydride>
```

User's also have to source the definitions for the codegen-generator which can be done by executing the following statement:
```
source $HYDRIDE_ROOT/setup.sh
```



## X86
To compile for X86, users need to define the variable `INTRINSICS_LL` to point to the LLVM Bitcode wrappers file which contains the X86 intrinsics. Currently, this file is found at `$HYDRIDE_ROOT/codegen-generator/tools/low-level-codegen/InstSelectors/x86_wrappers.c.ll` .

Additionally, they would need to build the LLVM shared object file `$HYDRIDE_ROOT/codegen-generator/tools/low-level-codegen/InstSelectors/x86/X86Legalizer.cpp` . The environment variable `LEGALIZER_PATH` should then point to the built shared object file.


## 	HVX
To compile for HVX, users need to define the variable `INTRINSICS_LL` to point to the LLVM Bitcode wrappers file which contains the HVX intrinsics. As HVX intrinsics exist for all HVX instructions targeted by Hydride, this variable should path to an empty bitcode file.

Additionally, they would need to build the LLVM shared object file `$HYDRIDE_ROOT/codegen-generator/tools/low-level-codegen/InstSelectors/hexagon/HexLegalizer.cpp` . The environment variable `LEGALIZER_PATH` should then point to the built shared object file.

## Benchmark Makefiles
Specific benchmarks can be executed by invoking them with make. For example, 
executing the benchmark median3x3 on X86:

```
cd x86-deprecated/halide # cd into the x86 specific directories
make median3x3
```

By default, Hydride is enabled. To compile the benchmark without Hydride run:
```
ENABLE_HYDRIDE=0 make median3x3
```

The default expression depth (i.e. depth of sub-expressions synthesized at a time) is 2. To change the expression depth size to 3 for example, you would run:

```
EXPR_DEPTH=3 make median3x3
```
