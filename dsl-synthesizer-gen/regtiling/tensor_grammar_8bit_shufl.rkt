;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
)]

[args (choose
        arg0
        arg1
)]

[mem (choose
        (vector-load arg0 64 0 4 8)
        (vector-load arg0 64 4 4 8)
        (vector-load arg1 192 0 6 8)
        (vector-load arg1 192 6 6 8)
        (vector-load arg1 192 12 6 8)
        (vector-load arg1 192 18 6 8)
)]

[shufl (choose
        (vector-shuffle (mem) (mem) 6 8 (bv #x0006010702080309040a050b 96) 12 8)
        (vector-shuffle (shufl) (shufl) 12 8 (bv #x00010c0d 32) 4 8)
        (vector-shuffle (shufl) (shufl) 12 8 (bv #x02030e0f 32) 4 8)
        (vector-shuffle (shufl) (shufl) 12 8 (bv #x04051011 32) 4 8)
        (vector-shuffle (shufl) (shufl) 12 8 (bv #x06071213 32) 4 8)
        (vector-shuffle (shufl) (shufl) 12 8 (bv #x08091415 32) 4 8)
        (vector-shuffle (shufl) (shufl) 12 8 (bv #x0a0b1617 32) 4 8)
)]

[expr (choose
        ;;arg0
        ;;arg1
        ;;shufl
        (no-op (expr))
        (bv 0 (bitvector 16))
        (bv 0 (bitvector 32))
        (bv 0 (bitvector 48))
	(dsl_inst_0 (expr) (mem) (expr) 2 2 8 8)
	(dsl_inst_0 (expr) (expr) (expr) 2 2 8 8)
        (dsl_inst_0 (expr) (mem) (mem) 2 2 8 8)
        (dsl_inst_1 (expr) 2 8)
	(dsl_inst_1 (mem) 2 8)
        ;;(vector-broadcast (expr) 6 8)
    )]
)
