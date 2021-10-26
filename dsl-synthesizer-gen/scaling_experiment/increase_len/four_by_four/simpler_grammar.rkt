;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
                [top (choose
                       (apply concat (list (expr) (expr) (expr) (expr)  (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)))
                       )]


                [mem (choose
                       (vector-load arg0 128 0 4 8)
                       (vector-load arg0 128 4 4 8)
                       (vector-load arg0 128 8 4 8)
                       (vector-load arg0 128 12 4 8)


                       (vector-load arg1 128 0 4 8)
                       (vector-load arg1 128 4 4 8)
                       (vector-load arg1 128 8 4 8)
                       (vector-load arg1 128 12 4 8)

                       )]



                [expr (choose


                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 0 2) 
                            2 2 8 8)
                          2 8)



                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 2 2) 
                            2 2 8 8)
                          2 8)



                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 4 2) 
                            2 2 8 8)
                          2 8)

                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 6 2) 
                            2 2 8 8)
                          2 8)


                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 8 2) 
                            2 2 8 8)
                          2 8)

                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 10 2) 
                            2 2 8 8)
                          2 8)


                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 12 2) 
                            2 2 8 8)
                          2 8)


                        (dsl_inst_1 
                          (dsl_inst_0
                            (bv 0 (bitvector 64))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                4 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                4 8) 
                              16 8 14 2) 
                            2 2 8 8)
                          2 8)

                        (no-op (expr))
                        )]

                ;;[offset (choose 0 2 4 6 8 10 12 14)]
                )
