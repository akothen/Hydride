;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
[top (choose
       ;(apply concat (list (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr)  ))
    
(apply concat (list (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)))
)]


[mem (choose
        (vector-load arg0 128 0 2 8)
        (vector-load arg0 128 2 2 8)
        (vector-load arg0 128 4 2 8)
        (vector-load arg0 128 6 2 8)
        (vector-load arg0 128 8 2 8)
        (vector-load arg0 128 10 2 8)
        (vector-load arg0 128 12 2 8)

        (vector-load arg1 128 0 2 8)
        (vector-load arg1 128 2 2 8)
        (vector-load arg1 128 4 2 8)
        (vector-load arg1 128 6 2 8)
        (vector-load arg1 128 8 2 8)
        (vector-load arg1 128 10 2 8)
        (vector-load arg1 128 12 2 8)
)]



[expr (choose

      (dsl_inst_0

       (bv 0 (bitvector 32))

       (mem)

       (vector-shuffle-ext-special

        (choose

         (vector-shuffle-special

          (mem)

          (mem)

          2

          8))

        (choose

         (vector-shuffle-special

          (mem)

          (mem)
        2 8)) 4 8 0 2) 1 2 8 8)


      (dsl_inst_0

       (bv 0 (bitvector 32))

       (mem)

       (vector-shuffle-ext-special

        (choose

         (vector-shuffle-special

          (mem)

          (mem)

          2

          8))

        (choose

         (vector-shuffle-special

          (mem)

          (mem)
        2 8)) 4 8 2 2) 1 2 8 8)

      ;;(bvadd (expr) (expr))
      ;;(apply bvadd (list (expr) (expr) (expr) (expr)))
      (vector-add (expr) (expr) 4 8)
      (vector-mul (expr) (expr) 4 8)
      (no-op (expr))

    )]
)
