;; Grammar Definition
(define-grammar (gen-grammar arg0 arg1)
[expr (choose
	arg0
	arg1
	(no-op (expr))
	(bv 0 (bitvector 128))
	(concat (expr) (expr))
	;(apply concat (list (expr) (expr) (expr) (expr)))
	(ext-matrix-row (expr) 2 2 0 32)
	(ext-matrix-row (expr) 2 2 1 32)
	(ext-matrix-col (expr) 2 2 0 32)
	(ext-matrix-col (expr) 2 2 1 32)
	(dsl_inst_0 (expr) (expr) (expr) 1 2 32 32))]

)


