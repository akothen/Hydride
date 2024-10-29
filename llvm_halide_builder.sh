cmake   -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_PROJECTS="clang;mlir" \
        -DLLVM_USE_LINKER=lld \
        -DLLVM_TARGETS_TO_BUILD="X86;ARM;NVPTX;Hexagon;AArch64;Mips;PowerPC" \
        -DCLANG_ENABLE_STATIC_ANALYZER=OFF \
        -DCLANG_ENABLE_ARCMT=OFF \
        -DLLVM_BUILD_TOOLS=OFF \
        -DLLVM_BUILD_UTILS=OFF \
        -DCMAKE_CXX_FLAGS_RELEASE="-O0" \
        -GNinja ../llvm 

export LLVM_CONFIG="/home/llvm-lab/llvm-19-1-0/build/bin/llvm-config"