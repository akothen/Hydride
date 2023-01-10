
NUM_THREADS=24

HYDRIDE_DIR=$(PWD)

### Install LLVM
echo "Installing LLVM ..."
cd $(HYDRIDE_DIR)/backends/llvm
mkdir build
cd build
cmake . -DLLVM_TARGETS_TO_BUILD=Release -DLLVM_TARGETS_TO_BUILD:="X86;Hexagon;AArch64"
make -j $(NUM_THREADS)

### Install Halide
cd $(HYDRIDE_DIR)/frontends/Halide
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_DIR=$LLVM_ROOT/lib/cmake/llvm -S . -B build
cmake --build build

### Install Rosette
cd $(HYDRIDE_DIR)/rosette
raco pkg install

### Install Hydride code synthesizer
cd $(HYDRIDE_DIR)/code-synthesizer
raco pkg install hydride/

cd $(HYDRIDE_DIR)

