rosette_test/compiled.rkt: ARMRoseLang.py ARMRoseCompiler.py AllSema.pickle
	python3 ARMRoseLang.py 1<&-
compile: rosette_test/compiled.rkt

cdbg: ARMRoseLang.py ARMRoseCompiler.py AllSema.pickle
	python3 ARMRoseLang.py
gdbg: ARMIntrinsicClassify.py
	python3 ARMIntrinsicClassify.py
sema: ARMIntrinsicClassify.py
	python3 ARMSemanticGen.py
AllSema.pickle: ARMSemanticGen.py ARMIntrinsicClassify.py
	python3 ARMSemanticGen.py
rat: rosette_test/compiled.rkt
	racket rosette_test/alltests.rkt
rdbg: test.rkt
	racket test.rkt
.PHONY: rat rdbg cdbg compile gdbg gendbg