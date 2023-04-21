
CUR_DIR=$(pwd)

export HYDRIDE_ROOT=$CUR_DIR
export LLVM_ROOT=$CUR_DIR/frontends/halide/llvm-build
export LLVM_DIS_ROOT=$LLVM_ROOT
export LLVM_CONFIG=$LLVM_DIS_ROOT/bin/llvm-config
export HALIDE_SRC=$CUR_DIR/frontends/halide
export HALIDE_DISTRIB=$HALIDE_SRC/distrib

export INTRINSICS_LL=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/x86/x86_wrappers.c.ll
export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/build/libX86Legalizer.so

export PYTHONPATH=$CUR_DIR/codegen-generator/targets/x86/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/targets/arm/:$PYTHONPATH
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
export PYTHONPATH=$CUR_DIR/codegen-generator/analysis:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/transformations-verifier:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/llvmlite:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/code-synthesizer/dsl-ir:$PYTHONPATH

export PATH=$LLVM_ROOT/bin/:$PATH
export PATH=$CUR_DIR/rosette/bin/:$PATH
export PATH=$CUR_DIR/bin/:$PATH

export LD_LIBRARY_PATH=/home/scarlet/Hydride/frontends/halide/distrib/lib:/home/scarlet/Hydride/codegen-generator/tools/low-level-codegen/build:$LD_LIBRARY_PATH