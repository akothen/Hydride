HALIDE_DISTRIB ?= /home/arnoor2/Racket/TensorSynth/Rosette-experiments/halide-hydride/distrib/
LLVM_ROOT ?= $(LLVM_DIS_ROOT)

benchmarks = gaussian3x3 \
			 gaussian5x5 \
			 gaussian7x7 \
			 simple_add \
			 dilate3x3 \
			 dilate5x5 \
			 dilate7x7 \
			 median3x3 \
			 sobel3x3 \
			 sobel5x5 \
			 blur3x3 \
			 blur5x5 \
			 blur7x7 \
			 matmul \
			 matmul_simple \
			 add \
			 mul \
			 l2norm \
			 max_pool \
			 max_pool_i32 \
			 max_pool_add \
			 average_pool \
			 average_pool_add \
			 matmul_1024_32bit\
			 conv_nn \
			 fully_connected \
			 blur5x5 \
			 simple \
			 conv3x3a16 \
			 matmul_256_32bit \
			 softmax\
			 batched_matmul_256_32bit\
			 matmul_256_32bit_bias_add\
			 matmul_256_32bit_bias_add_add\
			 matmul_256_32bit_bias_add_relu

bin_dirs = $(addsuffix /bin,$(benchmarks))

hannk = hannk/common_halide.cpp

ENABLE_HYDRIDE ?= 1
EXPR_DEPTH ?=2
SYNTH_BITWIDTH ?= 16 

BENCHMARK ?=1

CC=clang
#TARGET=host-x86-64 #host-noos-no_bounds_query-no_asserts
TARGET=host-x86-64-no_bounds_query-no_asserts #host-noos-no_bounds_query-no_asserts
STARTING_HASH_FLAG= #HYDRIDE_INITIAL_HASH=x86_hash

#STARTING_HASH ?= "hash_v3" #"empty_hash" 

STARTING_HASH ?= "empty_hash" 


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
	 HL_EXPR_DEPTH=$(EXPR_DEPTH) $(STARTING_HASH_FLAG) HYDRIDE_BENCHMARK=$@_x86_depth$(EXPR_DEPTH)_rafae HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) HL_SYNTH_BW=$(SYNTH_BITWIDTH) HYDRIDE_INITIAL_HASH=$(STARTING_HASH) ./$@/bin/$@_generator \
		-t 0 \
		-o $@/bin \
		-g $@ \
		-e static_library,stmt,h,llvm_assembly,assembly \
		-f $@ target=$(TARGET)
	HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_ENABLE_HYDRIDE=0 HL_DEBUG_CODEGEN=1  HL_SYNTH_BW=$(SYNTH_BITWIDTH) ./$@/bin/$@_generator \
		-r halide_runtime_x86 \
		-o $@/bin \
		-e object,c_header \
		target=$(TARGET)

	$(CC) -Dbenchmark_$@ --std=c++17 \
		-O0 -march=native -mavx512vl -mavx512ifma \
		-I $(HALIDE_DISTRIB)/include -I ./$@/bin \
		-lstdc++ -ldl -pthread \
		-L ./libpimsim/ \
		-lpimsim \
		test/run.cpp \
		test/stubs.cpp \
		$@/bin/$@.a \
		./libpimsim/libpimsim.a \
		$@/bin/halide_runtime_x86.o \
		-o $@/bin/$@_run.out
	
ifeq ($(BENCHMARK),1) 

# Benchmark the generated binary
	$@/bin/$@_run.out 3840 2160 ../test_vectors/football3840x2160.bin $@/out/out.bin

endif

#-lpng -lpthread -ldl -ljpeg 
	
fully_connected: %: %/bin
# 	Compile the generator
	g++ --std=c++17 -fno-rtti -O3 -DLOG2VLEN=7 \
		-I $(HALIDE_DISTRIB)/include -I $(HALIDE_DISTRIB)/tools \
		-g $@/src/$@_generator.cpp $(HALIDE_DISTRIB)/tools/GenGen.cpp \
		$(hannk) \
		-o $@/bin/$@_generator \
		-L $(HALIDE_DISTRIB)/lib -lHalide $(shell $(LLVM_ROOT)/bin/llvm-config --system-libs --link-static)

# 	Use the generator (to get a manual schedule which is the default)
#
	 HL_EXPR_DEPTH=$(EXPR_DEPTH) $(STARTING_HASH_FLAG) HYDRIDE_BENCHMARK=$@_x86_depth$(EXPR_DEPTH)_rafae HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) HL_SYNTH_BW=$(SYNTH_BITWIDTH) HYDRIDE_INITIAL_HASH=$(STARTING_HASH) HYDRIDE_DECOMPOSE_LET=1 ./$@/bin/$@_generator \
		-t 0 \
		-o $@/bin \
		-g $@ \
		output.type=uint8 \
		-e static_library,stmt,h,llvm_assembly,assembly \
		-f $@ target=$(TARGET)
	HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_ENABLE_HYDRIDE=0 HL_DEBUG_CODEGEN=1 HYDRIDE_DECOMPOSE_LET=1  HL_SYNTH_BW=$(SYNTH_BITWIDTH) ./$@/bin/$@_generator \
		-r halide_runtime_x86 \
		-o $@/bin \
		-e object,c_header \
		target=$(TARGET)

	$(CC) -Dbenchmark_$@ --std=c++17 \
		-O0 -march=native -mavx512vl -mavx512ifma \
		-I $(HALIDE_DISTRIB)/include -I ./$@/bin \
		-lstdc++ -ldl -pthread \
		-L ./libpimsim/ \
		-lpimsim \
		test/run.cpp \
		test/stubs.cpp \
		$@/bin/$@.a \
		./libpimsim/libpimsim.a \
		$@/bin/halide_runtime_x86.o \
		-o $@/bin/$@_run.out
	
ifeq ($(BENCHMARK),1) 

# Benchmark the generated binary
	$@/bin/$@_run.out 1920 1080 ../test_vectors/football1920x1080.bin  $@/out/out.bin

endif


# Make the bin dirs if needed
$(bin_dirs): %:
	mkdir $@

clean:
	rm -rf $(bin_dirs)
	rm -rf halide_expr_*
	rm -rf /tmp/hydride_exprs.rkt
	rm -rf /tmp/base_*
	rm -rf /tmp/hydride_hash*
	rm -rf /tmp/hydride.node*
