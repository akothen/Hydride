(define-grammar (gen-grammar arg0 arg1)
[top (choose (apply concat (list (expr) (expr) (expr) (expr) )) )]

[expr (choose arg0
arg1
(no-op (expr))
(bv 0 (bitvector 32))

(dsl_inst_0 (bv 0 (bitvector 32)) (expr) (expr) 1 4 8 8)

(strided-gather (expr) 64 0 2 4 8)
(strided-gather (expr) 64 1 2 4 8)

(vector-load (expr) 64  0  4  8)
(vector-load (expr) 64  4  4  8)
 )]
)