HALIDE_DISTRIB ?= /home/sb54/halide-12/distrib
LLVM_ROOT ?= /home/sb54/llvm-12

benchmarks = gaussian3x3 \
			 gaussian5x5 \
			 dilate3x3 \
			 median3x3 \
			 sobel3x3 \
			 blur3x3 \
			 matmul \
			 matmul_simple \
			 add \
			 mul \
			 l2norm \
			 max_pool \
			 average_pool \
			 conv_nn \
			 fully_connected

bin_dirs = $(addsuffix /bin,$(benchmarks))

hannk = hannk/common_halide.cpp

ENABLE_HYDRIDE=1
EXPR_DEPTH ?=2

.PHONY: clean all $(benchmarks)

all: $(benchmarks)

$(benchmarks): %: %/bin
# 	Compile the generator
	g++ --std=c++17 -fno-rtti -O3 -DLOG2VLEN=7 \
		-I $(HALIDE_DISTRIB)/include -I $(HALIDE_DISTRIB)/tools \
		-g $@/src/$@_generator.cpp $(HALIDE_DISTRIB)/tools/GenGen.cpp \
		$(hannk) \
		-o $@/bin/$@_generator \
		-L $(HALIDE_DISTRIB)/lib -lHalide $(shell $(LLVM_ROOT)/bin/llvm-config --system-libs --link-static)

# 	Use the generator (to get a manual schedule which is the default)
#
	export LD_LIBRARY_PATH=$(HALIDE_DISTRIB)/lib; HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) ./$@/bin/$@_generator \
		-t 0 \
		-o $@/bin \
		-g $@ \
		-e static_library,stmt,h,llvm_assembly,assembly \
		-f $@ target=host
	
	
#-noos-no_bounds_query-no_asserts

# Make the bin dirs if needed
$(bin_dirs): %:
	mkdir $@

clean:
	rm -rf $(bin_dirs)
