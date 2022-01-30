;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr)  ))
)]


[mem (choose
        (vector-load arg0 32 0 2 8)
        (vector-load arg0 32 2 2 8)
        (vector-load arg1 32 0 2 8)
        (vector-load arg1 32 2 2 8)
)]

[shufl_top (choose
         (vector-shuffle-special (mem) (mem) 2 8)
)]

[shufl (choose
        (vector-shuffle-ext-special (shufl_top) (shufl_top) 4  8 0 2)
        (vector-shuffle-ext-special (shufl_top) (shufl_top) 4  8 2 2)
)]

[expr (choose
        (dsl_inst_0 (bv 0 (bitvector 32)) (mem) (shufl) 1 2 8 8)
        (dsl_inst_1 (expr) 2 8)
        (no-op (expr))
    )]
)
