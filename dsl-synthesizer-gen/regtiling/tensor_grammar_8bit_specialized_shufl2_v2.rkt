;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
)]


[mem (choose
        (vector-load arg0 64 0 4 8)
        (vector-load arg0 64 4 4 8)
        (vector-load arg1 192 0 6 8)
        (vector-load arg1 192 6 6 8)
        (vector-load arg1 192 12 6 8)
        (vector-load arg1 192 18 6 8)
)]

;;[shufl (choose
;;         (vector-shuffle-special (mem) (mem) 6 8)
;;)]

[shufl (choose
        (no-op (shufl))
        (vector-shuffle-special (mem) (mem) 6 8)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 0 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 2 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 4 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 6 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 8 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 10 2)
)]

[expr (choose
        (dsl_inst_0 (bv 0 (bitvector 32)) (mem) (shufl) 2 2 8 8)
        (dsl_inst_1 (expr) 2 8)
        (no-op (expr))
    )]
)
