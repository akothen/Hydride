CUR_DIR=$(pwd)

# check if directory code-synthesizer exists:
if [ ! -d "code-synthesizer" ]; then
    echo "Please run the setup file at the root folder of the project"
    return
fi

export HYDRIDE_ROOT=$CUR_DIR
export LLVM_ROOT=$CUR_DIR/frontends/halide/llvm-build
export LLVM_DIS_ROOT=$LLVM_ROOT
export LLVM_CONFIG=$LLVM_DIS_ROOT/bin/llvm-config
export HALIDE_SRC=$CUR_DIR/frontends/halide
export HALIDE_DISTRIB=$HALIDE_SRC/distrib
export SIMILARITY_ENV=$CUR_DIR/similarityenv
export SIMILARITY_SUMMARY=$CUR_DIR/codegen-generator/tools/similarity-checker/summary/arm

# export INTRINSICS_LL=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/x86/x86_wrappers.c.ll
# export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/build/libX86Legalizer.so

# check first argument in a switch statement
case $1 in
    "x86")
        export INTRINSICS_LL=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/x86/x86_wrappers.c.ll
        export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/build/libX86Legalizer.so
        ;;
    "arm")
        export INTRINSICS_LL=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/arm/arm_wrappers.c.ll
        if [ $(uname -s) = "Darwin" ]; then
            export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/build/libARMLegalizer.dylib
        else
            export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/build/libARMLegalizer.so
        fi
        ;;
    "hexagon")
        # Nothing to do because hvx supports every instruction (?)
        ;;
    "visa")
        export INTRINSICS_LL=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/visa/visa_wrapper.ll
        export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/visa/build/libVISALegalizer.so
        ;;
    "aievec")
        export INTRINSICS_LL=$CUR_DIR/codegen-generator/tools/low-level-codegen/InstSelectors/aievec/aievec_wrappers.ll
        export LEGALIZER_PATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/build/libAIEVecLegalizer.so
        ;;
    *)
        echo "Please provide a valid target: x86, arm, hexagon, visa, aievec"
        return
        ;;
esac


export PYTHONPATH=$CUR_DIR/codegen-generator/targets/x86/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/targets/arm/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/targets/visa/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/targets/aievec/:$PYTHONPATH
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
export DYLD_LIBRARY_PATH=$HYDRIDE_ROOT/frontends/halide/distrib/lib:$HYDRIDE_ROOT/codegen-generator/tools/low-level-codegen/build:$DYLD_LIBRARY_PATH

export LD_LIBRARY_PATH=$HYDRIDE_ROOT/frontends/halide/distrib/lib:$HYDRIDE_ROOT/codegen-generator/tools/low-level-codegen/build:$LD_LIBRARY_PATH
