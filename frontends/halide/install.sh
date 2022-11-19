HALIDE_ROOT=`pwd`
BUILD_DIR=$HALIDE_ROOT/llvm-build

LLVM_URL="https://github.com/llvm/llvm-project.git"
LLVM_BRANCH="release/12.x"

LLVM_SRC=$HALIDE_ROOT/llvm-project/llvm

# Install options
NUM_THREADS=2
NUM_THREADS_INPUT=2

echo "#############################################################################"
read -p "Number of threads: " NUM_THREADS_INPUT

if [[ $NUM_THREADS_INPUT == "" ]]; then
  echo "No input given. Using default: $NUM_THREADS"
elif ! [[ $NUM_THREADS_INPUT =~ ^[0-9]+$ ]]; then
  echo "Given input is not an integer. Using default: $NUM_THREADS"
elif [ ! $NUM_THREADS_INPUT -gt 0 ]; then
  echo "Given input is not greater than 0. Using default: $NUM_THREADS"
else
  NUM_THREADS=$NUM_THREADS_INPUT
fi

if [ -d $LLVM_SRC ]; then
    echo Found $LLVM_SRC! Not downloading source again.
else
    echo git clone $LLVM_URL -b $LLVM_BRANCH
    git clone $LLVM_URL -b $LLVM_BRANCH
fi

if [ -d $LLVM_SRC/tools ]; then
    echo Found LLVM tools
else
    echo Something is wrong with your $LLVM_SRC checkout! Quitting.
    exit 1
fi

export LLVM_SRC_ROOT=$LLVM_SRC

cd $HALIDE_ROOT

if [ ! -d $BUILD_DIR ]; then
  mkdir -p $BUILD_DIR
fi

cd $BUILD_DIR

echo cmake $LLVM_SRC -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra" -DLLVM_TARGETS_TO_BUILD="X86;ARM;NVPTX;AArch64;Mips;Hexagon;WebAssembly" -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_EH=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_BUILD_32_BITS=OFF 
cmake $LLVM_SRC -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra" -DLLVM_TARGETS_TO_BUILD="X86;ARM;NVPTX;AArch64;Mips;Hexagon;WebAssembly" -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_EH=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_BUILD_32_BITS=OFF  
echo "Generated build files"

echo make -j$NUM_THREADS
make -j$NUM_THREADS

echo "Installation complete"

echo export LLVM_ROOT=$BUILD_DIR
export LLVM_ROOT=$BUILD_DIR

echo export LLVM_CONFIG=$LLVM_ROOT/bin/llvm-config
export LLVM_CONFIG=$LLVM_ROOT/bin/llvm-config

echo "Set env variables needed for building Halide"

cd $HALIDE_ROOT
echo "Building Halide"

make

echo "Halide built successfully!"
