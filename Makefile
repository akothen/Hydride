LIB_HALIDE=$(HALIDE_SRC)/distrib/lib/lbHalide.so
$(LIB_HALIDE): $(HALIDE_SRC)/src/CodeGen_LLVM.cpp $(HALIDE_SRC)/src/Rosette.cpp
	make -C $(HALIDE_SRC) distrib/lib/libHalide.so
armmedian: $(LIB_HALIDE)
	make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide median3x3
x86median: $(LIB_HALIDE)
	make -C $(HYDRIDE_ROOT)/benchmarks/x86-deprecated/halide median3x3
