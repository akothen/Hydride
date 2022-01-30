;; Grammar Definition
(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
       (apply concat (list (expr) (expr) (expr) (expr)))
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr)))
)]

[expr (choose
	arg0
	arg1
	(no-op (expr))
	(bv 0 (bitvector 16))
	(bv 0 (bitvector 32))
	(bv 0 (bitvector 96))
	(bv 0 (bitvector 64))
	(bv 0 (bitvector 128))
	(bv 0 (bitvector 48))
	#(dsl_inst_0 (bv 0 (bitvector 32)) (expr) (expr) 2 2 8 8)
	#(dsl_inst_1 (expr) 2 8)
	(dsl_inst_1 (expr) 4 8)
	;;(masked-vector-load arg0 64 0 4 8 (bv #xffffffff 32) 32 8)
	(ext-bv arg0 0 8)
	(ext-bv arg0 1 8)
	(ext-bv arg0 2 8)
	(ext-bv arg0 3 8)
	(ext-bv arg0 4 8)
	(ext-bv arg0 5 8)
	(ext-bv arg0 6 8)
	(ext-bv arg0 7 8)
	;;(vector-broadcast (expr) 6 8)
	(vector-mac (expr) (expr) (expr) 4 8)
	(vector-load arg0 64 0 4 8)
	(vector-load arg0 64 4 4 8)
	(strided-gather arg0 192 0 4 2 8)
	(strided-gather arg0 192 1 4 2 8)
	(strided-gather arg0 192 2 4 2 8)
	(strided-gather arg0 192 3 4 2 8)
	(vector-load arg1 192 0 6 8)
	(vector-load arg1 192 6 6 8)
	(vector-load arg1 192 12 6 8)
	(vector-load arg1 192 18 6 8)
	(vector-load arg1 192 24 6 8)
	(strided-gather arg1 192 0 6 4 8)
	(strided-gather arg1 192 1 6 4 8)
	(strided-gather arg1 192 2 6 4 8)
	(strided-gather arg1 192 3 6 4 8)
	(strided-gather arg1 192 4 6 4 8)
	(strided-gather arg1 192 5 6 4 8)
    )]
)



