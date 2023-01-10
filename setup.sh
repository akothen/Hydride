
CUR_DIR=$(pwd)

export HYDRIDE_ROOT=$CUR_DIR
export LLVM_ROOT=$CUR_DIR/backends/llvm/build/
export LLVM_DIS_ROOT=$LLVM_ROOT
export LLVM_CONFIG=$LLVM_DIS_ROOT/bin/llvm-config
export HALIDE_DISTRIB=$CUR_DIR/frontends/halide/build

export INTRINSICS_LL=$CUR_DIR/code-synthesizer/dsl-ir/x86_wrappers.c.ll
export LEGALIZER_PATH=$CUR_DIR/backends/llvm/build/lib/LLVMX86Legalizer.so

export PYTHONPATH=$CUR_DIR/codegen-generator/targets/x86/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/targets/hexagon/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/codegen/rosette/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/codegen/llvm/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/rosette-ir/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/code-generator/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/fuzzer:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/rosette-lifter/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/similarity-checker:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/validity-checker:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/transform:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/llvmlite:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/code-synthesizer/dsl-ir:$PYTHONPATH

export PATH=$CUR_DIR/llvm-project/build/bin/:$PATH
export PATH=$CUR_DIR/rosette/bin/:$PATH
export PATH=$CUR_DIR/bin/:$PATH
