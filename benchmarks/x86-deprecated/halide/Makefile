HALIDE_DISTRIB ?= /home/arnoor2/Racket/TensorSynth/Rosette-experiments/frontends/halide/distrib/
LLVM_ROOT ?= $(LLVM_DIS_ROOT)

benchmarks = gaussian3x3 \
			 gaussian5x5 \
			 dilate3x3 \
			 median3x3 \
			 sobel3x3 \
			 blur3x3 \
			 chroma \
			 depthwise_conv \
			 matmul \
			 matmul_128 \
			 matmul_256 \
			 matmul_256_32bit \
			 matmul_512 \
			 matmul_1024 \
			 add \
			 mul \
			 l2norm \
			 max_pool \
			 average_pool \
			 conv_nn \
			 fully_connected \
			 camera_pipe \
			 fft \
			 softmax

bin_dirs = $(addsuffix /bin,$(benchmarks))

hannk = hannk/common_halide.cpp

ENABLE_HYDRIDE ?= 1
EXPR_DEPTH ?=2
INT_BW ?= 16

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
	export LD_LIBRARY_PATH=$(HALIDE_DISTRIB)/lib; HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_SYNTH_BW=$(INT_BW) ./$@/bin/$@_generator \
		-t 0 \
		-o $@/bin \
		-g $@ \
		-e static_library,stmt,h,llvm_assembly,assembly \
		-f $@ target=host

fft:
# 	Compile the generator
	g++ -std=c++11 -fno-rtti -O3 \
		-I $(HALIDE_DISTRIB)/include -I $(HALIDE_DISTRIB)/tools \
		-g -Wall $@/src/$@_generator.cpp $@/src/fft.cpp $(HALIDE_DISTRIB)/tools/GenGen.cpp \
		-o $@/bin/$@_generator \
		-L $(HALIDE_DISTRIB)/lib -lHalide $(shell $(LLVM_ROOT)/bin/llvm-config --system-libs --link-static)

# Make the bin dirs if needed
$(bin_dirs): %:
	mkdir $@

clean:
	rm -rf $(bin_dirs)
	rm halide_expr*
	rm -rf /tmp/hydride_exprs.rkt
	rm -rf /tmp/hydride.node.*
	rm -rf /tmp/base_*
