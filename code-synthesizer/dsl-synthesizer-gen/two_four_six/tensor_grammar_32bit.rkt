;; Grammar Definition
(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
)]
[expr (choose
	arg0
	arg1
	(no-op (expr))
	(bv 0 (bitvector 128))
	(bv 0 (bitvector 384))
	(bv 0 (bitvector 256))
	;; (concat (expr) (expr))
    ;;(apply concat (list  (expr) (expr) (expr) (expr)))
    ;;(apply concat (list  (expr) (expr) (expr) (expr) (expr) (expr) ))
    ;;(apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
	(ext-matrix-row (expr) 2 4 0 32)
	(ext-matrix-row (expr) 2 4 1 32)
	(ext-matrix-col (expr) 4 6 0 32)
	(ext-matrix-col (expr) 4 6 1 32)
	(ext-matrix-col (expr) 4 6 2 32)
	(ext-matrix-col (expr) 4 6 3 32)
	(ext-matrix-col (expr) 4 6 4 32)
	(ext-matrix-col (expr) 4 6 5 32)
	(dsl_inst_0 (expr) (expr) (expr) 1 4 32 32))]

)


