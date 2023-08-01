HALIDE_DISTRIB = $(HYDRIDE_ROOT)/frontends/halide/distrib
LLVM_ROOT ?= $(LLVM_DIS_ROOT)
LLVM_SYMBOLIZER_PATH ?= $(LLVM_ROOT)/bin

benchmarks = gaussian3x3 \
			 gaussian5x5 \
			 gaussian7x7 \
			 dilate3x3 \
			 dilate5x5 \
			 dilate7x7 \
			 median3x3 \
			 sobel3x3 \
			 sobel5x5 \
			 blur3x3 \
			 blur5x5 \
			 blur7x7 \
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
			 conv3x3a16 \
			 camera_pipe \
			 fft \
			 softmax \
			 simple

bin_dirs = $(addsuffix /bin,$(benchmarks))
bin_ref_dirs = $(addsuffix /bin_ref,$(benchmarks))

hannk = hannk/common_halide.cpp

ENABLE_HYDRIDE ?= 1
ifeq ($(ENABLE_HYDRIDE), 1)
	BIN=bin
else
	BIN=bin_ref
endif
EXPR_DEPTH ?=2
SYNTH_BITWIDTH ?= 16 
INT_BW ?= 16

BENCHMARK ?=1

CC=/usr/bin/clang
TARGET=arm-64-osx-no_bounds_query-no_asserts
STARTING_HASH_FLAG=#HYDRIDE_INITIAL_HASH=starting_hash


.PHONY: clean all $(benchmarks)

all: $(benchmarks)

$(benchmarks): %: %/$(BIN)
# 	Compile the generator
	g++ --std=c++17 -fno-rtti -O3 -DLOG2VLEN=7    \
		-I $(HALIDE_DISTRIB)/include -I $(HALIDE_DISTRIB)/tools \
		-g $@/src/$@_generator.cpp $(HALIDE_DISTRIB)/tools/GenGen.cpp \
		$(hannk) \
		-o $@/$(BIN)/$@_generator \
		-L $(HALIDE_DISTRIB)/lib -lHalide $(shell $(LLVM_CONFIG) --system-libs --link-static) \
		-rpath $(HALIDE_DISTRIB)/lib

# 	Use the generator (to get a manual schedule which is the default)
#
	time HYDRIDE_DISTRIBUTE_LOOK_AHEAD=1 HL_EXPR_DEPTH=$(EXPR_DEPTH) $(STARTING_HASH_FLAG) HYDRIDE_BENCHMARK=$@ HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) HL_SYNTH_BW=$(SYNTH_BITWIDTH) HYDRIDE_TARGET=arm ./$@/$(BIN)/$@_generator \
		-t 0 \
		-o $@/$(BIN) \
		-g $@ \
		-e static_library,stmt,h,llvm_assembly,assembly \
		-f $@ target=$(TARGET)
	HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_ENABLE_HYDRIDE=0 HL_DEBUG_CODEGEN=1  HL_SYNTH_BW=$(SYNTH_BITWIDTH) ./$@/$(BIN)/$@_generator \
		-r halide_runtime_x86 \
		-o $@/$(BIN) \
		-e object,c_header \
		target=$(TARGET)
	
	$(CC) -Dbenchmark_$@ --std=c++17 \
		-O0\
		-I $(HALIDE_DISTRIB)/include -I ./$@/$(BIN) \
		-lstdc++ -ldl -pthread \
		test/run.cpp \
		test/stubs.cpp \
		$@/$(BIN)/$@.a \
		$@/$(BIN)/halide_runtime_x86.o \
		-o $@/$(BIN)/$@_run.out

	
ifeq ($(BENCHMARK),1) 

# Benchmark the generated $(BIN)ary
	$@/$(BIN)/$@_run.out 3840 2160 ../test_vectors/football3840x2160.bin $@/out/out.bin

endif

fully_connected: %:
	g++ --std=c++17 -fno-rtti -O3 -DLOG2VLEN=7 \
		-I $(HALIDE_DISTRIB)/include -I $(HALIDE_DISTRIB)/tools \
		-g $@/src/$@_generator.cpp $(HALIDE_DISTRIB)/tools/GenGen.cpp \
		$(hannk) \
		-o $@/$(BIN)/$@_generator \
		-L $(HALIDE_DISTRIB)/lib -lHalide $(shell $(LLVM_CONFIG) --system-libs --link-static) \
		-rpath $(HALIDE_DISTRIB)/lib

	export LD_LIBRARY_PATH=$(HALIDE_DISTRIB)/lib;  export HYDRIDE_BENCHMARK=$@_arm_depth$(EXPR_DEPTH); HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) HL_EXPR_DEPTH=$(EXPR_DEPTH) HYDRIDE_TARGET=arm   HL_SYNTH_BW=$(INT_BW) $(STARTING_HASH) ./$@/$(BIN)/$@_generator \
	    -t 0 \
		-o $@/$(BIN) \
		-g $@ output.type=uint8 \
		-e static_library,stmt,h,llvm_assembly,assembly \
		-f $@ target=$(TARGET)
	
	HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_ENABLE_HYDRIDE=0 HL_DEBUG_CODEGEN=1  HL_SYNTH_BW=$(SYNTH_BITWIDTH) ./$@/$(BIN)/$@_generator \
		-r halide_runtime_x86 \
		-o $@/$(BIN) \
		-e object,c_header \
		target=$(TARGET)
	
	$(CC) -Dbenchmark_$@ --std=c++17 \
		-O0\
		-I $(HALIDE_DISTRIB)/include -I ./$@/$(BIN) \
		-lstdc++ -ldl -pthread \
		test/run.cpp \
		test/stubs.cpp \
		$@/$(BIN)/$@.a \
		$@/$(BIN)/halide_runtime_x86.o \
		-o $@/$(BIN)/$@_run.out

	
ifeq ($(BENCHMARK),1) 

# Benchmark the generated $(BIN)ary
	$@/$(BIN)/$@_run.out 3840 2160 ../test_vectors/football3840x2160.bin $@/out/out.bin

endif

#-lpng -lpthread -ldl -ljpeg 
	
fully_connected/bin_ref fully_connected/bin: %:
	mkdir $@


# Make the bin dirs if needed
$(bin_dirs): %:
	mkdir $@

$(bin_ref_dirs): %:
	mkdir $@

clean:
	rm -rf $(bin_dirs)
	rm -rf halide_expr_*
	rm -rf /tmp/hydride_exprs.rkt
	rm -rf /tmp/base_*
	rm -rf /tmp/hydride_hash*
	rm -rf /tmp/hydride.node*
# $(benchmarks): %/$(BIN)/%_generator:
# 	g++ --std=c++17 -fno-rtti -O3 -DLOG2VLEN=7    \
# 		-I $(HALIDE_DISTRIB)/include -I $(HALIDE_DISTRIB)/tools \
# 		-g $*/src/$*_generator.cpp $(HALIDE_DISTRIB)/tools/GenGen.cpp \
# 		$(hannk) \
# 		-o $*/$(BIN)/$*_generator \
# 		-L $(HALIDE_DISTRIB)/lib -lHalide $(shell $(LLVM_CONFIG) --system-libs --link-static) \
# 		-rpath $(HALIDE_DISTRIB)/lib
# $(benchmarks): %/$(BIN)/%.a: %/$(BIN)/%_generator
# 	HYDRIDE_DISTRIBUTE_LOOK_AHEAD=1 HL_EXPR_DEPTH=$(EXPR_DEPTH) $(STARTING_HASH_FLAG) HYDRIDE_BENCHMARK=$* HL_ENABLE_HYDRIDE=$(ENABLE_HYDRIDE) HL_SYNTH_BW=$(SYNTH_BITWIDTH) HYDRIDE_TARGET=arm ./$*/$(BIN)/$*_generator \
# 		-t 0 \
# 		-o $*/$(BIN) \
# 		-g $* \
# 		-e static_library,stmt,h,llvm_assembly,assembly \
# 		-f $* target=$(TARGET)
# 	HL_EXPR_DEPTH=$(EXPR_DEPTH) HL_ENABLE_HYDRIDE=0 HL_DEBUG_CODEGEN=1  HL_SYNTH_BW=$(SYNTH_BITWIDTH) ./$*/$(BIN)/$*_generator \
# 		-r halide_runtime_x86 \
# 		-o $*/$(BIN) \
# 		-e object,c_header \
# 		target=$(TARGET)
# $(benchmarks): %/$(BIN)/%_run.out: %/$(BIN)/%.a
# 	$(CC) -Dbenchmark_$* --std=c++17 \
# 		-O0\
# 		-I $(HALIDE_DISTRIB)/include -I ./$*/$(BIN) \
# 		-lstdc++ -ldl -pthread \
# 		test/run.cpp \
# 		test/stubs.cpp \
# 		$*/$(BIN)/$*.a \
# 		$*/$(BIN)/halide_runtime_x86.o \
# 		-o $*/$(BIN)/$*_run.out
# $(benchmarks): %.gen: %/$(BIN)
# 	$(MAKE) @/$(BIN)/$*_generator
# $(benchmarks): %.syn: %/$(BIN)
# 	$(MAKE) @/$(BIN)/$*.a
# $(benchmarks): %.link: %/$(BIN)
# 	$(MAKE) @/$(BIN)/$*_run.out
%.link:
	$(CC) -Dbenchmark_$* --std=c++17 \
		-O0\
		-I $(HALIDE_DISTRIB)/include -I ./$*/bin \
		-lstdc++ -ldl -pthread \
		test/run.cpp \
		test/stubs.cpp \
		$*/bin/$*.a \
		$*/bin/halide_runtime_x86.o \
		-o $*/bin/$*_run.out -DDEBUG
	$*/bin/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin
%.linkr:
	$(CC) -Dbenchmark_$* --std=c++17 \
		-O0\
		-I $(HALIDE_DISTRIB)/include -I ./$*/bin \
		-lstdc++ -ldl -pthread \
		test/run.cpp \
		test/stubs.cpp \
		$*/bin/$*.a \
		$*/bin/halide_runtime_x86.o \
		-o $*/bin/$*_run.out
	$*/bin/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin
%.linkd:
	$(CC) -Dbenchmark_$* --std=c++17 \
		-O0\
		-I $(HALIDE_DISTRIB)/include -I ./$*/bin_ref \
		-lstdc++ -ldl -pthread \
		test/run.cpp \
		test/stubs.cpp \
		$*/bin_ref/$*.a \
		$*/bin_ref/halide_runtime_x86.o \
		-o $*/bin_ref/$*_run.out -DDEBUG
	$*/bin_ref/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin

result.tar: Makefile
	tar -cvf $@ Makefile
%.pack: result.tar
	tar -uvf result.tar $*/bin/$*.a $*/bin/$*.h
unpack:
	tar -xvf result.tar
%.unpack:
	tar -xvf result.tar $*/bin/$*.a $*/bin/$*.h
fetch:
	-gcp --backup=t result.tar result.tar.bak
	scp muchenx2@nusrat.cs.illinois.edu:Hydride/benchmarks/arm/halide/result.tar .
