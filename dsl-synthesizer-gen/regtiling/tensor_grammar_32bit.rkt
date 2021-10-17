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
	(dsl_inst_0 (bv 0 (bitvector 64)) (expr) (expr) 1 2 8 8)
	;;(dsl_inst_1 (expr) 2 8)
	(vector-load arg0 4 0 2 8)
	(vector-load arg0 4 1 2 8)
	;;(vector-load arg0 4 2 2 8)
	;;(vector-load arg0 4 3 2 8)
	(strided-gather arg1 16 0 4 2 8)
	(strided-gather arg1 16 1 4 2 8)
	;;(strided-gather arg1 16 2 4 2 8)

	;;(ext-matrix-row arg0 2 4 0 8)
	;;(ext-matrix-row arg0 2 4 1 8)
	;;(ext-matrix-col arg1 4 6 0 8)
	;;(ext-matrix-col arg1 4 6 1 8)
	;;(ext-matrix-col arg1 4 6 2 8)
	;;(ext-matrix-col arg1 4 6 3 8)
	;;(ext-matrix-col arg1 4 6 4 8)
	;;(ext-matrix-col arg1 4 6 5 8)
    )]
)

