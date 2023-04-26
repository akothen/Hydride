UNAME_S = $(shell uname -s)
EXT = so
ifeq ($(UNAME_S),Darwin)
    EXT = dylib
endif

armmedian: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER)
	make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide median3x3 -f Makefile
armadd: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER)
	make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide add -f Makefile
armmul: $(LIB_HALIDE) $(HYDRIDE_SEMA) $(LEGALIZER)
	make -C $(HYDRIDE_ROOT)/benchmarks/arm/halide mul -f Makefile
LIB_HALIDE=$(HALIDE_SRC)/distrib/lib/libHalide.$(EXT)
$(LIB_HALIDE): $(HALIDE_SRC)/src/CodeGen_LLVM.cpp $(HALIDE_SRC)/src/Rosette.cpp
	make -C $(HALIDE_SRC) distrib/lib/libHalide.$(EXT)
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
	cp $(SIMILARITY_SUMMARY)/RosetteOpsImpl.rkt $(SIMILARITY_ENV)
	
	(cd $(SIMILARITY_ENV) && python3 -m RoseSimilarityChecker)
	cp --backup=numbered $(SIMILARITY_SUMMARY_SEMA) $(SIMILARITY_SUMMARY)
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py
$(HYDRIDE_SEMA): $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	(cd $(HYDRIDE_ROOT)/code-synthesizer/hydride/ir/arm && python3 -m EmitHydridePkgDefs)
	raco pkg update $(HYDRIDE_ROOT)/code-synthesizer/hydride/
$(LEGALIZER_CPP): $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py
	(cd $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ && python3 RoseARMLegalizerGen.py)
$(LEGALIZER): $(LEGALIZER_CPP)
	make -C $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/build
$(ALL_ARM_SEMA):
	make -C $(HYDRIDE_ROOT)/codegen-generator/targets/arm AllSema.pickle
halide: $(LIB_HALIDE)
similarity:
	cp $(SIMILARITY_SUMMARY)/RosetteOpsImpl.rkt $(SIMILARITY_ENV)
	
	(cd $(SIMILARITY_ENV) && python3 -m RoseSimilarityChecker)
	cp --backup=numbered $(SIMILARITY_SUMMARY_SEMA) $(SIMILARITY_SUMMARY)
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	cp $(SIMILARITY_SUMMARY_SEMA) $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py
hydride_sema:
	(cd $(HYDRIDE_ROOT)/code-synthesizer/hydride/ir/arm && python3 -m EmitHydridePkgDefs)
	raco pkg update $(HYDRIDE_ROOT)/code-synthesizer/hydride/
legalizer:
	(cd $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ && python3 RoseARMLegalizerGen.py)
	make -C $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/build
arm_sema:
	make -C $(HYDRIDE_ROOT)/codegen-generator/targets/arm AllSema.pickle
syncsema:
	cp $(SIMILARITY_SUMMARY)/semantics.py $(HYDRIDE_ROOT)/code-synthesizer/dsl-ir/ARMSemantics.py
	cp $(SIMILARITY_SUMMARY)/semantics.py $(HYDRIDE_ROOT)/codegen-generator/tools/low-level-codegen/InstSelectors/arm/ARMSemantics.py

.PHONY: similarity hydride_sema arm_sema halide legalizer
