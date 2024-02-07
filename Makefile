UNAME_S = $(shell uname -s)
EXT = so
MAKEFILE=Makefile.qemu
PYTHON?=python3
ifeq ($(UNAME_S),Darwin)
	MAKEFILE=Makefile
    EXT = dylib
endif

armec.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER)
	# - rm $(HYDRIDE_ROOT)/benchmarks/arm/halide/halide_expr_$**.rkt
	
arme.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
arme1.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	EXPR_DEPTH=1 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
arme2.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	EXPR_DEPTH=2 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
arme3.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	EXPR_DEPTH=3 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
arme4.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	EXPR_DEPTH=4 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
arme5.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	EXPR_DEPTH=5 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
arme9.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER) armec.%
	EXPR_DEPTH=9 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
armd.%: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER)
	ENABLE_HYDRIDE=0 make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide $* -f $(MAKEFILE)
armr.%:
	@echo "=================================================="
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
armrd.%:
	@echo "=================================================="
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin_ref/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin_ref/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin_ref/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
	(cd $(HYDRIDE_ROOT)/benchmarks/arm/halide && $*/bin_ref/$*_run.out 3840 2160 ../test_vectors/football3840x2160.bin $*/out/out.bin)
LIB_HALIDE=$(HALIDE_SRC)/distrib/lib/libHalide.$(EXT)
$(LIB_HALIDE):
	make -C $(HALIDE_SRC) distrib/lib/libHalide.$(EXT) -j8
x86median: $(LIB_HALIDE)
	make -C $(HYDRIDE_ROOT)/benchmarks/x86-deprecated/halide median3x3
x86mul: $(LIB_HALIDE)
	make -C $(HYDRIDE_ROOT)/benchmarks/x86/halide mul
ALL_ARM_SEMA=$(HYDRIDE_ROOT)/codegen-generator/targets/arm/AllSema.pickle
LEGALIZER=$(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/build/libARMLegalizer.so
LEGALIZER_CPP=$(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMLegalizer.cpp
SIMILARITY_SUMMARY_SEMA=$(SIMILARITY_ENV)/semantics.py
HYDRIDE_SEMA=$(HYDRIDE_ROOT)/code-synthesizer/hydride/ir/arm/semantics.rkt
$(SIMILARITY_SUMMARY_SEMA): $(ALL_ARM_SEMA)
	cp $(HYDRIDE_ROOT)/code-synthesizer/hydride/utils/bvops.rkt $(SIMILARITY_ENV)/RosetteOpsImpl.rkt
	
	(cd $(SIMILARITY_ENV) && $(PYTHON) -m RoseSimilarityChecker)
	cp --backup=numbered $(SIMILARITY_SUMMARY_SEMA) $(SIMILARITY_SUMMARY)
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py
$(HYDRIDE_SEMA): $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	(cd $(HYDRIDE_ROOT)/code-synthesizer/hydride/ir/arm && $(PYTHON) -m EmitHydridePkgDefs)
	raco pkg update $(HYDRIDE_ROOT)/code-synthesizer/hydride/
$(LEGALIZER_CPP): $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py
	(cd $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ && $(PYTHON) RoseARMLegalizerGen.py)
$(LEGALIZER): $(LEGALIZER_CPP)
	make -C $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/build
$(ALL_ARM_SEMA):
	make -C $(HYDRIDE_ROOT)/codegen-generator/targets/arm AllSema.pickle
halide: $(LIB_HALIDE)
	make -C $(HALIDE_SRC) distrib/lib/libHalide.$(EXT) -j8
mlir:
	make -C /home/muchenx2/llvm-15/build -j32
similaritytest:
	cp $(HYDRIDE_ROOT)/code-synthesizer/hydride/utils/bvops.rkt $(SIMILARITY_ENV)/RosetteOpsImpl.rkt
	
	
	(cd $(SIMILARITY_ENV) && $(PYTHON) -m RoseSimilarityChecker)
similarity:
	cp $(HYDRIDE_ROOT)/code-synthesizer/hydride/utils/bvops.rkt $(SIMILARITY_ENV)/RosetteOpsImpl.rkt
	
	
	(cd $(SIMILARITY_ENV) && $(PYTHON) -m RoseSimilarityChecker)
	cp --backup=numbered $(SIMILARITY_SUMMARY_SEMA) $(SIMILARITY_SUMMARY)
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py

hydride_pkg = $(HYDRIDE_ROOT)/code-synthesizer/hydride/ir/arm/get_ops.rkt # 
$(hydride_pkg): $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/VISASemantics.py
	(cd $(HYDRIDE_ROOT)/code-synthesizer/hydride/ir/visa && $(PYTHON) -m EmitHydridePkgDefs)
hydride_sema: 
	$(MAKE) $(hydride_pkg)
	raco pkg update $(HYDRIDE_ROOT)/code-synthesizer/hydride/
legalizer:
	rm $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/*.cpp
	(cd $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ && $(PYTHON) RoseARMLegalizerGen.py)
	(cd $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/build && cmake ..)
	make -C $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/build -j64
arm_sema:
	make -C $(HYDRIDE_ROOT)/codegen-generator/targets/arm AllSema.pickle
syncsema:
	cp $(SIMILARITY_SUMMARY)/semantics.py $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	cp $(SIMILARITY_SUMMARY)/semantics.py $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py

.PHONY: similarity hydride_sema arm_sema halide legalizer
compileall: arme1.add \
			arme1.average_pool \
			arme.blur3x3 \
			arme.dilate3x3 \
			arme.dilate5x5 \
			arme1.gaussian3x3 \
			arme1.gaussian5x5 \
			arme1.l2norm \
			arme.matmul_256_32bit \
			arme.max_pool \
			arme.median3x3 \
			arme1.sobel3x3
disableall: armd.add \
			armd.average_pool \
			armd.blur3x3 \
			armd.dilate3x3 \
			armd.dilate5x5 \
			armd.gaussian3x3 \
			armd.gaussian5x5 \
			armd.l2norm \
			armd.matmul_256_32bit \
			armd.max_pool \
			armd.median3x3 \
			armd.sobel3x3