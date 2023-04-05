rosette_test/compiled.rkt: ARMRoseLang.py ARMRoseCompiler.py AllSema.pickle
	python3 ARMRoseLang.py 1<&-
compile: rosette_test/compiled.rkt

cdbg: ARMRoseLang.py ARMRoseCompiler.py AllSema.pickle
	python3 ARMRoseLang.py
AllSema.pickle: ARMSemanticGen.py ARMIntrinsicClassify.py
	python3 ARMSemanticGen.py
alltests: rosette_test/compiled.rkt
	racket rosette_test/alltests.rkt
rdbg: test.rkt
	racket test.rkt
.PHONY: alltests rdbg cdbg compile