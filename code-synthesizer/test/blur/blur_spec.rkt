


;; Scalar implementation for tiled blur-x
(define (blur-x img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip 16)
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )
  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvadd
                                               ;; i,j
                                               (ext-bv img (+ (* i  cols) j) ip)
                                               ;; i,j+1
                                               (ext-bv img (+ (* (+ i 1)  cols) j ) ip)
                                               ;; i,j+2
                                               (ext-bv img (+ (* (+ i 2)  cols) j ) ip)
                                               )
                                             )

                            )



                     )

                   (define divide (apply concat (for/list ([k (reverse (range cols))])
                                                          (bvsdiv 
                                                            (ext-bv reduce k ip)
                                                            (ext-bv three k ip)
                                                            )

                                            
                                            
                                            ))
                   )
                   divide
                   )
         )
  )
