
### This install script is invoked from the root directory
HYDRIDE_DIR=$(PWD)

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

### Install LLVM
echo "Installing LLVM ..."
TARGET="X86;Hexagon;AArch64"
echo cd $(HYDRIDE_DIR)/backends/llvm
cd $(HYDRIDE_DIR)/backends/llvm
echo mkdir build
mkdir build
echo cd build
cd build
echo cmake $LLVM_SRC -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_STANDARD_REQUIRED=ON -DCMAKE_CXX_EXTENSIONS=OFF -DLLVM_TARGETS_TO_BUILD=\"$TARGET\"  -DCMAKE_BUILD_TYPE=\"Release\"
cmake $LLVM_SRC -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_STANDARD_REQUIRED=ON -DCMAKE_CXX_EXTENSIONS=OFF -DLLVM_TARGETS_TO_BUILD="$TARGET" -DCMAKE_BUILD_TYPE="Release"
echo make -j $NUM_THREADS
make -j $(NUM_THREADS)
echo "LLVM installed successfully."

### Install Halide
echo "Installing Halide ..."
echo cd $(HYDRIDE_DIR)/frontends/Halide
cd $(HYDRIDE_DIR)/frontends/Halide
echo cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_DIR=$LLVM_ROOT/lib/cmake/llvm -S . -B build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_DIR=$LLVM_ROOT/lib/cmake/llvm -S . -B build
echo cmake --build build
cmake --build build
echo "Halide installed successfully."

### Install Rosette
echo "Installing Rosette ..."
echo cd $(HYDRIDE_DIR)/rosette
cd $(HYDRIDE_DIR)/rosette
echo raco pkg install
raco pkg install
echo "Rosette installed successfully."

### Install Hydride code synthesizer
echo "Installing Hydride code synthesizer ..."
echo cd $(HYDRIDE_DIR)/code-synthesizer
cd $(HYDRIDE_DIR)/code-synthesizer
echo raco pkg install hydride/
raco pkg install hydride/
echo "Hydride code synthesizer installed successfully."

cd $(HYDRIDE_DIR)

