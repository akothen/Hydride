HYDRIDE_DIR=$HYDRIDE_ROOT

NUM_THREADS_INPUT=24

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

## Install LLVM
 echo "Installing LLVM ..."
 TARGET="X86;Hexagon;AArch64"
 LLVM_SRC=$HYDRIDE_DIR/backends/llvm
 echo cd $HYDRIDE_DIR/backends/llvm
 cd $HYDRIDE_DIR/backends/llvm
 echo mkdir build
 mkdir build
 echo cd build
 cd build
 set -x
 cmake $LLVM_SRC -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_STANDARD_REQUIRED=ON -DCMAKE_CXX_EXTENSIONS=OFF -DLLVM_TARGETS_TO_BUILD="$TARGET" -DCMAKE_BUILD_TYPE="Release" -DLLVM_INCLUDE_BENCHMARKS=Off -DLLVM_ENABLE_LLD=ON
 echo make -j $NUM_THREADS
 make -j $NUM_THREADS
 echo "LLVM installed successfully."


 cmake $LLVM_SRC -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_STANDARD_REQUIRED=ON -DCMAKE_CXX_EXTENSIONS=OFF -DLLVM_TARGETS_TO_BUILD="$TARGET" -DCMAKE_BUILD_TYPE="Release" -DLLVM_INCLUDE_BENCHMARKS=Off -DLLVM_ENABLE_LLD=ON
