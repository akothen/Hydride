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
        (dsl_inst_0  (bv 0 (bitvector 128)) (expr) (expr) 1 2 32 32)
	(ext-matrix-row (expr) 2 2 0 32)
	(ext-matrix-row (expr) 2 2 1 32)
	(ext-matrix-col (expr) 2 2 0 32)
	(ext-matrix-col (expr) 2 2 1 32)
	;;(vector-load arg0 128 0 2 32)
	;;(vector-load arg0 128 2 2 32)
	;;(strided-gather arg1 128 0 2 2 32)
	;;(strided-gather arg1 128 1 2 2 32)
    )]
)

