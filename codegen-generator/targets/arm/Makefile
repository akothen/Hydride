rosette_test/compiled.rkt: ARMRoseLang.py ARMRoseCompiler.py AllSema.py
	python3 ARMRoseLang.py --gen 1<&-
rosette_test/ARMTest.cpp: RosetteARMTest.py ARMMeta.py
	python3 RosetteARMTest.py
rosette_test/a.out: rosette_test/ARMTest.cpp
	g++ rosette_test/ARMTest.cpp -o rosette_test/a.out
rosette_test/alltests.rkt: rosette_test/a.out
	rosette_test/a.out > rosette_test/alltests.rkt
rat: rosette_test/compiled.rkt rosette_test/alltests.rkt
	racket rosette_test/alltests.rkt
compile: rosette_test/compiled.rkt

casegengen: rosette_test/ARMTest.cpp

case: rosette_test/alltests.rkt
	
cdbg: ARMRoseLang.py ARMRoseCompiler.py AllSema.py
	python3 ARMRoseLang.py
gdbg: ARMIntrinsicClassify.py
	python3 ARMIntrinsicClassify.py
sema: ARMIntrinsicClassify.py
	python3 ARMSemanticGen.py
# ARMReadableSemantics.py: ARMParser.py ARMMeta.py
# 	python3 ARMParser.py --gen
AllSema.py: ARMSemanticGen.py ARMIntrinsicClassify.py ARMReadableSemantics.py ARMManualCorrectAST.py ARMHandCraftIntrinsics.py
	python3 ARMSemanticGen.py
AllSema.pickle: ARMSemanticGen.py ARMIntrinsicClassify.py ARMReadableSemantics.py ARMManualCorrectAST.py ARMHandCraftIntrinsics.py
	python3 ARMSemanticGen.py

rdbg: test.rkt
	racket test.rkt
wrapper: RoseARMCIntrinsicsWrappersEmitter.py
	python3 -m RoseARMCIntrinsicsWrappersEmitter
.PHONY: rat rdbg cdbg compile gdbg gendbg

