;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
                [top (choose
                       (apply concat (list (expr) (expr) (expr) (expr) (expr)   (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)   (expr) (expr) (expr) (expr) (expr) 
                                           (expr) (expr) (expr) (expr) (expr)   (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)   (expr) (expr) (expr) (expr) (expr)
                                            (expr) (expr) (expr) (expr) (expr)   (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)   (expr) (expr) (expr) (expr) (expr)
                                            (expr) (expr) (expr) (expr)
                                           
                                           
                                           
                                           ))
                       )]


                [mem (choose
                       (vector-load arg0 128 0 8 8)
                       (vector-load arg0 128 8 8 8)
                       (vector-load arg0 128 16 8 8)
                       (vector-load arg0 128 24 8 8)
                       (vector-load arg0 128 32 8 8)
                       (vector-load arg0 128 40 8 8)
                       (vector-load arg0 128 48 8 8)
                       (vector-load arg0 128 56 8 8)

                       (vector-load arg1 128 0 8 8)
                       (vector-load arg1 128 8 8 8)
                       (vector-load arg1 128 16 8 8)
                       (vector-load arg1 128 24 8 8)
                       (vector-load arg1 128 32 8 8)
                       (vector-load arg1 128 40 8 8)
                       (vector-load arg1 128 48 8 8)
                       (vector-load arg1 128 56 8 8)

                       (concat (mem) (mem))

                       )]



                [expr (choose
                        ;(bv 0 (bitvector 8))

(dsl_inst_1
                          (dsl_inst_0
                            (bv 0 (bitvector 128))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                8 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                8 8)
                                 16 8 0 8)

                            2 8 8 8)
                          2 8)
                          (dsl_inst_1
                          (dsl_inst_0
                            (bv 0 (bitvector 128))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                8 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                8 8)
                                 16 8 8 8)

                            2 8 8 8)
                          2 8)
                          
                        (no-op (expr))
                        )]

                ;;[offset (choose 0 2 4 6 8 10 12 14)]
                )
