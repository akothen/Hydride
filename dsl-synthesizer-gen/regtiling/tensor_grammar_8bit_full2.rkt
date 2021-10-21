;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
       ;;(apply concat (list (expr) (expr) (expr) (expr)))
       ;;(apply concat (list (expr) (expr) (expr) (expr) (expr) (expr)))
)]

[mem (choose
        (vector-load arg0 64 0 4 8)
        (vector-load arg0 64 4 4 8)
        (vector-load arg1 192 0 6 8)
        (vector-load arg1 192 6 6 8)
        (vector-load arg1 192 12 6 8)
        (vector-load arg1 192 18 6 8)
        (strided-gather arg0 64 0 4 2 8)
        (strided-gather arg0 64 1 4 2 8)
        (strided-gather arg0 64 2 4 2 8)
        (strided-gather arg0 64 3 4 2 8)
	(strided-gather arg1 192 0 6 4 8)
        (strided-gather arg1 192 1 6 4 8)
        (strided-gather arg1 192 2 6 4 8)
        (strided-gather arg1 192 3 6 4 8)
        (strided-gather arg1 192 4 6 4 8)
        (strided-gather arg1 192 5 6 4 8)
)]

[expr (choose
        (no-op (expr))
        (bv 0 (bitvector 16))
        (bv 0 (bitvector 32))
        (bv 0 (bitvector 48))
	(dsl_inst_0 (expr) (mem) (expr) 2 2 8 8)
	(dsl_inst_0 (expr) (expr) (expr) 2 2 8 8)
        (dsl_inst_0 (expr) (mem) (mem) 2 2 8 8)
	(dsl_inst_0 (mem) (mem) (mem) 2 2 8 8)
        (dsl_inst_1 (expr) 2 8)
	(dsl_inst_1 (mem) 2 8)
	(dsl_inst_1 (expr) 4 8)
	(dsl_inst_1 (mem) 4 8)
	(vector-mac (expr) (expr) (expr) 4 8)
	(vector-mac (expr) (expr) (mem) 4 8)
	(vector-mac (expr) (mem) (mem) 4 8)
	(vector-mac (mem) (mem) (mem) 4 8)
        (vector-add (expr) (expr) 4 8)
	(vector-add (expr) (mem) 4 8)
	(vector-add (mem) (mem) 4 8)
        (vector-mul (expr) (expr) 4 8)
	(vector-mul (expr) (mem) 4 8)
	(vector-mul (mem) (mem) 4 8)
    )]
)
