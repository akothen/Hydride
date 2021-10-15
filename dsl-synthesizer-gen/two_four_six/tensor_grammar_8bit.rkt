;; Grammar Definition
(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
       ;;(apply concat (list (expr) (expr) (expr) (expr)))
       ;;(concat (top) (top))
)]

[expr (choose
	arg0
	arg1
	(no-op (expr))
	(bv 0 (bitvector 32))
	(bv 0 (bitvector 96))
	(bv 0 (bitvector 64))
	;;(concat (expr) (expr))
    ;;(apply concat (list  (expr) (expr) (expr) (expr) (expr) (expr) ))
    ;;(apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
	(dsl_inst_0 (bv 0 (bitvector 64)) (expr) (expr) 1 4 8 8)
	(ext-matrix-row arg0 2 4 0 8)
	(ext-matrix-row arg0 2 4 1 8)
	(ext-matrix-col arg1 4 6 0 8)
	(ext-matrix-col arg1 4 6 1 8)
	(ext-matrix-col arg1 4 6 2 8)
	(ext-matrix-col arg1 4 6 3 8)
	(ext-matrix-col arg1 4 6 4 8)
	(ext-matrix-col arg1 4 6 5 8)
    )]
)



