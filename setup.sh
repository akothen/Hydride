
CUR_DIR=$(pwd)

export PYTHONPATH=$CUR_DIR/codegen-generator/targets/x86/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/codegen/rosette/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/codegen/llvm/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/rosette-ir/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/code-generator/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/fuzzer:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/rosette-lifter/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/low-level-codegen/:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/tools/similarity-checker:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/codegen-generator/transform:$PYTHONPATH
export PYTHONPATH=$CUR_DIR/llvmlite:$PYTHONPATH

export PATH=/home/akashk4/Hydride/llvm-project/build/bin/:$PATH
export PATH=/home/akashk4/Hydride/rosette/bin/:$PATH
