HALIDE_DISTRIB = $(HYDRIDE_ROOT)/frontends/halide/distrib
ADDITIONAL = -rpath $(HALIDE_DISTRIB)/lib

include Makefile.common

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
